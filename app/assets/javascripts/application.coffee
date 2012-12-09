#= require jquery
#= require jquery_ujs
#= require facebook_popup
#= require close_for_facebook_login

#= require jquery.flexslider


$ ->
  jQuery(".js-slider-home").flexslider
    animation: "fade"
    # controlsContainer: ".controls-container .controls-inner"
    slideshow: true
    directionNav: true
    controlNav: true
    pauseOnHover: false
    slideshowSpeed: 7000
    animationDuration: 600

  $('#js-investir-outro-valor').click ->
    $('#hidden-form').slideDown()