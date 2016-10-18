# LiveReload Plugin Repository

LiveReload 2 compilation support is based on plugin design. The plugins for most popular compilers are maintained by LiveReload team; we encourage you to add support for anything we have missed. We intend to ship user-contributed plugins with LiveReload when possible (or make them available via in-app download on platforms which allow that).

Plugins do NOT use any Objective-C code (actually, no code at all at this point, although we plan to allow Ruby/JavaScript later). Developing one for your favorite compiler is crazy-simple.


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

The following user-contributed plugins are currently bundled with LiveReload:

* (none)

The following user-contributed plugins are available, but NOT bundled with LiveReload yet:

* (none)

To add your plugin, please fork this repository, commit the plugin into a separate branch and send us a pull request.


## Updating plugins in this repo

Use Rake tasks (see `rake -T`).

To install node-canvas for Stylus, you'll need Cairo installed. If you're on OS X, you can use Homebrew, but see [issue 14123](https://github.com/mxcl/homebrew/issues/14123); basically, you want to do something like this before running Rake:

    export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig


## Installing a plugin

You need LiveReload 2.0 β7 or later to use plugins.

LiveReload looks for plugins in the following folders:

* ~/Library/LiveReload/Plugins
* ~/Dropbox/Library/LiveReload/Plugins
* LiveReload.app bundle

Just drop the plugin (Something.lrplugin) into one of the Library folders and restart LiveReload.

(The directories are consulted in that order, i.e. you can override a bundled plugin by putting a copy in one of the Library folders, and plugins in ~/Library override the ones found in ~/Dropbox/Library.)


## Developing a plugin

For a Node.js-based compiler:

1. Fork this repository on GitHub then clone your fork, if not already done so. Use free [GitHub for Mac](http://mac.github.com/) if you're not a Git pro.
1. Create a subdirectory for your plugin (Whatever.lrplugin), cd into it.
1. Run `npm install whatever` to save the required npm module into 'Whatever.lrplugin/node_modules/whatever'
1. Bonus points if you modify Rakefile to automatically pull the updates in the future. It should be very easy, see the bottom of the script. Check that it works for you, but be sure to not commit updates to any other plugins together with your plugin. Skip this step if you're not comfortable doing it right.
1. Write manifest.json.
1. Test test test!
1. Create a Git branch for your plugin (`git checkout -b whatever`).
1. Commit your plugin (`git add Whatever.lrplugin; git commit`)
1. Push (`git push -u origin whatever`).
1. Send us a pull request.

For a Ruby-based library:

1. Fork this repository on GitHub then clone your fork, if not already done so. Use free [GitHub for Mac](http://mac.github.com/) if you're not a Git pro.
1. Create a subdirectory for your plugin (Whatever.lrplugin), cd into it.
1. Copy any gems your compiler requires into 'Whatever.lrplugin/lib/whatever'. You need to copy any dependencies as well; for example, for SLIM we end up with `SLIM.lrplugin/lib/temple`, `SLIM.lrplugin/lib/tilt` and `SLIM.lrplugin/lib/slim`. The gem folders should have e.g. `SLIM.lrplugin/lib/slim/lib`, `SLIM.lrplugin/lib/slim/bin` etc.
1. Bonus points (and actually an easier way to do step 1. if you modify Rakefile to automatically pull the updates in the future. It should be very easy, see the bottom of the script. Check that it works for you, but be sure to not commit updates to any other plugins together with your plugin. Skip this step if you're not comfortable doing it right.
1. Write manifest.json. For any gem which your main gem depends on, you need to include `-I$(plugin)/lib/thatothergem/lib` argument to the command line, so that Ruby knows where to find those additional gems. See e.g. SLIM.lrplugin.
1. Test test test!
1. Create a Git branch for your plugin (`git checkout -b whatever`).
1. Commit your plugin (`git add Whatever.lrplugin; git commit`)
1. Push (`git push -u origin whatever`).
1. Send us a pull request.

To publish an update, repeat steps 8–10.


## Plugin structure

A plugin is a subfolder with `.lrplugin` extension and `manifest.json` file inside. A minimal plugin with a single compiler might look like this:

    {
      "LRCompilers": [
        {
          "Name": "MORE",
          "Extensions": ["more"],
          "DestinationExtension": "css",
          "CommandLine": [
            "$(node)",
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


## Important: Keep them cross-platform

We'd like to keep the plugins cross-platform where possible. LiveReload guarantees that it can launch Node.js and Ruby code on any platform. Please ABSTAIN FROM writing scripts in Bash or Perl; occasional INTERCAL may be fine, but please inquire first.

Your plugins will run on Mac and Windows very soon, and maybe even Linux some time later.


## Plugin manifest format

The detailed description of the manifest format is given in comments below (note that JSON format does not actually allow comments, they are added here for explanatory purposes only). This is a maximal example employing all of the available features.

You might also find it helpful to look at manifests of the existing plugins.

    {
      // LRCompilers is the only top-level key for now;
      // in the future we'll have other kinds of stuff you can put in a plugin
      // (be sure to let us know what else you'd like to customize)
      "LRCompilers": [
        {
          // displayed in the UI
          "Name": "LESS",

          // source extensions which identify source files for this compiler
          "Extensions": ["less"],

          // default one; LiveReload will use a different extension if:
          // (1) the user has specified a different file name in compilation options
          // (2) the source file name has "foo.xxx.less" format, in which case the output will be "foo.xxx" by default
          //     e.g. imagine mytemplate.tpl.haml which you want compiled into mytemplate.tpl
          "DestinationExtension": "css",

          // Set to "true" to disable this compiler by default. Intended for compilers which
          // double as view template languages (think Jade or HAML).
          "Optional": true,

          // a script to launch; see below for various available substitutions
          "CommandLine": [
            "$(node)",
            "$(plugin)/node_modules/less/bin/lessc",
            "$(additional)",
            "$(src_path)",
            "$(dst_path)"
          ],

          // If not specified, the plugin will be executed in a temporary directory
          "RunIn": "$(src_dir)",

          // If the compiler exits with non-zero exit code, the following regular expressions are matched
          // against the output to extract an error message (a support for warnings is coming, don't bother
          // for now). These are regular expressions using RegexKitLite/JavaScript syntax with some additional
          // spice:
          //
          // (1) <ESC> matches any ANSI escape sequence; normally, ANSI escapes are stripped from the output,
          //     but if the regexp being matched contains "<ESC>", ANSI escapes are replaced with <ESC> instead
          //     (so that you can use escapes to anchor parts of the message in tricky cases)
          //
          // (2) ((file)), ((line)) and ((message)) are replaced with a capturing group matching the given
          //     part of the message; currently they are replaced with ([^\\n]+?) for file, (\\d+) for line
          //     and (\\S[^\\n]+?) for message; LiveReload also remembers the index of this capture group
          //     to properly extract the data later
          //
          // (3) ((message:S[\w]+ Error)) can be used to override the regexp LiveReload normally uses to
          //     match the given part, but still let LiveReload properly store the index of the capture group
          //
          // A message may also be an object. In that case, "pattern" key is the regular expression as described above,
          // and an optional "message" key instructs LiveReload to replace the message with the given string
          // if the regexp has matched.
          "Errors": [
            "<ESC>((message)) on line ((line))<ESC> in <ESC>((file))(?:<ESC>|\\n)",
            "(Missing ((message))$)",
            "((message:Syntax Error)) on line ((line))",
            "((message:color functions take numbers as parameters))",
            "((message:variable .*? is undefined))",
            "((message:FATAL ERROR: ***))\\n",
            "((file)):((line))\\n[^\\n]*\\n\\s*\\^\\nError: ((message))\\n",
            "^Error: EBADF, ((message)) '((file))'",
            "<ESC>((message)) in ((file))",
            { "pattern": "^TypeError: ", "message": "Internal LESS compiler error" },
            "^((message:file '.*?' wasn't found.))"
          ],

          // This is used to guess a proper output directory automatically, and should list typical names
          // people use for the output of the file. For example, if you create "sass/foo/bar.sass" file
          // and there's "css" folder nearby, the default output path will be inferred to be "css/foo/bar.css".
          "ExpectedOutputDirectories": [
            "css",
            "styles",
            "stylesheet",
            "stylesheets"
          ],

          // Match import statements to let LiveReload compute the import graph so that when you change _foo.less
          // which has been imported into _all.less which has been imported into style.less, it is style.less that
          // gets recompiled.
          "ImportRegExps": [
            "@import \"([^\"]+)\"",
            "@import '([^']+)'",
            "@import ([\\w./]+)"
          ],
          // A supplement to ImportRegExps — a default extension to use if no extension is given in the import
          // statement (multiple may be listed here, will be tried in order).
          "DefaultImportedExts": ["less"],
          // A supplement to ImportRegExps - a list of extensions which aren't actually imported during compilation,
          // so shouldn't be considered partials.
          "NonImportedExts": ["css"]
          // A list of file names to look for for a given imported file name. Defaults to ["$(file)"], which
          // asks to look for the imported file name as is. Handles SASS convention of implicitly prepending
          // an underscore to imported partials without mentioning that in the import statement. (Note that
          // SASS plugin decides to keep looking for non-underscored version as well to err on the safe side,
          // hence the two items. If you only put "_$(file)" here, the underscore will be required.)
          "ImportToFileMappings": [
            "$(file)",
            "_$(file)"
          ],

          // Only Compass uses this so far, meaning that the compiler operates per-project rather than per-file.
          // Note that Compass/SASS autodetection rules are currently hard-coded in the app and not customizable
          // via the plugin system; this is an obvious omission which will be fixed soon; please contact us
          // if you want to add support for a per-project compiler.
          "NeedsOutputDirectory": false,

          // Options to present in Compilation Options UI; these are substituted into $(additional) template
          // in the CommandLine; if you fail to add $(additional), the options will not work.
          "Options": [
            {
              // Id is used to store the value in project data.
              //
              // We store option values by Id instead of simply storing the custom command-line flags to use
              // because if you later decide to change how the option is implemented (maybe the flag gets renamed
              // or you use a different compiler), you still want the user config to be preserved.
              //
              // In the future the user will be able to customize these options per-file by adding a magic comment
              // like "LR-less-debug-info", so be sure to use a sensible and descriptive Id! The namespace scope
              // is this compiler plugin, so don't try to be globally unique. [\w-]+ is the format; don't use
              // underscores or periods.
              "Id": "debug-info",
              // Other type examples follow.
              "Type": "checkbox",
              // Displayed in the options UI
              "Title": "Emit debug info for FireSass",
              // The actual argument to use when the checkbox is checked. To specify multiple arguments, either
              // separate them with a space or use an array here instead of a string (note that a string is split
              // on spaces before substituting any variables, so you won't have problem with space-ridden paths
              // in either case).
              "OnArgument": "--debug-info"
              // Could also use OffArgument:
              // "OffArgument": "--no-debug-info"
            },
            {
              "Id": "output-style",
              // Drop-down list of selections
              "Type": "select",
              "Items": [
                {
                  // Id is saved in project settings and will be used by the user to specify the value using
                  // a magic comment like "LR-less-output-style: nested".
                  "Id": "nested",
                  "Title": "Nested output style"
                },
                {
                  "Id": "compact",
                  "Title": "Compact output style",
                  // string or array, see the discussion for checkbox.OnArgument
                  "Argument": "--style compact"
                },
                {
                  "Id": "compressed",
                  "Title": "Compressed output style",
                  "Argument": "--style compressed"
                },
                {
                  "Id": "expanded",
                  "Title": "Expanded output style",
                  "Argument": "--style expanded"
                }
              ]
            },
            {
              "Id": "identifier",
              // Editable text; please only use this for real options, don't include an option like "other options".
              "Type": "edit",
              "Label": "Eco object identifier:",
              // Displayed in grey inside the text field when no text has been entered; best to display the default
              // value here, but might also be used to give a hint on the proper input format.
              "Placeholder": "ecoTemplates",
              // Argument to include. Again, string or array. Again, even if the user enters something with a space
              // here, $(value) will still be a single argument because variable substitution is performed after
              // the string is split into an array.
              "Argument": ["--identifier $(value)"],
              // If false and nothing is entered, this example will add "--identifier" and "" arguments.
              "SkipIfEmpty": true
            }
          ]

        }
      ]
    }

This format is not ideal, there's too much declarative stuff here. Let us know if your compiler does not fit in the above rules, and we'll fix that.


## String substitution

The following substitutions are available for use in command line-related string values:

* $(ruby) — path to the Ruby interpreter executable (the one chosen in Compilation Options for this project)
* $(node) — path to the Node.js executable
* $(plugin) — root of the plugin folder (e.g. you'd have $(plugin)/manifest.json file there)
* $(project_dir) — folder added to LiveReload
* $(additional) — any additional arguments specified in Compilation Options (note that although you include this as a single command line array item, it will actually be expanded to multiple arguments)

Source file:

* $(src_file) — file NAME only (no path)
* $(src_path) — full file path
* $(src_rel_path) — file path relative to the project folder
* $(src_dir) — parent directory of the file

Output file:

* $(dst_file) — file NAME only (no path)
* $(dst_path) — full file path
* $(dst_rel_path) — file path relative to the project folder
* $(dst_dir) — parent directory of the file

In import file mappings, the only available substitution variable is:

* $(file) — the string captured by the first capture group of the import regular expression


## Publishing plugins

Currently, the recommended way to publish plugins is to contribute them into this repository. You are of course free to publish your plugin in any other way.
