# -*- encoding: utf-8 -*-
# stub: compass-960-plugin 0.10.4 ruby lib

Gem::Specification.new do |s|
  s.name = "compass-960-plugin"
  s.version = "0.10.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Eppstein", "Matt Sanders"]
  s.date = "2011-06-15"
  s.description = "The 960 Grid System is an effort to streamline web development workflow by providing commonly used dimensions, based on a width of 960 pixels. http://960.gs/"
  s.email = ["chris@eppsteins.net", "matt@modal.org"]
  s.homepage = "http://github.com/chriseppstein/compass-960-plugin"
  s.require_paths = ["lib"]
  s.rubyforge_project = "compass-960-plugin"
  s.rubygems_version = "2.1.11"
  s.summary = "Compass compatible Sass port of 960.gs."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.10.0"])
    else
      s.add_dependency(%q<compass>, [">= 0.10.0"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.10.0"])
  end
end
