(function($, Cookies, bootstrap) {
  const $document = $(document);

  $document.ready(function() {
    initPageScrolling();

    if ($(window).width() >= 768) {
      initLoupe();
      initLoupeModal();
    }
  });

  const initPageScrolling = function () {
    const $container = $(document.scrollingElement);
    $document.on('click', '#scroll-up, #scroll-down', function(event) {
      event.preventDefault();
      var new_position = $container.scrollTop() + ($(this).attr('id') == 'scroll-up' ? -300 : 300);
      $container.animate({scrollTop: new_position}, '500');
    });
  };

  const initLoupe = function() {
    $('#gallery-image-page .image-container .gallery-image--image')
      .addClass('with-loupe')
      .loupe({width: 250, height: 250});
  };

  const initLoupeModal = function() {
    const LOUPE_COOKIE_NAME = 'gallery_loupe_notice_seen';
    const $modal = $('#loupe-notice-modal');

    if ($modal.length === 0 || Cookies.get(LOUPE_COOKIE_NAME)) {
      return;
    }

    const modal = new bootstrap.Modal('#loupe-notice-modal');
    modal.show();
    Cookies.set(LOUPE_COOKIE_NAME, true);
  };
})(require('jquery'), require('js.cookie'), require('bootstrap'));
