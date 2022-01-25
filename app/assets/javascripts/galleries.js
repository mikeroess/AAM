(function($) {
  $(document).ready(function() {
    initPageScrolling();
    initLoupe();
  });

  var initPageScrolling = function initPageScrolling() {
    var $container = $(document.scrollingElement);
    $(document).on('click', '#scroll-up, #scroll-down', function(event) {
      event.preventDefault();
      var new_position = $container.scrollTop() + ($(this).attr('id') == 'scroll-up' ? -300 : 300);
      $container.animate({scrollTop: new_position}, '500');
    });
  };

  var initLoupe = function() {
    if ($(window).width() >= 768) {
      $('#gallery-image-page #main-image')
        .addClass('with-loupe')
        .loupe({width: 250, height: 250});
    }
  };
})(jQuery);
