# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


scrolled = 0
$(document).ready ->
  $("#scroll-down").on "click", ->
    scrolled = scrolled + 300
    $(".scrollable-gallery").animate scrollTop: scrolled
    return

  $("#scroll-up").on "click", ->
    scrolled = scrolled - 300
    $(".scrollable-gallery").animate scrollTop: scrolled
    return

  
  return