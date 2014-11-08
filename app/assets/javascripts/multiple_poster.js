$(document).ready(function(){
   var currentPage = $('.current-page').html();

  $('.select-control').on('change', function (e) {
    var option_data = {
      filter: $('.select-filter option:selected').html(),
      sort: $('.select-sort option:selected').html(),
      page: currentPage,
    }
    $.ajax({
      url: "/filter_sort",
      type: "GET",
      data: option_data,
      success: function(response){
        var allPosters= $('.all-posters');
        allPosters.empty();
        allPosters.append(response);
      },
      error: function(response){
        console.log(response);
      }
    });

    var response = $.get("/filter_sort", option_data)
    response.done(function(response) {
      var allPosters= $('.all-posters');
      allPosters.empty();
      allPosters.append(response);
    })
    response.fail(function(response) {
      console.log(response);
    })
  });

})