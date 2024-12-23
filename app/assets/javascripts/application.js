const jQuery = require('jquery');
window.jQuery = jQuery;
window.$ = jQuery;

require('bootstrap');
require('jquery.loupe');

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

require('galleries');
