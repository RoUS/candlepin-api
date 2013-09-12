# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "blockenspiel"
  s.version = "0.4.5"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Azuma"]
  s.date = "2012-06-28"
  s.description = "Blockenspiel is a helper library designed to make it easy to implement DSL blocks. It is designed to be comprehensive and robust, supporting most common usage patterns, and working correctly in the presence of nested blocks and multithreading."
  s.email = "dazuma@gmail.com"
  s.extensions = ["ext/unmixer_mri/extconf.rb"]
  s.extra_rdoc_files = ["Blockenspiel.rdoc", "History.rdoc", "ImplementingDSLblocks.rdoc", "README.rdoc"]
  s.files = ["Blockenspiel.rdoc", "History.rdoc", "ImplementingDSLblocks.rdoc", "README.rdoc", "ext/unmixer_mri/extconf.rb"]
  s.homepage = "http://dazuma.github.com/blockenspiel"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = "virtuoso"
  s.rubygems_version = "2.0.7"
  s.summary = "Blockenspiel is a helper library designed to make it easy to implement DSL blocks."
end
