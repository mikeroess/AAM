$(document).ready(function() {
  $('#scroll-up, #scroll-down').click(function(event) {
    event.preventDefault();
    var $body = $('body'),
        new_position = $body.scrollTop() + ($(this).attr('id') == 'scroll-up' ? -300 : 300);
    $body.animate({scrollTop: new_position}, '500');
  });
});
