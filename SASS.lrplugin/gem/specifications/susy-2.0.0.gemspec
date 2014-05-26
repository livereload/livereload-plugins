# -*- encoding: utf-8 -*-
# stub: susy 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "susy"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Suzanne", "Tsachi Shlidor", "Aaron Gray", "Rachel Nabors", "Jina Bolton", "Danny Palmer"]
  s.date = "2014-02-18"
  s.description = "Susy is a toolkit for building layouts of all types with a simple, natural syntax."
  s.email = ["eric@oddbird.net", "tsi.shlidor@gmail.com", "aaron@hellometa.com", "rachelnabors@gmail.com", "jina@sushiandrobots.com", "danny@dannyprose.com"]
  s.extra_rdoc_files = ["docs/changelog.rst", "LICENSE.txt", "README.md", "lib/susy.rb"]
  s.files = ["docs/changelog.rst", "LICENSE.txt", "README.md", "lib/susy.rb"]
  s.homepage = "http://susy.oddbird.net/"
  s.licenses = ["BSD-3-Clause"]
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Susy", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "susy"
  s.rubygems_version = "2.1.11"
  s.summary = "Responsive layout toolkit for Sass."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sass>, ["~> 3.3.0"])
    else
      s.add_dependency(%q<sass>, ["~> 3.3.0"])
    end
  else
    s.add_dependency(%q<sass>, ["~> 3.3.0"])
  end
end
