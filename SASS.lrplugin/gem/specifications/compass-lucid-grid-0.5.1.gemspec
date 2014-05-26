# -*- encoding: utf-8 -*-
# stub: compass-lucid-grid 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "compass-lucid-grid"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yifei Zhang"]
  s.date = "2011-07-01"
  s.description = "A Compass/SASS grid that outputs lean, semantic stylesheets. Avoids CSS repetition on SASS compilation and reduces the need for wrapper <div>s."
  s.email = "yz@yifei.co"
  s.homepage = "https://github.com/ezYZ/lucid"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.requirements = ["SASS, Compass Framework"]
  s.rubygems_version = "2.1.11"
  s.summary = "A Compass/SASS grid for developers who love semantics."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.11"])
    else
      s.add_dependency(%q<compass>, [">= 0.11"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.11"])
  end
end
