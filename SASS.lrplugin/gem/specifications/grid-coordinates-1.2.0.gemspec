# -*- encoding: utf-8 -*-
# stub: grid-coordinates 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "grid-coordinates"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Stacoviak"]
  s.date = "2011-10-25"
  s.description = "Highly configurable CSS Grid Framework written in Sass."
  s.email = "adam@stacoviak.com"
  s.homepage = "http://grid-coordinates.com/"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Grid Coordinates is a highly configurable CSS Grid Framework written in Sass, and was inspired by 960.gs and The 1kb CSS Grid. Just plug-in your grid's coordinates (grid columns, grid width, gutter width) and Grid Coordinates will generate the styles."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.11.5"])
    else
      s.add_dependency(%q<compass>, [">= 0.11.5"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.11.5"])
  end
end
