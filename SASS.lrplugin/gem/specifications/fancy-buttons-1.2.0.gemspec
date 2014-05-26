# -*- encoding: utf-8 -*-
# stub: fancy-buttons 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fancy-buttons"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brandon Mathis"]
  s.date = "2012-03-14"
  s.description = "Fancy Buttons helps you easily style buttons with beautiful CSS3 features like gradients, rounded corners, etc. Don't worry the buttons also degrade nicely for browsers with no support. This requires the Compass stylesheet authoring framework."
  s.email = "brandon@imathis.com"
  s.homepage = "http://github.com/imathis/fancy-buttons"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Make fancy CSS3 buttons with the Compass stylesheet authoring framework."

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
