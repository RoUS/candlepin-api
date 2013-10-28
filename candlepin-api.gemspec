# -*- encoding: utf-8 -*-
$:.push(File.expand_path('../lib', __FILE__))
require('candlepin-api/version')

Gem::Specification.new do |s|
  s.name		= 'candlepin-api'
  s.version		= CandlepinAPI::VERSION
  s.platform		= Gem::Platform::RUBY
  s.authors		= [
                           'Ken Coar',
                          ]
  s.email		= [
                           'kcoar+candlepin-api@redhat.com',
                          ]
  s.license		= 'Apache 2.0'
  s.homepage		= 'http://rubyforge.org/projects/candlepin-api/'
  s.summary		= %q{Expose the Candlepin REST API as Ruby classes}
  s.description 	= %q{Expose the Candlepin REST API (multiple versions) as Ruby classes and a command-line tool.}

  s.rubyforge_project	= 'candlepin-api'

  s.has_rdoc		= 'yard'
  s.rdoc_options <<
    '--title=Candlepin API' <<
    '--main=README' <<
    '--charset=UTF-8' <<
    '--exclude=data' <<
    '--exclude=site' <<
    '--exclude=lib/candlepin-api/cli' <<
    '--exclude=lib/candlepin-api/versioned'

  s.files		= (`git ls-files`.split("\n") + Dir['bundle/**/*'] - Dir['site/**/*']).uniq
  s.test_files		= `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables 	= `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.default_executable	= 'bin/candlepin-api'
  s.require_paths	= [
                           'lib',
                          ]
end
