$(function() {
  $('.login-link').on('click', function(e) {
    e.preventDefault();
    $('.login-form').toggle();
    // ajax
  });

  $('.sign-up-link').on('click', function(e){
    e.preventDefault();
    $('.sign-up-form').toggle();
    // ajax
  });
});
