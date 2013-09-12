# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "versionomy"
  s.version = "0.4.4"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Azuma"]
  s.date = "2012-06-28"
  s.description = "Versionomy is a generalized version number library. It provides tools to represent, manipulate, parse, and compare version numbers in the wide variety of versioning schemes in use."
  s.email = "dazuma@gmail.com"
  s.extra_rdoc_files = ["History.rdoc", "README.rdoc", "Versionomy.rdoc"]
  s.files = ["History.rdoc", "README.rdoc", "Versionomy.rdoc"]
  s.homepage = "http://dazuma.github.com/versionomy"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "virtuoso"
  s.rubygems_version = "2.0.7"
  s.summary = "Versionomy is a generalized version number library."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<blockenspiel>, [">= 0.4.5"])
    else
      s.add_dependency(%q<blockenspiel>, [">= 0.4.5"])
    end
  else
    s.add_dependency(%q<blockenspiel>, [">= 0.4.5"])
  end
end
