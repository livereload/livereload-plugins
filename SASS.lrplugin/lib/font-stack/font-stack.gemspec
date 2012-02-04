# -*- encoding: utf-8 -*-

Gem::Specification.new do |gemspec|
  gemspec.name = "font-stack"
  gemspec.version = "0.1.2"
  gemspec.platform  = Gem::Platform::RUBY
  gemspec.authors = ["Lloyd Kupchanko"]
  gemspec.email = "lloyd@lloydk.ca"
  gemspec.homepage = "http://github.com/lloydk/font-stack"
  gemspec.summary = %q{A library of CSS font stacks}
  gemspec.description = "Font-stack is a Compass plugin that provides a library of CSS font stacks."

  gemspec.rubygems_version = "1.3.6"

  gemspec.require_path = "lib"
  gemspec.files = ["README.markdown", "font-stack.gemspec", "lib/font-stack.rb", "lib/stylesheets/_font-stack.scss"]

  gemspec.add_dependency('sass', '>= 3.0.0')
end

