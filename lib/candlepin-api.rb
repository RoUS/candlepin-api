# -*- coding: utf-8 -*-
#--
#   Copyright © 2012 Red Hat, Inc. [Ken Coar]
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#++
require('rubygems')
require('versionomy')
Proc.new {
  here_short = File.dirname(__FILE__)
  here_long = File.dirname(File.expand_path(__FILE__))
  unless ($:.include?(here_short) || $:.include?(here_short))
    $:.unshift(here_long)
  end
  parent = File.expand_path(File.join(here_long, '..')) 
  unless ($:.include?(parent))
    $:.unshift(parent)
  end
}.call

require('candlepin-api/version')
require('candlepin-api/base')

begin
  require('debugger')
rescue LoadError
 require('ruby-debug')
end

Proc.new {
  parent = File.dirname(File.expand_path(__FILE__))
  version_files = Dir[File.join(parent, 'candlepin-api/versioned/*.rb')]
  versions_available = version_files.map { |fname|
    Versionomy.parse(fname.sub(%r!.*?([[:digit:]][-.[:digit:]]*)\.rb!, '\1'))
  }.sort
  CandlepinAPI.const_set('API_VERSIONS', versions_available.map { |v| v.to_s })
  use_version = versions_available.max
  if (defined?(CANDLEPIN_API_VERSION))
    requested = Versionomy.parse(CANDLEPIN_API_VERSION)
    later = versions_available.select { |v| v >= requested }
    if (later.empty?)
      #
      # Whoa, nothing that recent yet!
      #
      raise CandlepinAPI::BadAPIVersion.new('no API version matching ' +
                                            requested.to_s +
                                            '; most recent is ' +
                                            use_version.to_s)
    end
    if (later[0] == requested)
      #
      # Got an exact match.
      #
      use_version = requested
    else
      #
      # Gotta find a best match by stripping down to a common
      # denominator of segments.
      #
      requested_re = Regexp.new('^' + Regexp.escape(requested.to_s))
      later = later.select { |v| v.to_s =~ requested_re }
      if (later.empty?)
        #
        # Got nothin' matching even as much of the version as specified.
        #
        raise CandlepinAPI::BadAPIVersion.new('no API version matching ' +
                                              requested.to_s)
      end
      use_version = later.max
    end
  end
  CandlepinAPI.const_set('API_VERSION', use_version.to_s)
}.call
require("candlepin-api/versioned/#{CandlepinAPI::API_VERSION}")
