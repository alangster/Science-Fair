$(function() {
  $('.login-link').on('click', function(e) {
    e.preventDefault();
    if ($('.sign-up-form').css('display') !== 'none') {
      $('.sign-up-form').toggle();
    };
    $('.login-form').toggle();
    // ajax
  });

  $('.sign-up-link').on('click', function(e){
    e.preventDefault();
    if ($('.login-form').css('display') !== 'none') {
      $('.login-form').toggle();
    };
    $('.sign-up-form').toggle();
    // ajax
  });
});
