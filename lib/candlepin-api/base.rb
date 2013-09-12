require('rubygems')
require('rack')
require('candlepin-api/hash2instance')

begin
  require('debugger')
rescue LoadError
  require('ruby-debug')
end

#
# Classes for realising the Candlepin API in code.
#
# There'll be a class for each endpoint, and for each supported verb
# (entry point) for each endpoint.  Because of inheritance issues, the
# same base class is used for all, and different subsets of the
# methods/attributes used as appropriate to the conditions.
#
# One goal is to use these for parsing a request from a client;
# another goal is to be able to *create* a request as though it came
# from a client.  Thus we should hopefully be able to do away with a
# lot of internal knowledge or special-casing.
#
# The class methods access the fixed attributes of each endpoint
# or endpoint/verb combination.  The instance variables are for
# those values specific to a particular request.  For instance,
# the class method {ListProduct#admin_only?} indicates whether that
# verb can only be accessed via the super-admin role.
#
# For simplicity's sake (?) the class methods are available from
# instances as well.  {ListProduct#admin_only?} and {ListProduct.new#admin_only?}
# return the same value.  So the object representing the current
# request can be directly queried without resorting to determining
# its class first.
#
module CandlepinAPI

  #
  # Base class for module-specific exceptions.
  #
  class APIError < StandardError ; end

  #
  # There's a problem with how the API version was specified.  The
  # message text contains details.
  #
  class BadAPIVersion < APIError ; end

  #
  # This refers to the default module-wide URI for the Candlepin
  # server.  If individual entrypoint instances don't set their own,
  # this is what will be used.
  #
  attr_accessor(:server_uri)
  module_function(:server_uri, :server_uri=)

  #
  # Like {#server_uri}, this allows setting default Basic
  # Authentication credentials module-wide.  They can be overridden on
  # an instance-by-instance basis.
  #
  # @param [nil,Array<String>] args_p
  # @return [nil,Array<String>]
  #   This will either return `nil` (if no credentials have been set
  #   module-wide) or a two-element array containing the basic-auth
  #   username and password.
  #
  def basic_auth(*args_p)
    unless ([0, 2].include?(args_p.size))
      raise ArgumentError.new('wrong number of arguments ' +
                              "(#{args_p.size} for 0 or 2)")
    end
    if (args_p.size == 2)
      @basic_auth_credentials = args_p.dup
    end
    return @basic_auth_credentials
  end
  module_function(:basic_auth)

  #
  # @!attribute [w] basic_auth
  #
  # Related to {#basic_auth} but allows setting the credentials using
  # the more canonical syntax.
  #
  # @return [nil,Array<String>]
  #
  def basic_auth=(username, password)
    return basic_auth(username, password)
  end
  module_function(:basic_auth=)

  #
  # REST parameters appearing in the URI path are represented by a
  # regular-expression placehold for easy extraction.
  #
  Placeholder_RE	= Regexp.new(Regexp.escape('([^/]+)'))

  #
  # Turn the convoluted method path into a simple name for an entrypoint.
  #
  # @param [String] mname
  #   Java-ish method name path.
  # @return [String]
  #   Method (entrypoint) name reduced to a single camel-cased word
  #   for easier consumption by humans.
  #
  def normalise_rqtype(mname=self.class.const_get('API_Method_Full_Name'))
    methname = mname.sub(%r!^org(?:\.fedoraproject)?\.candlepin\.resource\.!i, '')
    (rtype, opname) = methname.split(%r!\.!)
    rtype.sub!(%r!Resource$!, '')
    opname << rtype unless (opname =~ %r!#{rtype}!i)
    return opname.to_sym
  end

  #
  # Given a REST URI path containing placeholders, replace them with
  # '%s' printf format effectors for generation of a useable path.
  #
  # @param [String] path_p
  #   REST path containing embedded placeholder expressions.
  # @return [String]
  #   REST path suitable for path parameter insertion with `sprintf`.
  # @see Placeholder_RE
  #
  def regex2printf(path_p)
    path = path_p.gsub(Placeholder_RE, '%s')
    path = path.sub(%r!^\^!, '/candlepin/').sub(%r!/\?\$$!, '/')
    return path
  end

  #
  # Superclass for all Candlepin endpoint (URI paths, exclusive of
  # query parameters and HTTP method).  Entrypoints (which include the
  # query parameters and HTTP method) subclass the appropriate
  # endpoint class.
  #
  class Endpoint < Sublime::Hash2Instance

    include CandlepinAPI

    #
    # Stuff relating to the endpoint (URI) itself.  We preset this as empty
    # because the subclasses merge stuff into them for their specific
    # needs.
    #

    #
    # Array of API-defined keywords for the placeholders in the URI.
    #
    PathParams		= []

    #
    # Hash mapping values from the URI to keywords.  This is needed because
    # the API keywords aren't completely consistent.  The map will resolve
    # various alternatives into the canonical keyword Clonepin uses.
    #
    PathMap		= {
    }

    #
    # Hash of HTTP methods mapped to the verb class representing them.
    #
    # @example
    #   Verbs[:GET] => SomeGetAction
    #
    # Verb classes self-register here as part of their definitions.
    #
    Verbs		= {
    }

  end     # End of class CandlepinAPI::Endpoint

  #
  # Re-open the superclass to add another blob of functionality (class
  # methods).
  #
  class Endpoint

    #
    # Open the eigenclass to add class methods relating to endpoint
    # attributes and actions.
    #
    class << self

      include Enumerable

      #
      # Hash mapping the regular expressions for the endpoint URIs
      # to the corresponding endpoint classes.
      #
      attr_writer(:path_regex_map)
      attr_writer(:path_string_map)
      attr_writer(:path_string2regex)

      #
      # @!attribute [r] path_regex_map
      #
      # Add reader methods that makes sure the instance variables are
      # always hashes.
      #
      def path_regex_map
        return (@path_regex_map ||= {})
      end

      # @see #path_regex_map
      def path_string_map
        return (@path_string_map ||= {})
      end

      # @see #path_regex_map
      def path_string2regex
        return (@path_string2regex ||= {})
      end

      #
      # Needed for Enumerable (the registered endpoints are our list).
      #
      def each(&block)
        return self.path_string_map.each(&block)
      end

      #
      # Access the endpoints directly by path.  Or by regex.  (Complicated,
      # that, since the keys are themselves regexes.  Caveat emptor.)
      #
      # @return [Hash]
      #   Returns a hash for a single match, or an array of
      #   `{ path-as-regex => hash }` for multiple matches.
      #
      # @todo Fix bug:
      #  The following are coming up empty:
      #   /candlepin//owners/([^/]+)/consumers
      #   /consumers/_%consumer-uuid%/certificates/serials
      #   /owners/([^/]+)/consumers
      # Leading slash problem?
      #
      # @todo Add [] method to endpoints that looks up verb classes
      #   (<i>e.g.</i>, `endpoint[:GET]`)
      #
      def [](key_p)
        #
        # Look for exact matches.
        #
        return result if (result = self.path_regex_map[key_p])
        return result if (result = self.path_string_map[key_p])
        #
        # Try treating the argument as a path and find entries that
        # match it.
        #
        if (key_p.kind_of?(String))
          key = key_p.sub(%r!^.*/candlepin/!, '')
          key.sub!(%r!^/+!, '')
          key.sub!(%r!\?.*!, '')
          result = self.select(:regex) { |pat,klass| key =~ pat }
          unless (result.empty?)
            if (result.size > 1)
              #
              # We have multiple matches.  It's possible that our key
              # has a keyword where some entrypoints expect it but others
              # have a placeholder.  E.g., both of the following will
              # match 'consumers/<consumer-uuid>/certificates/serials',
              # but only the first match is actually correct:
              #
              # ^consumers\/([^\/]+)\/certificates\/serials\/?$
              # ^consumers\/([^\/]+)\/certificates\/([^\/]+)\/?$
              #
              # Cheat by picking the one with the fewest pathparams
              # (and praying).  If more than one have the same value
              # for 'fewest', it's a legitimate duplicate.  That's our
              # assumption and we're sticking to it.
              #
              result.sort! { |a,b|
                aParams = a.values[0].const_get('PathParams')
                bParams = b.values[0].const_get('PathParams')
                aParams.size <=> bParams.size
              }
              minparams = result[0].values[0].const_get('PathParams').size
              result.delete_if { |o| o.values[0].const_get('PathParams').size > minparams }
            end
            result = result.first if (result.size == 1)
            return result
          end
        end
        #
        # Try treating the argument as a regex used to match a path pattern.
        #
        results = self.path_string_map.inject([]) { |memo,tuple|
          (ep, elt) = tuple
          if (ep =~ Regexp.new(key))
            memo << { self.path_string2regex[ep] => elt }
          end
          memo
        }
        return results.empty? ? nil : results
      end                       # def []

      #
      # Override the Enumerable method because we don't fit perfectly.
      #
      # @param [Symbol> mode
      # @return [nil,Array<Hash>]
      #
      def select(mode=:regex)
        source = mode.eql?(:regex) ? self.path_regex_map : self.path_string_map
        interim = source.select { |regex,endpoint|
          match = yield(regex, endpoint)
        }
        #
        # We now have an array or arrays.  Yuck.  Turn it back into an
        # array of hashes.
        #
        result = []
        while (tuple = interim.shift)
          result << { tuple[0] => tuple[1] }
        end
        return result
      end                       # def select

      def find(&block)
        result = self.select(&block)
        return result.empty? ? nil : result.first
      end                       # def find

      def size
        return self.regex_map.size
      end                       # def size

      def regex_keys
        return self.path_regex_map.keys
      end                       # def regex_keys

      def string_keys
        return self.path_string_map.keys
      end                       # def string_keys

      def keys
        return self.regex_keys
      end                       # def keys

      def key?(key)
        return self.path_regex_map.key?(key) || self.path_string_map.key?(key)
      end                       # def key?

      def valid_responses
        return self.const_get('HTTPStatusCodes')
      end                       # def valid_responses

      def valid_response?(rsp)
        codes = self.const_get('HTTPStatusCodes')
        return false if (codes.empty?)
        if (rsp.kind_of?(Integer))
          code = rsp
        elsif (rsp.kind_of?(String))
          code = rsp.to_i
        elsif (rsp.respond_to?(:code))
          code = rsp.code.to_i
        end
        return codes.include?(code)
      end                       # def valid_response?

      #
      # Add an endpoint class to the map.  The endpoint classes invoke
      # this as part of their definitions.
      #
      def add(klass)
        self.path_regex_map[klass.path_regex] = klass
        self.path_string_map[klass.path_string] = klass
        self.path_string2regex[klass.path_string] = klass.path_regex
      end                       # def add

      #
      # Turn an entrypoint into an HTTP verb (method)
      #
      def ep2verb(req, &block)
        result = self.select(req, &block)
        #
        # No endpoints matched the URI?  D'oh..
        #
        return nil if (result.empty?)
        #
        # Find the verb class for the endpoint that works for the request.
        #
        result = result.collect { |tuple|
          (regex, endpoint) = tuple
          klass = endpoint.verbs[req.method.to_s.upcase.to_sym]
          klass.new(req) unless (klass.nil?)
        }
        #
        # #collect maintains the array length, so delete the nil elements.
        #
        result.compact!
        #
        # If there's nothing left, we found a matching endpoint, but the
        # HTTP method isn't supported for it.
        #
        if (result.empty?)
          result = nil
        elsif (result.size == 1)
          result = result.first
        end
        #
        # We'll either be returning a scalar or an array, depending on
        # the number of classes that matched the request.  There *should*
        # only be one, but that's for our caller to finesse.
        #
        return result
      end                       # def ep2verb

      #
      # Consult the map to obtain the canonical name for a parameter
      # embedded in the URI.
      #
      def pparam(name_p)
        name = name_p.to_sym
        return const_get('PathMap')[name].to_sym || name
      end                       # def pparam
      alias_method(:pathparam, :pparam)

      #
      # Helper to fetch the URI regular expression for the endpoint.
      # Just to avoid using Foo::URI_Regex constant syntax, which
      # can be a little confusing.
      #
      def path_regex
        return const_get('URI_Regex')
      end                       # def path_regex

      #
      # As above, except it gets the raw pattern before it's turned into
      # a regex.
      #
      def path_string
        return const_get('URI_Regex_String')
      end                       # def path_string

      #
      # Another helper to access the map of available verb classes for
      # the endpoint.
      #
      def verbs
        return const_get('Verbs')
      end                       # def verbs

    end                         # End of Endpoint eigenclass

  end                           # End of class CandlepinAPI::Endpoint

  #
  # Re-open the class to add another blob of functionality (instance
  # methods and constants).
  #
  class Endpoint

    #
    # Instance methods, for attributes determined and accessed at
    # runtime.
    #

    # @see CandlepinAPI#basic_auth
    def basic_auth(*args_p)
      unless ([0, 2].include?(args_p.size))
        raise ArgumentError.new('wrong number of arguments ' +
                                "(#{args_p.size} for 0 or 2)")
      end
      if (args_p.size == 2)
        @basic_auth_credentials = args_p.dup
      end
      return @basic_auth_credentials || CandlepinAPI.basic_auth
    end                         # def basic_auth

    # @see CandlepinAPI#basic_auth=
    def basic_auth=(username, password)
      return basic_auth(username, password)
    end                         # def basic_auth=

    # @see CandlepinAPI#server_uri=
    def server_uri=(uri)
      @server_uri = uri
    end                         # def server_uri=

    # @see CandlepinAPI#server_uri
    def server_uri
      ancestry = [ self, self.class.ancestors ].flatten
      klass = ancestry.find { |anc|
        anc.respond_to?(:server_uri) && anc.instance_variable_get(:@server_uri)
      }
      return klass.nil? ? nil : klass.instance_variable_get(:@server_uri)
    end                         # def server_uri

    def submit(options_p={})
      options = options_p.dup
      options.each do |k,val|
        k_sym = k.to_sym
        k_str = k.to_s
        if ((self.class.const_defined?('QueryParams') \
             && self.class.const_get('QueryParams').include?(k_str)) \
            || (self.class.const_defined?('PathParams') \
                && self.class.const_get('PathParams').include?(k_str)))
          self.send((k_str + '=').to_sym, val)
          options.delete(k)
        end
      end
      unless (self.have_params?)
        raise CandlepinAPI::APIError.new('missing required parameters: ' +
                                         self.missing_params.inspect)
      end
      unless (self.server_uri.kind_of?(String))
        raise CandlepinAPI::APIError.new('no server_uri specified ' +
                                         'for request submission')
      end

      uri = URI.parse(self.to_s.split(%r!\s+!)[1])
      rqclass = Net::HTTP.module_eval(self.class.const_get('Verb').to_s.downcase.capitalize)
      rqobj = @net_http_request = rqclass.new(uri.request_uri)
      @request_uri = uri.to_s
      connexion = Net::HTTP.start(uri.host, uri.port)
      #
      # @todo Merge in default options from upstream
      #
      unless (options.key?(:basic_auth) \
              || CandlepinAPI.basic_auth.nil?)
        rqobj.basic_auth(*CandlepinAPI.basic_auth)
      end
      if (@request_header.kind_of?(Hash))
        @request_header.each { |h_k,h_v| rqobj[h_k.to_s] = h_v.to_s }
      end
      options.each do |opname,opval|
        case opname.to_sym
        when :basic_auth
          rqobj.basic_auth(*opval)
        when :headers
          opval.each { |h_k,h_v| rqobj[h_k.to_s] = h_v.to_s }
        when :read_timeout
          connexion.read_timeout = opval
        end
      end
      rqobj['Content-type'] = 'application/json' unless (rqobj['Content-type'])
      @request_body ||= @body
      @raw_response = connexion.request(rqobj, @request_body)
      connexion.finish
      return @raw_response
    end                         # def submit

    #
    # Our as-a-string rendition is the URI path with all appropriate
    # values filled in.  Easily automated; I love that.
    #
    def to_s
      path = self.class.const_get('URI_Regex_String').sub(%r!^\^!, '/candlepin/')
      path.sub!(%r!/\?\$!, '/')
      path.gsub!(Placeholder_RE, '%s')
      args = self.class.const_get('PathParams').map { |m|
        self.__send__(self.class.const_get('PathMap')[m]) || "{#{m.to_s}}"
      }

      path = path % args
      if (self.server_uri)
        uri = URI.parse(self.server_uri)
        if (uri.path =~ %r!/candlepin$!)
          path.sub!(%r!^/candlepin!, '')
        end
        path.sub!(%r!^/!, '') if (uri.path[-1,1] == '/')
        uri.path << path
        path = uri.to_s
      end
      #
      # The verb-invariant portion is done.  If that's it (i.e., the
      # QueryParams constant isn't defined [as is the case for an endpoint
      # rather than a endpoint+verb], or the list of query-parameter names
      # is empty), we need go no farther.
      #
      if ((! self.class.const_defined?('QueryParams')) \
          || self.class.const_get('QueryParams').empty?)
        return path
      end
      #
      # Load up any query-string arguments into the string.
      #
      qargs = self.class.const_get('QueryParams').map { |k|
        result = nil
        unless ((v = self.__send__(k.to_sym)).nil?)
          result = "#{k.to_s}=#{v}"
        end
        result
      }
      #
      # Any query parameters with no values assigned will be represented
      # in the array by nil, so we can zap 'em out easily.
      #
      qargs.compact!
      #
      # If there really were some values, add them
      #
      unless (qargs.empty?)
        path << '?' << qargs.join('&')
      end
      #
      # Done!  The result is the path plus querystring for the object.
      #
      return path
    end                         # def to_s

    #
    # Instance methods that simply makes the class methods available at
    # the object level.
    #
    def pparam(name)
      return self.class.pparam(name)
    end                         # def pparam
    alias_method(:path_param, :pparam)

    def verbs
      return self.class.verbs
    end                         # dev verbs

    def valid_responses
      return self.class.valid_responses
    end                         # def valid_responses

    def valid_response?(rsp)
      return self.class.valid_response?(rsp)
    end                         # def valid_response?

    #
    # Stuff relating to a specific method/verb applied to the endpoint.
    # These are the bits constituting the 'verb class' aspect of this shared
    # class definition.
    #
    # #missing_params and #have_params? are intended as helpers when
    # building a request.
    #
    def missing_params
      pparam_list = self.class.const_get('PathParams')
      return [] if (pparam_list.empty?)
      pparam_list = pparam_list.map { |ppname|
        self.class.const_get('PathMap')[ppname]
      }
      return (pparam_list.select { |s| self.__send__(s.to_sym).nil? })
    end                         # def missing_params

    def have_params?
      return (self.missing_params.empty?)
    end                         # def have_params?

    #
    # As above, these constants are pre-set as empty so that the subclasses
    # have something upon which to build.
    #

    #
    # Roles (.e.g, :SUPER_ADMIN) that are permitted to access this
    # verb entry point.
    #
    AllowedRoles	= []

    #
    # Restrictions or special qualities of a verb entry point.  All default
    # to false; individual class definitions turn appropriate ones on.
    #
    API_Flags		= {
      :admin_only	=> false,
      :can_create_owner	=> false,
      :disallowed	=> false,
      :internal_only	=> false
    }

    #
    # Different roles can use different keys.  The :SUPER_ADMIN role
    # can use 'em all, but others can't use values from the URI, for
    # example.
    #
    Keys_by_Role	= {
    }

    #
    # See the explanation above about the PathParams and PathMap constants.
    #
    QueryParams		= []
    QueryMap		= {
    }
    ReturnType		= {}
    HTTPStatusCodes	= []
    VerifiedParams	= []

    #
    # How long a request is allowed to run without a response.
    #
    TimeLimit		= 60

    #
    # Instance variables for the values pulled from the URI.  We
    # maintain these as an alternate datastore in case there happens
    # to be a named parameter duplicated in both locations.  This
    # shouldn't happen, since pathparam names are represented as
    # symbols and query parameter names as strings.
    #
    attr_reader(:pathparams)
    attr_reader(:queryparams)

  end                           # End of class CandlepinAPI::Endpoint

  class Endpoint

    #
    # And now the class methods relating to the verb-class mode of usage.
    #
    class << self

      #
      # Pointer back to the endpoint for this verb.
      #
      def endpoint
        return self.ancestors.find { |o| o.name =~ %r!(?:^|::)Endpoint_! }
      end

      #
      # See the explanation above for the pparam class method.
      #
      def qparam(name_p)
        name = name_p.to_s
        return const_get('QueryMap')[name].to_s || name
      end

      #
      # Helpers for access to the 'verb class' constants.
      #
      def allowed_roles
        return const_get('AllowedRoles').collect { |k| k.to_sym }
      end
      def timelimit
        return const_get('TimeLimit')
      end
      def verb
        return const_get('Verb').to_sym
      end
      alias_method(:method, :verb)

      #
      # Return an array of the flags set to 'true' for the verb entry point.
      #
      def flags
        return const_get('API_Flags').collect { |k,v| k.to_sym if (v) }.compact
      end

      #
      # Helpers for access to the individual flag states.
      #
      def admin_only?
        return const_get('API_Flags')[:admin_only] || false
      end
      def can_create_owner?
        return const_get('API_Flags')[:can_create_owner] || false
      end
      def disallowed?
        return const_get('API_Flags')[:disallowed] || false
      end
      def internal_only?
        return const_get('API_Flags')[:internal_only] || false
      end

    end                         # End of Endpoint eigenclass (second part)

  end # End of class CandlepinAPI::Endpoint

  class Endpoint

    #
    # Instance method for the query parameter name canonicalisation.
    # See #pparam above.
    #
    def qparam(name)
      return self.class.qparam(name)
    end

    #
    # So far the class definition has concerned static pre-defined
    # API attributes relevant to the endpoint.  However, these
    # classes are intended to be instantiated for actual corresponding
    # requests.  Here's where we define the stuff relevant for
    # runtime info.
    #

    #
    # Values of special request header fields.
    #
    attr_accessor(:auth_username)
    attr_accessor(:auth_password)

    attr_accessor(:org_id)
    attr_accessor(:consumer_uuid)
    attr_accessor(:entitlement_id)
    attr_accessor(:pool_id)
    attr_accessor(:username)

    attr_reader(:net_http_request)

    # :stopdoc:

    protected

    def get_admin_credentials
      if (@admin_username.nil? || @admin_password.nil?)
        @admin_username = Settings.shard_credentials.username
        @admin_password = Settings.shard_credentials.password
      end
    end

    def check_for_admin
      self.get_admin_credentials
      if ((@auth_username == @admin_username) \
          && (@auth_password == @admin_password))
        @role = :SUPER_ADMIN
      end
    end

    public

    # :startdoc:

    def auth_username=(val)
      @auth_username = val
      self.check_for_admin
      return val
    end
    def auth_password=(val)
      @auth_password = val
      self.check_for_admin
      return val
    end

    #
    # Shard-determining keys appropriate to the request for which
    # we were instantiated.
    #
    attr_accessor(:keys)

    #
    # Retain the request from which we were built.
    #
    attr_reader(:request)
    attr_reader(:request_header)
    attr_reader(:request_body)
    attr_reader(:response)
    attr_reader(:response_body)
    attr_reader(:response_header)

    def request=(req_p)
      @request = req_p
      if (req_p.kind_of?(Net::HTTPRequest) || req_p.kind_of?(Net::HTTPResponse))
        load_from_nethttp(req_p)
      elsif (req_p.kind_of?(Rack::Request))
        load_from_rackrequest(req_p)
      end
      self.check_for_admin if (self.has_basic_auth?)
      return req_p
    end

    def allowed_roles
      return self.class.allowed_roles
    end

    def endpoint
      return self.class.endpoint
    end

    def flags
      return self.class.flags
    end

    def verb
      return self.class.verb
    end

    #
    # Questions about access to the verb/entrypoint
    #
    def admin_only?
      return self.class.admin_only?
    end
    def can_create_owner?
      return self.class.can_create_owner?
    end
    def disallowed?
      return self.class.disallowed?
    end
    def internal_only?
      return self.class.internal_only?
    end

    #
    # Questions about the request this object represents.
    #
    def role_is_admin?
      return @role.eql?(:SUPER_ADMIN)
    end

    def role_is_admin!
      self.get_admin_credentials
      @auth_username = @admin_username
      @auth_password = @admin_password
      check_for_admin
      return true
    end

    def has_basic_auth?
      return (! (@auth_username.nil? || @auth_password.nil?))
    end

    def basic_auth_field
      return nil unless (self.has_basic_auth?)
      token = AuthHelper_Basic.encode_credentials(@auth_username,
                                                  @auth_password)
      return token.chomp
    end

    #
    # Constructor (used only to instantiate for a verb entry point).
    #
    def initialize(*args)
      #
      # Preset our instance variables.
      #
      @keys		= []
      @pathparams	= {}
      @queryparams	= {}
      @role		= nil
      #
      # If we were passed a Rack::Request as the first argument, we're
      # parsing an existing request.  Do it.
      #
      @objtype = :request
      if (args.empty? || args[0].kind_of?(Hash))
        hsh = args[0] || {}
        if (hsh.key?(:header))
          @request_header = hsh[:header]
          hsh = hsh.dup
          hsh.delete(:header)
          args[0] = hsh
        end
      else
        @objtype = :response
        self.request = args.shift
      end
      return super
    end                         # End of def initialize

    def extract_uri_info(path)
      uri_parsed = URI.parse(path)
      norm_path = normalise_path(uri_parsed.path)
      #
      # Extract any values embedded in the URI.  These are the
      # 'pathparams', and their names are represented as *symbols* in
      # the various structures.
      #
      unless ((pnames = self.class.const_get('PathParams')).empty?)
        m = norm_path.match(self.class.const_get('URI_Regex'))
        pnames.each_with_index do |pname,poz|
          @pathparams[pname.to_sym] = m.captures[poz]
          self.__send__((pname.to_s + '=').to_sym, m.captures[poz])
        end
      end
      #
      # Repeat for any query-string parameters.
      # Query parameter names are strings, not symbols.
      #
      unless ((pnames = self.class.const_get('QueryParams')).empty?)
        qtuples = uri_parsed.query.split(%r![&;]!)
        qval = qtuples.inject({}) { |memo,tuple|
          (k, v) = tuple.split(%r!=!, 2)
          memo[k] = v
          memo
        }
        pnames.each do |pname|
          @queryparams[pname] = qval[pname]
          self.__send__((pname + '=').to_sym, qval[pname])
        end
      end
    end                         # End of extract_uri_info

    def load_from_nethttp(req)
debugger
      #
      # Find any permutation of spelling for the CP-Consumer and CP-User
      # header fields.
      #
      %w( CP-Consumer CP-User ).each do |canon_hfield|
        ivar = '@' + canon_hfield.downcase.gsub(%r!-!, '_')
        pats = []
        pats << canon_hfield.gsub(%r!-!, '_')
        pats << canon_hfield.gsub(%r!_!, '-')
        pats << 'HTTP_' + canon_hfield.gsub(%r!-!, '_')
        pats << 'HTTP_' + canon_hfield.gsub(%r!_!, '-')
        pats.each do |pat|
          if (req.key?(pat))
            instance_variable_set(ivar.to_sym, req[pat])
            break
          end
        end
      end
      #
      # If the entry point has any defined path parameters, suck the
      # values for them into our instance.
      #
      self.extract_uri_info(req.path)
      #
      # Check for auth.
      #
      if (authtoken = req['Authorization'])
        encoded_cred = authtoken.sub(%r!^Basic\s+!i, '')
        if (encoded_cred != authtoken)
          decoded_cred = Base64.decode64(encoded_cred).chomp.strip
          (@auth_username, @auth_password) = decoded_cred.split(%r!:!)
          if (@auth_username.to_s.empty? || @auth_password.to_s.empty?)
            #
            # If either is nil or an empty string, make them both nil.
            # This might break on a blank password, but oh well.
            #
            @auth_username = nil
            @auth_password = nil
          else
            self.check_for_admin
          end
        end
      end
      @body = Proc.new { req.body }
      return req
    end                         # End of def load_from_nethttp

    def load_from_rackrequest(req)
      #
      # Find any permutation of spelling for the CP-Consumer and CP-User
      # header fields.  This is a bit complicated because the header
      # fields are kept in a hash and may or may not be case-sensitive.
      #
      %w( CP-Consumer CP-User ).each do |canon_hfield|
        key = re_str = canon_hfield
        ivar = '@' << canon_hfield.gsub(%r!-!, '_').downcase
        pats = []
        pats << %r!^(#{re_str})$!i
        pats << %r!^(#{re_str.gsub(%r!-!, '[-_]')})$!i
        pats << %r!^(HTTP_#{re_str.gsub(%r!-!, '[-_]')})$!i
        pats.each do |re_pat|
          unless ((m = req.env.keys.grep(re_pat)).empty?)
            key = m.first
            instance_variable_set(ivar.to_sym, req.env[key])
            break
          end
        end
      end
      #
      # Use our helper to get fields from the URI.
      #
      self.extract_uri_info(req.path)
      #
      # Any query-string parameters are directly accessible from the
      # request.
      #
      unless ((pnames = self.class.const_get('QueryParams')).empty?)
        pnames.each do |pname|
          @queryparams[pname.to_sym] = req[pname]
          self.__send__((pname.to_s + '=').to_sym, req[pname])
        end
      end
      unless (req.headers['HTTP_AUTHORIZATION'].nil?)
        cred = AuthHelper_Basic.user_name_and_password(req)
        (@auth_username, @auth_password) = cred
        self.check_for_admin
      end
      @body = Proc.new { req.body }
      return req
    end                         # End of def load_from_rackrequest

    #
    # Is this a completely trusted connexion?
    #
    def is_trusted_request?
      #
      # Shortest path first..  if the client knows the admin credentials,
      # we have to trust it.
      #
      return true if (self.role_is_admin?)
      return false
    end                         # End of def is_trusted_request?

    #
    # Return true if the request header field indicates this request came
    # from Outside.
    #
    def is_external?
      return (@request.headers['HTTP_CANDLEPIN_CONTEXT'] == 'External')
    end                         # End of def is_external?

    #
    # Abstract the check for a trusted IP origin into a do-nothing-else
    # method.
    #
    def is_trusted_origin?
      #
      # We're paranoid -- there are only a few hosts we intend to trust,
      # and they're all us.  (There remains a danger if the host we're
      # trusting is proxying an external request and didn't sanitise the
      # original request header -- essentially passing us a
      # potentially-spoofed CP-User value.
      #
      trusted_sources = [
                         '127.0.0.1', # IPV4
                         '::1',       # IPV6
                         req['SERVER_ADDR']
                        ]
      return trusted_sources.include?(@request.ip)
    end                         # End of def is_trusted_origin?

    #
    # We can trust the values in the URI and the query string; use them
    # if we don't already have better ones.
    #
    def load_variables_from_trusted_uri
      #
      # When trusted, the order of preference is most volatile (query-string)
      # to least (URI elements, then header fields).
      #
      @consumer_uuid ||= (@queryparams[:consumer_uuid] \
                          || @pathparams[:consumer_uuid])
      @org_id ||= @queryparams[:org_id] || @pathparams[:org_id]
      @owner_id ||= @queryparams[:owner_id] || @pathparams[:owner_id]
      @entitlement_id ||= (@queryparams[:entitlement_id] \
                           || @pathparams[:entitlement_id])
      @pool_id ||= @queryparams[:pool_id] || @pathparams[:pool_id]
    end                         # End of def load_variables_from_trusted_uri

    def run_checks
      #
      # We never, never, *ever* want the SUPER_ADMIN basic-auth credentials
      # to be used from Outside.
      #
      if (self.is_external?)
        #
        # Are the admin credentials being used from Outside?
        #
        if (self.role_is_admin?)
          log_event(:warn,
                    'Attempt to use admin credentials via the external context!',
                    :run_checks)
          spoor(:event => 'Rejecting external request using SUPER_ADMIN role')
          raise BadCredentialsException.new('Not authorised for this operation')
        end
      end
    end                         # End of def run_checks

  end                           # End of Endpoint class

end                             # End of CandlepinAPI module
