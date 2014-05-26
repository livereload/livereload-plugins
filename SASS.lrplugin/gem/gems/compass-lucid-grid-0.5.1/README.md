#Lucid: A _smarter_ CSS grid for Compass

###Philosophy

CSS grids make web development easier... except when they don't. Wrapping `<div>`s, `.alpha` `.omega` madness, and fighting with gutters to get layouts aligned... These are the compromises that developers are forced live with.

Lucid is an effort to make CSS grids _sane_ again by taking full advantage of [SASS](http://sass-lang.com/) and [Compass](http://compass-style.org/).

###The Basics

* Configure grid dimensions / columns instantly through variables
* Fixed width (`px` based) for finer control
* Tested in IE6+, Chrome, FF

###The Specifics

* Add borders and padding _directly to your grid elements_ without using nested `<div>`s or ugly overrides
* Use "gutterless" grid elements for nesting and precise styling
* Create new rows without wrapping `<div>`s
* Cater to multiple screen widths by initializing new grid dimensions within media queries
* Achieve leaner compiled CSS than other SASS grids, due to Lucid's internal [@extend](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#extend) logic

#Documentation

##Installation

```bash
(sudo) gem install compass-lucid-grid
compass help -r lucid lucid
```

Then

```bash
cd your_existing_project
echo "require 'lucid'" >> config.rb
compass install -r lucid lucid
```

##Setup `+grid-init` 

After installation, `@import` \_grid.scss or copy its contents into your base file. Defaults (safe to remove) are shown below:

```scss
// Remove the following line if Compass has already been included
@import "compass/utilities/general/clearfix";

// Grid dimensions
$grid-width: 990px;
$grid-columns: 12;

// The amount of margin to apply to each side of a grid element
$grid-gutter: 15px;

// The distance between the grid container and the first grid element
$grid-outer-gutter: 15px;

// Use "pie-clearfix", "overflow", or "none"?
$grid-clearfix: "pie-clearfix";

// Center rows?
$grid-centering: true;

// Include Lucid
@import 'lucid';

// Output 4 CSS classes that Lucid uses as @extend "hooks"
@include grid-init;
```

##Basic Layout `+container, +columns( $columns (int) )` 

Now we're ready to style. All you need is a grid container and its child elements to start.

Note: Instead of applying repetative styles directly to each and every element, Lucid groups selectors that contain the same styles. This results in MUCH leaner compiled CSS.

```scss
/* SCSS */

.blue-box {
  @include container;     // container element to "contain" child elements
  background: blue;

  .sidebar {
    @include columns(4);  // 4 column element (1/3 row)
  }

  .main {
    @include columns(8);  // 8 column element (2/3 row)
  }

  .custom {
    @include columns(0);  // custom width element (includes only float and gutters)
    width: 123px;
  }
}

.red-box {
  @include container;     // multiple containers are fine and dandy
  background: red;
}


/* Compiled CSS */

.grid-clearfix:after,     // clearfix styles
.grid-container:after,
.blue-box:after,
.red-box:after {
  content: "";
  display: table;
  clear: both;
}

.grid-container,          // shared container styles
.blue-box,
.red-box {
  margin-left: auto;
  margin-right: auto;
  width: 990px;
}

.blue-box {               // unique container styles
  background: blue;
}

.red-box {
  background: red;
}

.grid-element,            // shared grid element styles
.blue-box .sidebar,
.blue-box .main,
.blue-box .custom {
  display: inline;
  float: left;
  margin-left: 15px;
  margin-right: 15px;
}

.blue-box .sidebar {      // 4 column width
  width: 300px; 
}

.blue-box .main {         // 8 column width
  width: 630px;
}

.blue-box .custom {       // custom width
  width: 123px;
}
```

##Adjusting for Borders and Padding `+columns( $columns (int), $adjustment (px) )`

Grids typically don't play nice with borders and padding - these properties affect the width of elements, causing layouts to break. Using a wrapping `<div>` was often the cleanest method to accomodate styling.

With Lucid, this practice is no longer necessary - you can now adjust the width of grid elements individually. Just add your total borders / padding together and pass the negative value as a mixin parameter.

Note: Adjusting the width of a grid element makes it less suitable as a parent element for nesting (it can no longer contain the full expected width).

####Old Way:

```html
<div class="container">
  <div class="wrapper">
    <div class="safe-to-style">
      <!-- content -->
    </div>
  </div>
</div>
```

```scss
.wrapper {
  // grid float, width, styles
}

.safe-to-style {
  border: 1px solid #ccc;
  padding: 19px;
}
```

####With Lucid:

```html
<div class="container">
  <div class="look-ma-no-wrapper">
    <!-- content -->
  </div>
</div>
```

```scss
.look-ma-no-wrapper {
  @include columns(3, -40px);  // (1px + 19px) * 2

  border: 1px solid #ccc;
  padding: 19px;
}
```

##Gutterless Elements `+columns( $columns (int), $adjustment (px), $gutters (0 || none) )`

Sometimes, it's convenient to have grid elements without gutter margins. This is especially useful for nesting elements or defining custom margins.

To turn off gutters, just pass a third parameter:

```scss
.gutterless {                     // a gutterless element
  @include columns(9, 0, none);   // $gutters can accept 'none' or '0'

  .nested {
    @include column(3);
  }

  .also-nested {
    @include column(6);
  }
}
```

##Offset Positioning `+offset( $offset (int), $gutters (0 || none) )`

Layouts oftentimes call for a bit of whitespace. Not a problem with Lucid. Just remember to specify whether the element you're including to has gutters or not - this is factored into the calculation.

Unlike other grids that use padding or relative positioning to achieve this, Lucid does it with just `margin-left`. That means the element itself can still safely recieve background styling.

```scss
.offset-to-the-right {
  @include columns(6);
  @include offset(3);         // shifts element to the right 3 columns
}

.offset-to-the-left {
  @include columns(6);
  @include offset(-3);        // shifts element to the left 3 columns
}

.offset-gutterless {
  @include columns(6, 0, none);
  @include offset(3, none);   // include 'none' or '0' when grid element is gutterless
}
```

##New Rows `+row-break`

Elements that exceed the width of the container will automatically wrap into the next row. If you want to insert a "row break" manually, it's dead simple:

```scss
.container {
  @include container;       // this 12 column container
                            // would normally accomodate all 4 children
  .on-row-1 {
    @include columns(3);
  }

  .also-on-row-1 {
    @include columns(3);
  }

  .on-row-2 {
    @include columns(3);    // this would have been on row 1
    @include row-break;     // +row-break puts it on row 2
  }

  .also-on-row-2 {
    @include columns(3);    // all following elements affected as well
  }
}
```

#Advanced

##Media Queries and Grid Reformatting `+grid-reinit`

Lucid uses pixels, which means that it's a fixed-width grid (percentages aren't precise enough). Fortunately, this doesn't mean that your sites have to be fixed-width.

"Reinitialize" Lucid inside a media query (or any other a wrapping container) to adjust the size of grid elements within the container. Just preface it with a new `$grid-width` and/or `$grid-columns`.

```scss
/* Full width grid */

@include grid-init;

.container { @include container; }
.sidebar { @include column(3); }
.main { @include column(9); }

/* Miniature grid within media query */

@media screen and (max-width: 480px) {

  // redeclare one or more variables
  $grid-width: 480px;
  $grid-columns: 6;

  @include grid-reinit;
  
  .container { @include container; }
  .sidebar { @include column(2); }
  .main { @include column(4); }

}
```

##Modifying @extend Hooks

Lucid uses `@extend` internally to achieve leaner stylesheets. In order to do this, `+grid-init` outputs four benign selectors for `@extend` to "hook" onto. These selectors can be modified (defaults shown):

```scss
$grid-hook-clearfix: ".grid-clearfix";
$grid-hook-container: ".grid-container";
$grid-hook-element: ".grid-element";
$grid-hook-gutterless: ".grid-column-gutterless";

@include grid-init;
```

##Unsemantic Class Names `+grid-classes( $gutterless (bool), $prefix (str), $prefix-gutterless (str) )`

For testing purposes, or for those who are unwilling to part with old ways, Lucid provides a class name generator mixin:

```scss
// where # is the number of columns

// outputs .g1 => .g#
@include grid-classes;

// outputs gutterless classes in addition (.gl1 => .gl#);
@include grid-classes(true);

// changes the class prefixes (outputs .grid-1 => .grid-# and .gutterless-1 => .gutterless-#)
@include grid-classes(true, 'grid-', 'gutterless-');
```

#Your Turn

Love it? Hate it? Bugs? Suggestions?

[I'd love to know.](https://github.com/ezYZ/lucid/issues) Thanks for stopping by!

\-Y
