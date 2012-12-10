#= require jquery
#= require jquery_ujs
#= require jquery.validate
#= require messages_pt_BR
#= require facebook_popup
#= require close_for_facebook_login

#= require bootstrap-tab
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

  $('#js-investir-outro-valor').click (event) ->
    event.preventDefault()
    $('#hidden-form').slideDown()

  $('.js-project-tabs').click (event) ->
    event.preventDefault()
    $(this).tab('show')

  $('#hidden-form').validate({
    errorLabelContainer: '#error-container',
    rules: {
      'payment[amount]': {
        required: true,
        min: 60
      }
    }
  })