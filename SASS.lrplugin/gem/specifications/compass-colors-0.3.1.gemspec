# -*- encoding: utf-8 -*-
# stub: compass-colors 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "compass-colors"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Eppstein"]
  s.date = "2009-11-19"
  s.description = "Sass Extensions and color theme templates to make working with colors easier and more maintainable."
  s.email = "chris@eppsteins.net"
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown"]
  s.homepage = "http://compass-style.org"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Color Support for Compass & Sass"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.8.7"])
    else
      s.add_dependency(%q<compass>, [">= 0.8.7"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.8.7"])
  end
end
