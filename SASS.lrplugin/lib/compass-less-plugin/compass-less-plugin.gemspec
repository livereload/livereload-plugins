# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "compass-less-plugin"
  s.version     = "1.0.beta.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["William Wells"]
  s.email       = ["less@hapa.me"]
  s.homepage    = "http://github.com/willhw/compass-less-plugin"
  s.summary     = %q{Compass compatible port of Less Framework}
  s.description = %q{Less Framework is a cross-device CSS grid system based on using inline media queries.}

  s.rubyforge_project = "compass-less-plugin"

  s.add_dependency "compass", ">= 0.10"

  s.files = `git ls-files`.split("\n")

  s.has_rdoc = false
  s.require_paths = ["lib"]
end
