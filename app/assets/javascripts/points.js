$(function() {
  $('.comment-points > form').on('submit', function(e) {
    e.preventDefault();
    var comment = $(this);
    var url = comment.attr('action');
    comment.hide();
    $.ajax({
      url: url,
      type: "POST",
      data: {},
      dataType: "json",
      success: function(response) {
        comment.parent().parent().find('span.points').text(response);
      },
      error: function(response) {
        console.log(response);
      }
    });
  });
});

$(function() {
  $('.user-points > form').on('submit', function(e) {
    e.preventDefault();
    var comment = $(this);
    var url = comment.attr('action');
    comment.hide();
    $.ajax({
      url: url,
      type: "POST",
      data: {},
      dataType: "json",
      success: function(response) {
        comment.parent().parent().find('span.points').text(response);
      },
      error: function(response) {
        console.log(response);
      }
    });
  });
});

$(function() {
  $('.poster-points > form').on('submit', function(e) {
    e.preventDefault();
    var comment = $(this);
    var url = comment.attr('action');
    comment.hide();
    $.ajax({
      url: url,
      type: "POST",
      data: {},
      dataType: "json",
      success: function(response) {
        comment.parent().parent().find('span.poster-points-number').text(response);
      },
      error: function(response) {
        console.log(response);
      }
    });
  });
});
