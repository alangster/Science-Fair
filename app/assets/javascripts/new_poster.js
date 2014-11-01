$(function(){

	var emailNum = 0
	$('.hidden-email').hide()

  $(".author-button").on("click",function(){
    event.preventDefault()
  	console.log($('.hidden-email')[emailNum]);
  	$($('.hidden-email')[emailNum]).show();
  	emailNum++;
  });
});

