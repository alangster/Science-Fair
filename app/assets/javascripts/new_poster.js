$(function(){

	var emailNum = 0
	$('.hidden-email').hide()

  $(".author-button").on("click", function(event){
    event.preventDefault();
  	$($('.hidden-email')[emailNum]).show();
  	emailNum++;
  });
});

