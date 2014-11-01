$(document).ready(function(){

  var posters = $(".poster");
  var poster_authors = $(".poster-authors");
  var poster_tags = $(".poster-tags");

  poster_authors.hide();
  poster_tags.hide();

  posters.mouseover(function(event){
    $(this).find(".poster-authors").show();
    $(this).find(".poster-tags").show(); 
  });
  posters.mouseout(function(event){
    $(this).find(".poster-authors").hide();
    $(this).find(".poster-tags").hide(); 
  });
})