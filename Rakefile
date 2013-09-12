# encoding: utf-8
require('rubygems')
require('bundler/setup')
require('rake')

topdir = File.dirname(__FILE__)

include Rake::DSL
Bundler::GemHelper.install_tasks

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts(e.message)
  $stderr.puts('Run "bundle install" to install missing gems')
  exit(e.status_code)
end

require('rake/testtask')
Rake::TestTask.new(:test => :parse_versions) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require('cucumber/rake/task')
Cucumber::Rake::Task.new(:features)

task(:default => :test)

require('yard')
YARD::Rake::YardocTask.new

desc('Make the Ruby APIs for the various versions')
task(:parse_versions) do
  version_dir = File.expand_path(File.join(topdir, 'data'))
  api_dir = File.expand_path(File.join(topdir,
                                       'lib',
                                       'candlepin-api',
                                       'versioned'))
  cli_dir = File.expand_path(File.join(topdir,
                                       'lib',
                                       'candlepin-api',
                                       'cli'))
  json_files = Dir[File.join(version_dir, '*.json')]
  makerscript = "#{topdir}/script/mkclasses-from-API.rb"
  maker_mtime = File.mtime(makerscript)
  versions = json_files.map { |f|
    f.sub(%r!^.*?(\d.*)\.json!, '\1')
  }.sort { |a,b| Versionomy.parse(a) <=> Versionomy.parse(b) }
  versions.each do |version|
    json_file = Dir[File.join(version_dir, "*#{version}.json")].first
    api_file = File.join(api_dir, "#{version}.rb")
    cli_file = File.join(cli_dir, "#{version}.rb")
    unless (File.exist?(api_file) \
            && (File.mtime(api_file) > maker_mtime) \
            && (File.mtime(cli_file) > maker_mtime) \
            && (File.mtime(api_file) >= File.mtime(json_file)))
      if (File.exist?(api_file))
        $stdout.puts("Rebuilding API for #{version}")
      else
        $stdout.puts("Generating API bindings for #{version}")
      end
      `#{makerscript} -i #{json_file} -f json -o #{api_file} -c #{cli_file}`
    end
  end
end
