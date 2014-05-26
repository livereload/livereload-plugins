require "rgbapng/functions"

Compass::Frameworks.register("rgbapng",
  :stylesheets_directory  => File.join(File.dirname(__FILE__), "stylesheets"),
  :templates_directory    => File.join(File.dirname(__FILE__), "templates")
)
