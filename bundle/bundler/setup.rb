require('rbconfig')
# ruby 1.8.7 doesn't define RUBY_ENGINE
ruby_engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
ruby_version = RbConfig::CONFIG['ruby_version']
path = File.expand_path('..', __FILE__)
rpath = "#{path}/../#{ruby_engine}/#{ruby_version}"
$:.unshift(File.expand_path("#{rpath}gems/rake-0.9.2.2/lib"))
$:.unshift(File.expand_path("#{rpath}gems/blockenspiel-0.4.5/lib"))
$:.unshift(File.expand_path("#{rpath}gems/builder-3.0.0/lib"))
$:.unshift(File.expand_path("#{path}/../../lib"))
$:.unshift(File.expand_path("#{rpath}gems/colored-1.2/lib"))
$:.unshift(File.expand_path("#{rpath}gems/columnize-0.3.6/lib"))
$:.unshift(File.expand_path("#{rpath}gems/cri-2.4.0/lib"))
$:.unshift(File.expand_path("#{rpath}gems/diff-lcs-1.1.3/lib"))
$:.unshift(File.expand_path("#{rpath}gems/json-1.7.3/lib"))
$:.unshift(File.expand_path("#{rpath}gems/gherkin-2.11.1/lib"))
$:.unshift(File.expand_path("#{rpath}gems/cucumber-1.2.1/lib"))
$:.unshift(File.expand_path("#{rpath}gems/debugger-linecache-1.2.0/lib"))
$:.unshift(File.expand_path("#{rpath}gems/debugger-ruby_core_source-1.2.3/lib"))
$:.unshift(File.expand_path("#{rpath}gems/debugger-1.6.1/lib"))
$:.unshift(File.expand_path("#{rpath}gems/mime-types-1.23/lib"))
$:.unshift(File.expand_path("#{rpath}gems/multi_json-1.7.8/lib"))
$:.unshift(File.expand_path("#{rpath}gems/rack-1.3.5/lib"))
$:.unshift(File.expand_path("#{rpath}gems/rdoc-4.0.1/lib"))
$:.unshift(File.expand_path("#{rpath}gems/redcarpet-2.3.0/lib"))
$:.unshift(File.expand_path("#{rpath}gems/rest-client-1.6.7/lib"))
$:.unshift(File.expand_path("#{rpath}gems/simplecov-html-0.7.1/lib"))
$:.unshift(File.expand_path("#{rpath}gems/simplecov-0.7.1/lib"))
$:.unshift(File.expand_path("#{rpath}gems/test-unit-2.5.0/lib"))
$:.unshift(File.expand_path("#{rpath}gems/versionomy-0.4.4/lib"))
$:.unshift(File.expand_path("#{rpath}gems/yard-0.8.7/lib"))
