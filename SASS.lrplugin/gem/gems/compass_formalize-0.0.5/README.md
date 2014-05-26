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
    compass install formalize/jquery-legacy
    compass install formalize/mootools
    compass install formalize/prototype
    compass install formalize/yui

Don't forget to add this to your sass files

 If you're using SCSS syntax, in your stylesheet:

    @import "formalize";

 or if you're using indented (Sass) syntax

    @import "formalize"

After following the provided instructions, we need to tell Compass to use relative paths so that all our resources load correctly. In config.rb, we uncomment the following line:

    relative_assets = true

__New__ in version 0.0.5 
If you don't need or want to support IE6 and/or IE7 you can add the following to your file before your @import "formalize"

If you're using SCSS syntax, in your stylesheet:

    $legacy-support-for-ie6: false;
    $legacy-support-for-ie7: false;
    @import "formalize";

 or if you're using indented (Sass) syntax 

    $legacy-support-for-ie6: false
    $legacy-support-for-ie7: false
    @import "formalize"
    
This will not add the IE 6 and IE 7 css hacks and extra classes to the formalize css. You don't need the JS libraries either.

To remove legacy webkit and firefox support and experimental opera and khtml css see: http://compass-style.org/reference/compass/support

 
And we're all set!


## License


Licensed under MIT/GPL.

GPL license:
http://www.gnu.org/licenses/gpl.html

MIT license:
http://www.opensource.org/licenses/mit-license.php
