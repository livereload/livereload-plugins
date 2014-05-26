# -*- encoding: utf-8 -*-
# stub: compass_formalize 0.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "compass_formalize"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wynn Netherland", "Nathan Smith"]
  s.date = "2013-10-09"
  s.description = "Compass and Sass port of Nathan Smith's Formalize HTML form normalizer."
  s.email = ["wynn.netherland@gmail.com", "nathan@sonspring.com"]
  s.homepage = "http://github.com/pengwynn/compass_formalize"
  s.require_paths = ["lib"]
  s.rubyforge_project = "compass-960-plugin"
  s.rubygems_version = "2.1.11"
  s.summary = "Compass compatible Sass port of Formalize."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.10.0"])
    else
      s.add_dependency(%q<compass>, [">= 0.10.0"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.10.0"])
  end
end
