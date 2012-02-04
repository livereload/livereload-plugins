# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "baseline/version"

Gem::Specification.new do |s|
  s.name        = "compass-baseline"
  s.version     = Compass::Baseline::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Reynolds"]
  s.email       = ["tdreyno@gmail.com"]
  s.homepage    = "http://github.com/tdreyno/compass-baseline"
  s.summary     = %q{An implementation of Baseline in Sass}

  s.rubyforge_project = "compass-baseline"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency("sass", ["~> 3.1.0"])
  s.add_runtime_dependency("compass", [">= 0.11.1"])
end
