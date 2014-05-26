plugin_root = File.join(File.dirname(__FILE__), "..")

Compass::Frameworks.register("vgrid",
  :stylesheets_directory  => File.join(plugin_root, "framework"),
  :templates_directory    => File.join(plugin_root, "templates")
)
