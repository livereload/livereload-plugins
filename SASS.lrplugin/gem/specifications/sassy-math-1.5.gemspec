# -*- encoding: utf-8 -*-
# stub: sassy-math 1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "sassy-math"
  s.version = "1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sam Richard", "Mario Valencia", "Scott Kellum"]
  s.date = "2012-07-29"
  s.description = "Use advanced mathematical functions in Compass."
  s.email = ["snugug@gmail.com"]
  s.homepage = "https://github.com/scottkellum/Sassy-math"
  s.require_paths = ["lib"]
  s.rubyforge_project = "sassy-math"
  s.rubygems_version = "2.1.11"
  s.summary = "Advanced math functions for Compass."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, ["~> 0.11"])
    else
      s.add_dependency(%q<compass>, ["~> 0.11"])
    end
  else
    s.add_dependency(%q<compass>, ["~> 0.11"])
  end
end
