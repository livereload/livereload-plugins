# -*- encoding: utf-8 -*-
# stub: html5-boilerplate 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "html5-boilerplate"
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Gumeson", "Grady Kuhnline"]
  s.date = "2012-01-24"
  s.description = "A Compass implementation of Paul Irish's HTML5 Boilerplate at http://html5boilerplate.com"
  s.email = ["gumeson@gmail.com"]
  s.homepage = "http://github.com/sporkd/compass-html5-boilerplate"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "A Compass implementation of Paul Irish's HTML5 Boilerplate"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0"])
      s.add_runtime_dependency(%q<compass-h5bp>, [">= 0"])
    else
      s.add_dependency(%q<compass>, [">= 0"])
      s.add_dependency(%q<compass-h5bp>, [">= 0"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0"])
    s.add_dependency(%q<compass-h5bp>, [">= 0"])
  end
end
