# Compass Formalize

This is an extension for [Compass](http://beta.compass-style.org) for
[Formalize](http://formalize.me),
[Nathan Smith](http://sonspring.com)'s excellent HTML Form stylesheet
project.

## Installation

Install the extension via Ruby Gems:

    gem install compass_formalize


If you're starting from scratch, create your Compass project:

    compass create my-project -r compass_formalize

If you're adding the library to an existing project, add the following to your config.rb file:

    require 'compass_formalize'

To apply the Formalize pattern, run one of the following, depending on
your JavaScript framework taste:

    compass install formalize/dojo
    compass install formalize/extjs
    compass install formalize/jquery
    compass install formalize/mootools
    compass install formalize/prototype
    compass install formalize/yui

After following the provided instructions, we need to tell Compass to use relative paths so that all our resources load correctly. In config.rb, we uncomment the following line:

    relative_assets = true

And we're all set!


## License


Licensed under MIT/GPL.

GPL license:
http://www.gnu.org/licenses/gpl.html

MIT license:
http://www.opensource.org/licenses/mit-license.php
