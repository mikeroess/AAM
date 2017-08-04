// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.loupe
//= require_tree .

var $html = $('html');

// Browser detection.
if (navigator.userAgent.indexOf('Chrome') > -1) {
  $html.addClass('chrome');
}
else if (navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1) {
  $html.addClass('safari');
}
else if (navigator.userAgent.indexOf('Firefox') > -1) {
  $html.addClass('firefox');
}
else if (navigator.userAgent.indexOf('MSIE') > -1) {
  $html.addClass('ie');
}
