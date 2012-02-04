# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{compass_formalize}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5")
  s.authors = ["Wynn Netherland", "Nathan Smith"]
  s.date = %q{2011-07-07}
  s.description = %q{Compass and Sass port of Nathan Smith's Formalize HTML form normalizer.}
  s.email = %w{wynn.netherland@gmail.com nathan@sonspring.com}
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/pengwynn/compass_formalize}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{compass-960-plugin}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Compass compatible Sass port of Formalize.}
  s.add_dependency(%q<compass>, [">= 0.10.0"])
end
