#! /usr/bin/env ruby
#
# Read the Candlepin API as represented in JSON or YAML, and turn it
# into Ruby classes.  We do this by manipulating the source hash and
# building the result with pieces of it.  (Which is why we delete keys
# from the source after modifying/replacing them -- because *our* keys
# are symbols rather than strings.)
#
require('rubygems')
$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
require('optparse')
require('json')
require('pp')
require('yaml')
require('candlepin-api/base')

include CandlepinAPI

require('debugger')

options = {
  :ifname	=> nil,
  :ofname	=> nil,
  :cdname	=> nil,
  :apiversion	=> nil,
  :iformat	=> :json,
}

parser = OptionParser.new do |opt|
  opt.on('--api-version NVR', '-V',
         'Explicitly set the version of the API being generated.') do |val|
    options[:apiversion] = val
  end

  opt.on('--input FILE', '-i',
         'Read the API definition from the indicated',
         'file. Default is STDIN.') do |val|
    options[:ifname] = val
  end

  opt.on('--output FILE', '-o',
         'Write the API class definitions to FILE.',
         'Default is STDOUT.') do |val|
    options[:ofname] = val
  end

  opt.on('--command-file FILE', '-c',
         'Write command-line parser configuration to FILE.') do |val|
    options[:cdname] = val
  end

  opt.on('--format FMT', '-f',
         [ 'json', 'yaml' ],
         'Format of the API definition.',
         'Default is JSON.') do |val|
    options[:iformat] = val.to_sym
  end

end

command_argv = ARGV.dup
parser.parse!(command_argv)
#
# We can be given our input file either as a non-option argument
# on the command line, or as a value for the '-i' option.
#
options[:ifname] ||= command_argv[0] || '-'
options[:ofname] ||= '-'

#
# Read in the whole thing at once.
#
if (options[:ifname] == '-')
  slurp = $stdin.read
else
  unless (File.exists?(options[:ifname]))
    $stderr.puts("#{$0}: unable to find file, aborting: #{options[:ifname]}")
    exit(-1)
  end
  slurp = File.read(options[:ifname])
end

#
# Figure out where to write our results.
#
out = (options[:ofname] == '-') ? $stdout : File.open(options[:ofname], 'w')
unless ((cli = options[:cdname]).nil?)
  cli = (cli == '-') ? $stdout : File.open(cli, 'w')
end

raw = nil
if (options[:iformat] == :json)
  raw = JSON.parse(slurp)
elsif (options[:iformat] == :yaml)
  raw = YAML.load(slurp)
end

RAILS_ROOT = '.' unless (defined?(RAILS_ROOT))
keyorder	= [
                   :all_shards,
                   :any_shards,
                   :org_id,
                   :consumer_uuid,
                   :entitlement_id,
                   :product_id
                  ]
flagorder	= [
                   :admin_only,
                   :disallowed,
                   :internal_only
                  ]

#
# Lists of request types that have special processing needs.
#
Call_Type	= {
  :admin_only		=> [
                            :status
                           ],
  :all_shards		=> [
                            :getCurrentCrl,
                            :regenerateEntitlementCertificatesForProduct
                           ],
  :any_shard		=> [
                            :getCertificateSerial,
                            :getProduct,
                            :getRules,
                            :listProduct
                           ],
  :can_create_owner	=> [
                            :createConsumer,
                            :refreshPoolsOwner
                           ],
  :disallowed		=> [
                           ],
  :internal_only	=> [
                            :getSubscription
                           ]
}

Known = {
  'pool'		=> 'pool ID',
  'pool_id'		=> 'pool ID',
  'consumer_uuid'	=> 'consumer UUID',
  'org_id'		=> 'organisation/key/customer ID',
  'owner_key'		=> 'organisation/key/customer ID',
  'entitlement'		=> 'entitlement ID',
  'entitlement_id'	=> 'entitlement ID',
}
Known.default = 'Undocumented.'

cli_output = <<-EOT
#
# Command-line definitions for API#{options[:apiversion] ? (' version ' + options[:apiversion]) : ''} defined in #{options[:ifname]}.
#
require('rubygems')
require('cri')
require('optparse')
require('ostruct')

module CandlepinCLI

EOT

output = <<-EOT
#
# See the doc/candlepin-yaml-description.txt file for details about
# the contents and format of this file.
#
EOT

result = {}

raw.each do |elt|
  #
  # If the definition doesn't include a 'url' field, skip it.
  #
  unless (elt.key?('url'))
    $stderr.puts("no URI path, skipping #{elt['method']}")
    next
  end
  #
  # Get the list of parameters that are embedded in the URI path.
  # NOTE: The Candlepin API doesn't name these with rigourous consistency. :-(
  #
  pathParams = elt['url'].scan(%r!\{[^\}]*\}!).collect { |prm|
    prm.gsub(%r![\{\}]!, '').to_sym
  }

  verifiedParams = [ *elt['verifiedParams'] ].compact.map { |o| o.to_sym }

  #
  # Turn the URI path into the main key for our hash.  We do
  # this *after* extracting the parameters because we're replacing
  # their names in the URI with regex placeholders.
  #
  key = elt['url'].sub(%r!^\/!, '').gsub(%r!\{.*?\}!, '([^/]+)')
  key = '^' << key << '/?$'

  #
  # If this is the first time we've encountered this URI path, create the
  # entry in our result hash.
  #
  if (result[key].nil?)
    result[key] = {
      :pathParams	=> pathParams,
      :verbs		=> [],
      :verifiedParams	=> verifiedParams,
    }
  elsif (! pathParams.empty?)
    result[key][:pathParams] |= pathParams
    result[key][:verifiedParams] |= verifiedParams
  end

  #
  # We've got everything we need from the 'url' field, so delete it from
  # the source hash.
  #
  result[key][:raw_uri] = elt['url']
  elt.delete('url')

  #
  # Now work on the HTTP method (called the 'verb' here because the
  # term 'method' is being overloaded to mean the REST call).
  #
  method = elt['httpVerbs']
  result[key][:verbs].push(method.first.to_sym)

  #
  # There *should* be only one verb in this definition; if there's a
  # multiplicity of 'em, gritch and skip.
  #
  if (method.size > 1)
    $stderr.puts 'Multiple HTTP verbs found for method definition:'
    $stderr.puts(PP.pp(elt, ''))
    next
  end

  #
  # Got the verb name, delete the field.
  #
  elt.delete('httpVerbs')

  #
  # We're not interested in this (occasionally huge) field at *all*.
  #
  elt.delete('returnType')

  #
  # Now use the 'method' field value to figure out a name for this
  # REST call.
  #
  elt[:rqtype] = normalise_rqtype(elt['method'])

  #
  # And the HTTP status codes.
  #
  if (elt.key?('httpStatusCodes'))
    elt[:httpStatusCodes] = elt['httpStatusCodes'].map { |h|
      h['statusCode'].to_i
    }
    elt.delete('httpStatusCodes')
  end

  #
  # Likewise preserve the description.
  #
  if (elt.key?('description'))
    elt[:description] = elt['description']
    elt.delete('description')
  end

  #
  # Query params are unique to each verb.  We do *not* represent them
  # as symbols because they're not overloaded across verbs.
  #
  if (elt.key?('queryParams'))
    elt[:queryParams] = elt['queryParams'].inject({}) { |memo,pelt|
      memo[pelt['name']] = pelt['type']
      memo
    }
    elt.delete('queryParams')
  end

  #
  # Map the various URI keywords.  Messy.
  # N.B.: THIS NEEDS TO BE REVIEWED MANUALLY AT EACH API UPDATE!
  #
  pmap = {}

  #
  # Map especially by request type
  #
  case elt[:rqtype]
  when :unbindConsumer, :unbindEntitlement, :getEntitlement
    pmap[:dbid] = :entitlement_id

  when :deleteConsumerType
    pmap[:id] = :consumertype_id

  when :getEvent
    pmap[:uuid] = :event_id
  end
  #
  # Map by more generic URI parameters
  #
  result[key][:pathParams].each do |pname|
    case pname
    when :serial
      pmap[:serial] = :serial_id

    when :owner_key
      pmap[:owner_key] = :org_id

    when :product_uuid
      pmap[:product_uuid] = :product_id
    end
  end
  (result[key][:pathmap] ||= {}).merge!(pmap) unless (pmap.empty?)

  #
  # Now likewise for the query parameters..
  #
  unless (elt[:queryParams].nil?)
    qmap = {}
    elt[:queryParams].keys.each do |qpname|
      case qpname
      when 'entitlement'
        qmap['entitlement'] = 'entitlement_id'

      when 'product'
        qmap['product'] = 'product_id'

      when 'pool'
        qmap['pool'] = 'pool_id'

      when 'consumer'
        qmap['consumer'] = 'consumer_uuid'

      when 'key'
        qmap['key'] = 'org_id'

      when 'owner'
        if (elt[:rqtype] == :listPool)
          qmap['owner'] = 'owner_id'
        else
          qmap['owner'] = 'org_id'
        end

      end
    end
    unless (qmap.empty?)
      elt[:querymap] ||= {}
      elt[:querymap].merge!(qmap)
    end
  end

  #
  # Now the timeout.. some requests take a long time and we don't want to
  # time out.
  #
  elt[:timeout] = 60

  #
  # Keys are symbols, and can be keywords from the URI or query string.
  # Make sure we translate all of the latter through the appropriate map.
  #
  path_keys = result[key][:pathParams]
  if (result[key].key?(:pathmap))
    path_keys = result[key][:pathParams].collect { |k|
      (result[key][:pathmap][k] || k)
    }
  end
  query_keys = elt[:queryParams].keys
  if (elt.key?(:querymap))
    query_keys = elt[:queryParams].keys.collect { |k| (elt[:querymap][k] || k) }
  end
=begin
  #
  # If a consumer ID can be used, make sure we accept it as a key.
  #
  if (elt[:allowedRoles].include?(:CONSUMER))
    keys[:CONSUMER] << :consumer_uuid
  end
  #
  # Likewise the owner, which is *always* the dominating key (see the keyorder
  # variable up at the top of this file).
  #
  if (elt[:allowedRoles].include?(:OWNER_ADMIN))
    keys[:OWNER_ADMIN] << :org_id
  end
  #
  # Now for the fun.  If the call permits the SUPER_ADMIN role, keys
  # can be taken from the URI and query-string.  Otherwise, only from the
  # username.
  #
  if (super_admin)
    uri_keys = (path_keys + query_keys).collect { |k| k.to_sym }.uniq
    allowed_keys = [
                    :org_id, :owner_id, :username,
                    :consumer_uuid, :entitlement_id, :product_id, :pool_id
                   ]
    intersect = (uri_keys & allowed_keys)
    keys[:SUPER_ADMIN] += intersect unless (intersect.empty?)
  end
  #
  # Speciality paths..
  #
  [ :any_shard, :all_shards ].each do |special_key|
    if (Call_Type[special_key].include?(elt[:rqtype]))
      keys.keys.each { |k| keys[k] << special_key }
    end
  end
  #
  # The keys have been determined.  Potentially set some flags based upon
  # analysis of the results so far.
  #
  keys_by_role = keys.inject({}) { |memo,tuple|
    (k, v) = tuple
    unless (v.empty?)
      memo[k] = v.uniq.sort_by { |k1| keyorder.index(k1) || 100 }
    end
    memo
  }
  elt[:keys_by_role] = keys_by_role
  keys = keys_by_role.values.flatten
=end

  elt[:flags] ||= []
  #
  # Disallow the request if:
  # o the key list is empty, there's no way to route the request;
  # o the request needs input from all shards to be meaningful; or
  # o the request is in our explicit list of 'don't allow' calls
  #
  if (Call_Type[:disallowed].include?(elt[:rqtype]))
    elt[:flags] << :disallowed
  end

  #
  # Mark it as 'admin only' if:
  # o the only role allowed to access it is SUPER_ADMIN; or
  # o the request type is in our explicit list of 'admin-only' endpoints
  #
  if (Call_Type[:admin_only].include?(elt[:rqtype]))
    elt[:flags] << :admin_only
    elt[:flags].delete(:disallowed)
  end

  #
  # Mark it as 'internal only' if:
  # o the only role allowed to access it is SUPER_ADMIN; or
  # o the request type is in our explicit list of 'internal-only' endpoints
  #
  if (Call_Type[:internal_only].include?(elt[:rqtype]))
    elt[:flags] << :internal_only
  end

  #
  # Similarly for those entrypoints that might result in populating
  # the shard with an owner record.
  #
  if (Call_Type[:can_create_owner].include?(elt[:rqtype]))
    elt[:flags] << :can_create_owner
  end
  elt[:flags] = elt[:flags].uniq.sort_by { |k| flagorder.index(k) || 100 }

  #
  # At this point, the 'elt' structure now contains all the reworked info
  # about this verb.  Load it into our result hash.
  #
  result[key][method.first] = elt
end

class Hash
  #
  # Replacing the to_yaml function so it'll serialize hashes sorted
  # (by their keys)
  #
  # Original function is in /usr/lib/ruby/1.8/yaml/rubytypes.rb
  def to_yaml(opts={})
    YAML::quick_emit(object_id, opts) do |out|
      out.map(taguri, to_yaml_style) do |map|
        sorted_keys = keys
        sorted_keys = begin
                        sorted_keys.sort
                      rescue
                        sorted_keys.sort_by { |k|
                          result = k.to_s
                          case
                          #
                          # List the :pathparams field first in a path
                          # definition.
                          #
                          when (k == :pathParams)
                            result = (0x00.chr * 8)
                          when (k == :pathmap)
                            result = (0x00.chr * 7) + 0x01.chr
                          #
                          # The following bit of weirdness is intended to
                          # list the disallowed methods for a path after
                          # its allowed ones.
                          #
                          when ((elt = fetch(k)).kind_of?(Hash) \
                                && elt.key?(:flags) \
                                && (elt[:flags].include?(:disallowed)))
                            result = (0xff.chr * 8)
                          else
                            result = k.to_s
                          end
                          result
                        } rescue sorted_keys
                      end

        sorted_keys.each do |k|
          map.add(k, fetch(k))
        end
      end
    end
  end
end

def mandatory?(endpoint, param)
  psym = param.to_sym
  vlist = endpoint[:verifiedParams]
  pmap = endpoint[:pathmap]
  return (vlist.include?(psym) || (pmap && vlist.include?(pmap[psym])))
end

PlaceHolderRE = %r!\(\[\^/\]\+\)!

out.print(<<-EOT)
require('rubygems')
require('net/http')
require('uri')

require('candlepin-api/base')
require('candlepin-api/entrypoint-extensions')

module CandlepinAPI

EOT

result.keys.sort.each do |p|
  path = p.dup
  result[p][:pathParams].each do |prm|
    param = result[p][:pathmap][prm] unless (result[p][:pathmap].nil?)
    param ||= prm
    path.sub!(PlaceHolderRE, "_by_#{param.to_s}")
  end
  path.gsub!(%r![^_a-z0-9]!i, '_')
  path.gsub!(%r!_{2,}!, '_')
  path.sub!(%r!^_!, '').sub!(%r!_$!, '')
  path = path.split(%r!_!).collect { |w| w.capitalize }
  path = path.join('_').gsub(%r!_by_!i, '_by_')
  endpoint = 'Endpoint_' << path

  out.puts(<<-EOT)
  #
  # REST endpoint definition
  #
  class #{endpoint} < Endpoint

    URI_Regex_String	= '#{p}'
    URI_Regex		= Regexp.new(URI_Regex_String)
  EOT
  unless (result[p][:pathParams].empty?)
    indent = "\t\t\t  "
    out.print("    PathParams\t\t= [\n#{indent} " +
              result[p][:pathParams].collect { |w| "'#{w}'" }.join(",\n#{indent} ") +
              ",\n#{indent}]\n")
    pathmap = result[p][:pathParams].inject({}) { |memo,k| memo[k] = k ; memo }
    pathmap.merge!(result[p][:pathmap]) unless (result[p][:pathmap].nil?)
    pathmap.each do |k,v|
      out.puts("    attr_accessor(#{v.inspect})")
      next if (k == v)
      out.puts("    alias_method(#{k.inspect}, #{v.inspect})")
      out.puts("    alias_method(#{k.inspect}=, #{v.inspect}=)")
    end

    out.print("    PathMap\t\t= PathMap.merge({\n")
    indent = "\t\t\t\t\t"
    pathalii = pathmap.collect { |k,v| "'#{k}' => '#{v}'" }
    pathalii = pathalii.sort.join(",\n#{indent}  ")
    out.print("#{indent}  #{pathalii}\n#{indent}})\n")
    indent = "\t\t\t  "

    out.print("    VerifiedParams\t= [")
    if (result[p][:verifiedParams].empty?)
      out.puts(']')
    else
      out.print("\n#{indent} " +
                result[p][:verifiedParams].collect { |w|
                  "'#{pathmap[w]}'"
                }.join(",\n#{indent} ") +
                ",\n#{indent}]\n")
    end

  end

  vmap = result[p][:verbs].inject({}) { |memo,verb|
    rqtype = result[p][verb.to_s][:rqtype].to_s
    rqtype[0,1] = rqtype[0,1].upcase
    memo[verb] = rqtype.to_sym
    memo
  }
#  out.print("    Verbs = Verbs.merge({\n")
#  indent = '                        '
#  valii = vmap.collect { |k,v| "'#{k}' => '#{v}'" }
#  valii = valii.sort.join(",\n#{indent}  ")
#  out.print("#{indent}  #{valii}\n#{indent}})\n")
  out.print(<<-EOT)

    Verbs = {
    }
    CandlepinAPI::Endpoint.add(self)

  end  # REST endpoint class #{endpoint}

  #
  # Classes for access by HTTP method/verb
  # to endpoint Endpoint_#{path}
  #
  EOT

  vmap.each do |verb,klass|
    elt = result[p][verb.to_s.upcase]
    desc = nil
    unless (elt[:description].nil? || elt[:description].strip.empty?)
      desc = elt[:description].split(%r!\s*[\r\n]+\s*!)
      indent = '    #'
      desc = ("#{indent}" +
              "\n#{indent} #{desc.join("\n#{indent} ")}\n" +
              "#{indent}\n\n")
    end

    cli_desc = (elt[:description] \
                || 'No description available for this entrypoint.')
    cli_desc = cli_desc.split(%r!\s*[\r\n]\s*!).join("\n")
    cli_output << (<<-EOT)
  CandlepinCLI.subcommand('#{klass.to_s}') do |cdef,*args|
    name = args[0]
    cdef.usage(name + ' [OPTIONS]')
    cdef.summary("#{elt['method']}")
    cdef.description(<<-EOD)
#{cli_desc}

    REST: #{verb.to_s.upcase} /candlepin#{result[p][:raw_uri]}

    If sending data as part of the request, use the
    '--data'/'-d' option.  The value of the option
    may be a JSON string, or '@<filename>', in which
    case the contents of the file will be used as the
    request body.  If the filename is '-', the
    content will be read from stdin.
    EOD
    EOT

    params = []
    if (result[p][:pathParams].kind_of?(Array))
      params << result[p][:pathParams].map { |p| p.to_s }
    end
    params = params.flatten.compact.sort
#debugger if (result[p].key?(:pathmap))
    params.each do |param|
      alt = result[p][:pathmap] && result[p][:pathmap][param.to_sym]
      dtype = Known[param]
      if (dtype != Known.default)
        dtype = ((dtype[0,1] =~ %r!aeiou!i) ? 'An ' : 'A ') + dtype + '.'
      end
      dtype = ('[Mandatory] ' + dtype) if (mandatory?(result[p], param))
      cli_output << (<<-EOT)
    cdef.required(nil, #{(alt || param).to_sym.inspect},
                  "#{dtype}") do |value,cmd|
      CandlepinCLI.options.#{alt || param} = value
    end
      EOT
      if (alt && (alt != param))
        cli_output << (<<-EOT)
    cdef.required(nil, #{param.to_sym.inspect},
                  "Synonym for --#{alt}") do |value,cmd|
      CandlepinCLI.options.#{alt} = value
    end
        EOT
      end
    end

    #
    # Now the query parameters.
    #
    params = []
    if (elt[:queryParams].kind_of?(Hash))
      params << elt[:queryParams].keys
    end
    params = params.flatten.compact.sort
    params.each do |param|
      dtype = Known[param]
      dtype = nil if (dtype == Known.default)
      decl_type = elt[:queryParams][param]
      if (elt[:queryParams] && decl_type)
        if (dtype.nil?)
          dtype = decl_type
          dtype = 'integer' if (decl_type == 'long')
          dtype = dtype.capitalize if (decl_type == 'boolean')
        end
        if (decl_type[-2,2] == '[]')
          dtype.sub!(%r!\[\]$!, '')
          dtype = "list of #{dtype}s"
        end
        if (dtype =~ %r!^[aeiou]!i)
          dtype = "An #{dtype}."
        else
          dtype = "A #{dtype}."
        end
      else
        dtype = 'Undocumented.'
      end
      dtype = '[Query argument] ' + dtype
      dtype = ('[Mandatory] ' + dtype) if (mandatory?(result[p], param))
      cli_output << (<<-EOT)
    cdef.required(nil, #{param.to_sym.inspect},
                  "#{dtype}") do |value,cmd|
      CandlepinCLI.options.#{param} = value
    end
      EOT
    end

    cli_output << (<<-EOT)  
    cdef.run do |opts,args,cmd2|
      CandlepinCLI.context.entrypoint = eval('CandlepinAPI::#{klass.to_s}')
    end
  end                           # entrypoint #{klass.to_s}

    EOT

    out.print(<<-EOT)
  class #{klass.to_s} < #{endpoint}
    #
    # #{verb.to_s.upcase} /candlepin#{result[p][:raw_uri]}
    #

    include EntrypointExtensions

    API_Method_Full_Name = '#{elt['method']}'

    EOT

    cli_output << (<<-EOT)
    EOT

    out.print(desc) unless (desc.nil?)
    out.print("    Verb\t\t= #{verb.to_sym.inspect}\n" +
          "    self.endpoint.const_get('Verbs')[Verb] = self\n")
    verb = verb.to_s
    elt = result[p][verb]
=begin
    roles = elt[:allowedRoles].collect { |w| w.to_sym.inspect }
    out.print("    AllowedRoles = [ #{roles.join(', ')} ]\n")
    out.print("    Keys_by_Role = {\n")
    indent =  '    '
    unless (elt[:keys_by_role].empty?)
      keylist = elt[:keys_by_role].collect { |k,v|
        "#{indent}  '#{k}' => '#{v}'"
      }
      out.print("#{keylist.join(",\n")}\n")
    end
    out.print("#{indent}}\n")
=end
    unless (elt[:flags].empty?)
      out.print("    API_Flags\t\t= API_Flags.merge({\n")
      indent = "\t\t\t\t"
      fmap = elt[:flags].collect { |f| "#{indent}  #{f.inspect} => true" }
      out.print("#{fmap.sort.join(",\n")}\n#{indent}})\n")
    end
    out.print("    HTTPStatusCodes\t= [ " +
              elt[:httpStatusCodes].collect { |w| w }.join(', ') +
              " ]\n")
    unless (elt[:queryParams].empty?)
      out.print("    QueryParams\t\t= [\n\t\t\t    " +
                elt[:queryParams].keys.collect { |w| "'#{w}'" }.join(",\n\t\t\t    ") +
                ",\n\t\t\t  ]\n")
      querymap = elt[:queryParams].keys.inject({}) { |memo,k|
        memo[k] = k
        memo
      }
      querymap.merge!(elt[:querymap]) unless (elt[:querymap].nil?)
      out.print("    QueryMap\t\t= QueryMap.merge({\n")
      indent = "\t\t\t\t\t "
      queryalii = querymap.collect { |k,v| "'#{k}' => '#{v}'" }
      queryalii = queryalii.sort.join(",\n#{indent}  ")
      out.print("#{indent}  #{queryalii},\n#{indent}})\n")
      elt[:queryParams].each do |queryParam,dtype|
        out.puts("    attr_accessor(#{queryParam.to_sym.inspect})")
        if (elt.key?(:querymap) && elt[:querymap].kind_of?(Hash))
          alii = elt[:querymap].select { |k,v|
            v.to_sym == queryParam.to_sym
          }
          alii.each do |alium|
            out.puts("    alias_method(#{alium.to_sym.inspect}, " +
                     "#{queryParam.to_sym.inspect})")
          end
        end
      end
    end
    out.print("    TimeLimit = #{elt[:timeout]}\n") if (elt[:timeout] != 60)
    out.print("\n    def rqtype" +
              "\n      return #{elt[:rqtype].inspect}" +
              "\n    end\n")
    out.print("\n  end  # REST entrypoint class #{klass.to_s}\n\n")
  end

end

out.puts('end')

out.close unless (out == $stdout)

if (cli)
  cli_output << (<<-EOT)

end                             # module CandlepinCLI
  EOT
  cli.puts(cli_output)
  cli.close unless (cli == $stdout)
end
