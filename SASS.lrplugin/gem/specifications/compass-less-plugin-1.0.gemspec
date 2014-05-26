# -*- encoding: utf-8 -*-
# stub: compass-less-plugin 1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "compass-less-plugin"
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["William Wells"]
  s.date = "2011-02-21"
  s.description = "Less Framework is a cross-device CSS grid system based on using inline media queries."
  s.email = ["less@hapa.me"]
  s.homepage = "http://github.com/willhw/compass-less-plugin"
  s.require_paths = ["lib"]
  s.rubyforge_project = "compass-less-plugin"
  s.rubygems_version = "2.1.11"
  s.summary = "Compass compatible port of Less Framework"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.10"])
    else
      s.add_dependency(%q<compass>, [">= 0.10"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.10"])
  end
end
