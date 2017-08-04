(function($) {
  $(document).ready(function() {
    initPageScrolling();
    initLoupe();
  });

  var initPageScrolling = function initPageScrolling() {
    var $html = $('html'),
        // Firefox does not handle scrollTop with body very well, so we'll use
        // $('html') for that. See http://stackoverflow.com/questions/8149155/animate-scrolltop-not-working-in-firefox
        // for more.
        $container = $html.hasClass('firefox') ? $html : $('body');
    $container.on('click', '#scroll-up, #scroll-down', function(event) {
      event.preventDefault();
      var new_position = $container.scrollTop() + ($(this).attr('id') == 'scroll-up' ? -300 : 300);
      $container.animate({scrollTop: new_position}, '500');
    });
  };

  var initLoupe = function() {
    $('#gallery-image-page #main-image').loupe({width: 250, height: 250});
  };
})(jQuery);
