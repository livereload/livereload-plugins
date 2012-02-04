# Font-stack
A [Compass](http://compass-style.org/) plugin that provides a library of CSS font stacks configured as [Sass](http://sass-lang.com/) variables. 
Each font stack tries to provide fallback fonts for Windows, Mac and Linux that have roughly the same characteristics as the primary font in the stack. 

## Installation

Install the plugin:

    sudo gem install font-stack

To add font-stack to an existing compass project add the following line to your compass configuration file:

    require 'font-stack'

## Example Usage

    @import "font-stack"

    body { font-family: $tahoma-font-stack; }
    h1 { font-family: $palatino-font-stack; }
    code { font-family: $monospace-font-stack; }
    .signature { font-family: $cursive-font-stack; }

## List of Font Stacks

http://github.com/lloydk/font-stack/blob/master/lib/stylesheets/_font-stack.scss


## Todo

- Add additional fonts to the cursive font-stack
- Add mixins 

 
## Credits

Serif and sans-serif font stacks from:
[www.awayback.com - A Revised Font Stack](http://www.awayback.com/revised-font-stack)


Monospace font stack from: 
[articles.sitepoint.com - 8 Definitive Web Font Stacks](http://articles.sitepoint.com/article/eight-definitive-font-stacks)


Cursive font stack from:
[www.codestyle.org - Build better CSS font stacks, Cursive font stack featuring Bradley Hand ITC](http://www.codestyle.org/css/font-family/BuildBetterCSSFontStacks.shtml)
   