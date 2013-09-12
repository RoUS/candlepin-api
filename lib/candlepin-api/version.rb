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

module CandlepinAPI

  @version	= Versionomy.parse('0.0.0')

  #
  # Bump the minor version for the first gemification.
  #
  @version	= @version.bump(:minor)

  #
  # Bump the version for the final_status fix.
  #
  @version	= @version.bump(:tiny)

  #
  # Bump the version for the issues stemming from working with a
  # locally-patched version of the cri gem.
  #
  @version	= @version.bump(:tiny)
  @version	= @version.bump(:tiny)

  #
  # Bump the version somewhat more because we added the request-body
  # ability.
  @version	= @version.bump(:minor)

  #
  # Bump the version again because we added the --header/-H and
  # --request-header/-I options, plus various bug fixes.
  #
  @version	= @version.bump(:minor)

  #
  # Bump because we added more API versions and are about to go public.
  #
  @version	= @version.bump(:minor)

  @version.freeze
  #
  # Frozen string representation of the module version number.
  #
  VERSION	= @version.to_s.freeze

  #
  # Returns the Versionomy[http://rubygems.org/gems/versionomy]
  # representation of the package version number.
  #
  def version
    return @version
  end
  module_function(:version)

  #
  # Returns the package version number as a string.
  #
  def VERSION
    return self::VERSION
  end
  module_function(:VERSION)

end
