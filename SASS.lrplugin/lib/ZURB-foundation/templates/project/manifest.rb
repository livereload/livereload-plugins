description 'ZURB-foundation Compass Gem'

# Sass Files
stylesheet 'sass/app.sass', :to => 'app.sass', :media => "screen, projector, print"
stylesheet 'sass/ie.sass', :to => 'ie.sass', :condition => "IE lt 9"
stylesheet 'sass/_settings.sass', :to => '_settings.sass'

# Javascripts
javascript 'javascripts/jquery.min.js', :to => 'jquery.min.js'
javascript 'javascripts/modernizr.foundation.js', :to => 'modernizr.foundation.js'
javascript 'javascripts/forms.jquery.js', :to => 'forms.jquery.js'
javascript 'javascripts/jquery.customforms.js', :to => 'jquery.customforms.js'
javascript 'javascripts/jquery.reveal.js', :to => 'jquery.reveal.js'
javascript 'javascripts/jquery.orbit-1.4.0.js', :to => 'jquery.orbit-1.4.0.js'
javascript 'javascripts/jquery.tooltips.js', :to => 'jquery.tooltips.min.js'
javascript 'javascripts/jquery.placeholder.min.js', :to => 'jquery.placeholder.min.js'
javascript 'javascripts/app.js', :to => 'app.js'

# Make sure you list all the project template files here in the manifest.
html 'index.html'
file 'humans.txt'
file 'robots.txt'
file 'MIT-LICENSE.txt'

# Image Files
image 'images/misc/button-gloss.png', :to => 'misc/button-gloss.png'
image 'images/misc/button-overlay.png', :to => 'misc/button-overlay.png'
image 'images/misc/custom-form-sprites.png', :to => 'misc/custom-form-sprites.png'
image 'images/misc/input-bg.png', :to => 'misc/input-bg.png'
image 'images/misc/input-bg-outset.png', :to => 'misc/input-bg-outset.png'
image 'images/misc/modal-gloss.png', :to => 'misc/modal-gloss.png'
image 'images/misc/table-sorter.png', :to => 'misc/table-sorter.png'
image 'images/orbit/bullets.jpg', :to => 'orbit/bullets.jpg'
image 'images/orbit/left-arrow.png', :to => 'orbit/left-arrow.png'
image 'images/orbit/loading.gif', :to => 'orbit/loading.gif'
image 'images/orbit/mask-black.png', :to => 'orbit/mask-black.png'
image 'images/orbit/pause-black.png', :to => 'orbit/pause-black.png'
image 'images/orbit/right-arrow.png', :to => 'orbit/right-arrow.png'
image 'images/orbit/rotator-black.png', :to => 'orbit/rotator-black.png'
image 'images/orbit/timer-black.png', :to => 'orbit/timer-black.png'


help %Q{

If you need help, email us at foundation@zurb.com or visit foundation.zurb.com"

}

welcome_message %Q{

w00t! You're using ZURB Foundation, now go forth and rock 'n roll!

}