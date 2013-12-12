# -*- encoding: utf-8 -*-
# stub: compass-import-once 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "compass-import-once"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Eppstein"]
  s.date = "2013-12-11"
  s.description = "Changes the behavior of Sass's @import directive to only import a file once."
  s.email = ["chris@eppsteins.net"]
  s.homepage = "https://github.com/chriseppstein/compass/tree/master/import-once"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Speed up your Sass compilation by making @import only import each file once."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
