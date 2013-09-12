#! /usr/bin/env ruby
#
# Read the Candlepin API as represented in JSON or YAML, and look for
# exceptional situations (like endpoints with no verbs, or no URI).
#
require('rubygems')
require('getoptions')
require('json')
require('pp')
require('yaml')

require('ruby-debug')
Debugger.start

verbosity = 0
op = GetOptions.new([
                     'help|h|?',
                     'input|i=s',
                     'json|j!',
                     'yaml|y!',
                     'quiet|q',
                     'verbose|v+',
                    ])

if (op.has_option?(:help))
  puts(<<-EOT)
Usage: #{$0} [OPTIONS] [FILE]
  -?, -h, --help	Display this help text.
  -i, --input=FILE	Read the API definition from the indicated file.
			Default is STDIN.
  -j, --json		Input file is in JSON format.
  -y, --yaml		Input is in YAML format.
  -v[v], --verbose	Increases output detail.
  -q, --quiet		Suppresses all output except 'not ok' when
			verbose.

  Notes:
   o -j and -y are mutually incompatible.
   o Exit status is 0 if there are no exceptions, 1 if there are.
  EOT
  exit(0)
end

#
# Figure out how much we're supposed to gas on -- unless there's a
# gag order, which takes precedence.
#
if (op.has_option?(:verbose) && (! op.has_option?(:quiet)))
  verbosity = op.verbose
end

#
# We can be given our input file either as a non-option argument
# on the command line, or as a value for the '-i' option.
#
if (op.has_option?(:input))
  infile = op.input
else
  infile = ARGV[0]
end

is_json = (op.has_option?(:json) && op.json)
is_yaml = (op.has_option?(:yaml) && op.yaml)
if (is_json && is_yaml)
  raise ArgumentError.new('cannot specify both JSON and YAML input formats')
elsif ((! is_json) && (! is_yaml))
  raise ArgumentError.new('you must specify either JSON or YAML input format')
end

#
# Default to STDIN if nothing better was supplied.
#
infile = '-' if (infile.nil? || infile.to_s.empty?)

#
# Read in the whole thing at once.
#
if (infile == '-')
  slurp = STDIN.read
else
  unless (File.exists?(infile))
    STDERR.puts("#{$0}: unable to find file, aborting: #{infile}")
    exit(-1)
  end
  slurp = File.read(infile)
end

raw = nil
if (is_json)
  raw = JSON.parse(slurp)
elsif (is_yaml)
  raw = YAML.load(slurp)
end

fields = []

#
# First, get a list of all the possible fields in the definitions.
#
raw.each { |elt| fields |= elt.keys }

#
# Now prepare to identify exceptions.
#
exceptions = fields.inject({}) { |memo,fname| memo[fname] = [] ; memo }

#
# Now do it..
#
raw.each do |elt|
  epname = elt['method'] || elt.inspect
  fields.each do |f|
    exceptions[f] << epname if (elt[f].nil? || elt[f].empty?)
  end
end

#
# Finally, take a look at the results.  If there were no problems,
# we'll either exit silently or say 'ok' is we're supposed to be
# garrulous.
#
exc_count = exceptions.values.map { |o| o.size }.reduce(:+)
if (exc_count.zero?)
  puts('ok') if (verbosity > 0)
  exit(0)
end

#
# Sigh, nothing's ever simple.  If we're supposed to give any level of
# detail about problems, let's be about it.
#
if (verbosity > 0)
  STDERR.puts("#{exc_count} exception#{exc_count == 1 ? '' : 's'}")
  if (verbosity > 1)
    exceptions.sort.each do |k,v|
      next if (v.empty?)
      STDERR.puts("Endpoints with missing or empty '#{k}' field: #{v.size}")
      next if (verbosity < 2)
      v.sort.each { |ep| STDERR.puts("  #{ep}") }
    end
  end
end

#
# Remark on the failure unless the user has imposed a gag order.
#
puts('not ok') unless (op.has_option?(:quiet))
exit(1)
