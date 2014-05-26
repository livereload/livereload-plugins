# Make sure you list all the project template files here in the manifest.

# Image Import
file '../common/button.png', :like => :image, :to => 'button.png'
file '../common/select_arrow.gif', :like => :image, :to => 'select_arrow.gif'

discover :all

description "Teach your forms some manners."

help %Q{
  Please see the Formalize website for documentation:

      http://formalize.me/
}

welcome_message %Q{

  Formalize assets have been copied to the proper asset folders
  based on your Compass configuration.

  Usage:

   If you're using SCSS syntax, in your stylesheet:

     @import "formalize";

   or if you're using indented syntax

     @import "formalize"

   In your HTML markup, include the JavaScript implementation of
   your choice:

   <script src="/javascripts/mootools.formalize.js"></script>

  Please see the Formalize website for documentation:

      http://formalize.me/
}

