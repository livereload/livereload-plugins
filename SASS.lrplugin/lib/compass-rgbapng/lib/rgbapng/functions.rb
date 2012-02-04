require "rubygems"
require "chunky_png"
require "base64"

# Functions are modified from Benjamin Doherty's first implementations: http://gist.github.com/377912
# Modified to use the ChunkyPNG library rather than RMagick, and added flexibility to amend the path
# to which generated PNGs are saved.

module Sass::Script::Functions
  
  def png_pixelate(c, dir = "rgbapng")
    color = ChunkyPNG::Color.rgba(c.red, c.green, c.blue, (c.alpha * 100 * 2.55).round)
    image = ChunkyPNG::Image.new(1,1, color)
    dir   = dir.is_a?(Sass::Script::String) ? dir.value : dir
    file  = File.join(dir, ChunkyPNG::Color.to_hex(color).gsub(/^#/, "") + ".png")
    path = File.join(Compass.configuration.images_path, file)
        
    if !File.exists?(path) || options[:force]
      puts "Writing #{file}"
      [Compass.configuration.images_path, File.join(Compass.configuration.images_path, dir)].each do |d|
        Dir.mkdir(d) unless File.exists?(d)        
      end
      image.save(path)
    end
    
    Sass::Script::String.new(file)
  end

  def png_base64(c)
    color = ChunkyPNG::Color.rgba(c.red, c.green, c.blue, (c.alpha * 100 * 2.55).round)
    image = ChunkyPNG::Image.new(1,1, color)
    data  = Base64.encode64(image.to_blob).gsub("\n", "")
    
    Sass::Script::String.new("url('data:image/png;base64,#{data}')")
  end
  
end
