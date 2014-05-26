# -*- encoding: utf-8 -*-
# stub: compass-thesquaregrid 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "compass-thesquaregrid"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Cornett"]
  s.date = "2011-04-30"
  s.description = "The Square Grid - A simple CSS framework for designers and developers, based on 35 equal-width columns. It aims to cut down on development time and help you create beautiful-structured websites."
  s.email = "andrew@amotion.tv"
  s.homepage = "http://github.com/amotion/compass-thesquaregrid-plugin"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Adds The Square Grid CSS framework to Compass"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.10.6"])
    else
      s.add_dependency(%q<compass>, [">= 0.10.6"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.10.6"])
  end
end
