# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "compass-slickmap/version"

Gem::Specification.new do |s|
  s.name        = "compass-slickmap"
  s.version     = Compass::Slickmap::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Reynolds"]
  s.email       = ["tdreyno@gmail.com"]
  s.homepage    = "http://github.com/tdreyno/compass-slickmap"
  s.summary     = "Slickmap for Compass"

  s.rubyforge_project = "compass-slickmap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency("haml", ["~> 3.1.0"])
  s.add_runtime_dependency("sass", ["~> 3.1.0"])
  s.add_runtime_dependency("compass", [">= 0.11.1"])
end
