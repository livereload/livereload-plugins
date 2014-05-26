# -*- encoding: utf-8 -*-
# stub: compass-vgrid-plugin 0.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "compass-vgrid-plugin"
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Russell"]
  s.date = "2010-04-14"
  s.description = "A Compass compatible SASS port of the Variable Grid System by Spry Soft (http://www.spry-soft.com/grids/). Based in the 960 Grid System (http://960.gs/). Provides fixed, fluid and elastic grids with complete control over the grid system."
  s.email = "aaron@gc4.co.uk"
  s.homepage = "http://github.com/aaronrussell/compass-vgrid-plugin"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Compass compatible SASS port of the Variable Grid System. Based on the 960 Grid System."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.10.0.rc3"])
    else
      s.add_dependency(%q<compass>, [">= 0.10.0.rc3"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.10.0.rc3"])
  end
end
