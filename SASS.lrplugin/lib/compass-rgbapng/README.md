# rgbapng - Compass plugin

rgbapng is a Compass plugin for providing cross-browser* compatible RGBA support. It works by creating single pixel alpha-transparent PNGs on the fly for browsers that don't support RGBA. It uses the pure Ruby ChunkyPNG library resulting in hassle-free installation and deployment.

## Installation

Installation is simple via Ruby Gems. [Compass](http://compass-style.org/) and [ChunkyPNG](http://github.com/wvanbergen/chunky_png) are required.

    gem install compass-rgbapng

## Using rgbapng with your Compass project

To use rgbapng with your project, require the plugin from your Compass configuration:

    require "rgbapng"

And then import the mixins to your SASS/SCSS files:

    @import "rgbapng";

### Configurable variables

There are two customzable global variables. This first `$rgbapng_path` defines the path to which your PNG images will be saved. This defaults to `rgbapng` inside your Compass images directory. The second `$rgbapng_px_size` defines the pixel square size of the generated png. This defaults to a 5x5 square.

    $rgbapng_path: 'my_pngs';
    $rgbapng_px_size: 8;

### Mixins

There are two mixins available to you.

#### rgba-background($color, [$path, $pixel])

Sets the background property to use the RGBA value, falling back to the compiled PNG.

    @include rgba-background(rgba(0,0,0,0.75));

Compiles to:

    background: url('/images/rgbapng/000000bf.png?1282127952');
    background: rgba(0, 0, 0, 0.75);

#### rgba-background-inline($color, [$pixel])

Sets the background property to use the RGBA value, falling back to a base64 encoded image data.

    @include rgba-background-inline(rgba(0,0,0,0.75));

Compiles to:

    background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNh2A8AAM4AxOSyusMAAAAASUVORK5CYII=');
    background: rgba(0, 0, 0, 0.75);

### Functions

There are two `Sass::Script` functions which can be used in your SASS:

    # Creates the single pixel PNG image
    # Returns a String of the image path and filename
    png_pixelate(color, [dir])
    
    # Returns a String of the base64 encoded image data
    png_base64(color)

## * Cross-browser? Really?

OK, caveat time. When I say "cross-browser", what I really mean is all browsers that either natively support RGBA or support alpha-transparent PNGs. What I don't mean, is IE6. If alpha-transparency in IE6 is important to you, here are some suggestions:

* Use [DD_BelatedPNG](http://www.dillerdesign.com/experiment/DD_belatedPNG/) JavaScript library to bootstrap PNG support to IE6.
* Don't use this plugin at all and instead create your own mixin using [Microsoft's proprietary filters](http://dimox.net/cross-browser-rgba-support/) - just make sure you wash your hands afterwards!
* Be a rebel and either forget about IE6 or serve it up a [universal stylesheet](http://forabeautifulweb.com/blog/about/universal_internet_explorer_6_css).

The choice is yours.

## Credit where it's due

* The CSS technique used was initially described by Lea Verou in [Bulletproof, cross-browser RGBA backgrounds, today](http://leaverou.me/2009/02/bulletproof-cross-browser-rgba-backgrounds/).
* The SASS functions were [first created by Benjamin Doherty](http://gist.github.com/377912) using the RMagick library.

## Copyright

Copyright (c) 2010 [Aaron Russell](http://www.aaronrussell.co.uk/). See LICENSE for details.
