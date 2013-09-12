# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "cri"
  s.version = "2.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Denis Defreyne"]
  s.date = "2013-08-31"
  s.description = "Cri allows building easy-to-use commandline interfaces with support for subcommands."
  s.email = "denis.defreyne@stoneship.org"
  s.extra_rdoc_files = ["ChangeLog", "LICENSE", "README.md", "NEWS.md"]
  s.files = ["ChangeLog", "LICENSE", "README.md", "NEWS.md"]
  s.homepage = "http://stoneship.org/software/cri/"
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.6"
  s.summary = "a library for building easy-to-use commandline tools"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colored>, [">= 1.2"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<colored>, [">= 1.2"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<colored>, [">= 1.2"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
