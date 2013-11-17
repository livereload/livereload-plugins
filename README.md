# LiveReload Plugin Fork
I forked livereload-plugins because the compass autoreload doesn't work.
So I change SASS and COMPASS version to get a SASS plugin which works!

## Available plugins

The following plugins maintained by the LiveReload team are currently bundled with LiveReload:

* CoffeeScript
* IcedCoffeeScript
* Eco
* HAML
* Jade
* LESS
* SASS
* SLIM
* Stylus


## Installing a plugin

You need LiveReload 2.0 β7 or later to use plugins.

LiveReload looks for plugins in the following folders:

* ~/Library/LiveReload/Plugins
* ~/Dropbox/Library/LiveReload/Plugins
* LiveReload.app bundle

Just drop the plugin (Something.lrplugin) into one of the Library folders and restart LiveReload.

(The directories are consulted in that order, i.e. you can override a bundled plugin by putting a copy in one of the Library folders, and plugins in ~/Library override the ones found in ~/Dropbox/Library.)

            "$(plugin)/node_modules/more/bin/morec",
            "$(additional)",
            "$(src_path)",
            "$(dst_path)"
          ],
          "Errors": [
            "((message)) on line ((line))"
          ]
        }
      ]
    }

