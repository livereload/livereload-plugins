require 'rubygems'
require 'rake'
require 'rake/rdoctask'


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "compass-squaregrid-plugin"
    gem.summary = %Q{The Square Grid System is a simple grid system for designers and developers http://thesquaregrid.com/ }
    gem.description = %Q{The Square Grid System is a simple grid system for designers and developers http://thesquaregrid.com/}
    gem.email = "me@davidjrice.co.uk"
    gem.homepage = "http://github.com/davidjrice/compass-squaregrid-plugin"
    gem.authors = ["David Rice"]
    gem.add_dependency "compass", ">= 0.10.0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.verbose = true
  end
rescue LoadError
  task :spec do
    abort "RSpec is not available. In order to run specs, you must: sudo gem install rspec"
  end
end  

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install rcov"
  end
end

task :test => :check_dependencies

task :default => :test

Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "DeviceAtlas #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


