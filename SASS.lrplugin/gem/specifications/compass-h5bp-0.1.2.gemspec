# -*- encoding: utf-8 -*-
# stub: compass-h5bp 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "compass-h5bp"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Gumeson"]
  s.date = "2013-10-28"
  s.description = " Compass extension of Html5 mixins extracted from v4 of the Html5 Boilerplate project (h5bp.com) "
  s.email = ["gumeson@gmail.com"]
  s.homepage = "http://rubygems.org/gems/compass-h5bp"
  s.require_paths = ["lib"]
  s.rubyforge_project = "compass-h5bp"
  s.rubygems_version = "2.1.11"
  s.summary = "Compass extension for Html5 Boilerplate v4.1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0"])
    else
      s.add_dependency(%q<compass>, [">= 0"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0"])
  end
end
