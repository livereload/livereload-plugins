# -*- encoding: utf-8 -*-
# stub: sassy-buttons 0.2.6 ruby lib

Gem::Specification.new do |s|
  s.name = "sassy-buttons"
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jared Hardy"]
  s.date = "2013-09-11"
  s.description = "Awesome CSS only buttons using compass and sass "
  s.email = ["jared@jaredhardy.com"]
  s.homepage = "http://www.jaredhardy.com/sassy-buttons"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Easily create Awesome CSS buttons"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<compass>, [">= 0.12.2"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<compass>, [">= 0.12.2"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<compass>, [">= 0.12.2"])
  end
end
