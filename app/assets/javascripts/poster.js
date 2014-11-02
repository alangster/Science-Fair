$(document).ready(function(){
  $(".poster_comment_reply_form").hide();
  $(".poster_comment_reply_button").on("click", function(event){
    event.preventDefault();
    $(this).next(".poster_comment_reply_form").toggle();
  });


$(".poster_comment_reply_form > form").on("submit", function(event){
  event.preventDefault();
  var that = $(this);
  var form = that.serialize();
  $.ajax({
      url: "/comments",
      type: "POST",
      dataType: "json",
      data: form,
      success: function(response){
        that[0].reset();
        that.after("<li>Your Comment: "+ response.text +"</li>");
      },
      error: function(response){
      }
    });
  });

  $(".poster_comment_form > form").on("submit", function(event){
    event.preventDefault();
    var form = $(this).serialize();
    $.ajax({
      url: "/comments",
      type: "POST",
      dataType: "json",
      data: form,
      success: function(response){
        $('.poster_comment_form > form')[0].reset();
        $("#poster_comment_list_ul").before("<br>" +"<a href = \"/users/" + response.user_id + "\">" + response.name + "</a> - "+ response.text + "<br><span class=\"points-tag\">Points: </span><span class=\"points\">0</span><div class=\"comment-points\"></div>");
      },
      error: function(response) {
        console.log("failure");
      }
    });
  });





  var native_width = 0;
  var native_height = 0;

  $(".magnify").mousemove(function(e){
    var pic_source = $(".pic_small").attr("src");
    $(".pic_large").css("background-image", 'url('+pic_source+')');
    //When the user hovers on the image, the script will first calculate
    //the native dimensions if they don't exist. Only after the native dimensions
    //are available, the script will show the zoomed version.
    if(!native_width && !native_height)
    {
      //This will create a new image object with the same image as that in .pic_small
      //We cannot directly get the dimensions from .small because of the
      //width specified to 200px in the html. To get the actual dimensions we have
      //created this image object.
      var image_object = new Image();
      image_object.src = $(".pic_small").attr("src");

      //This code is wrapped in the .load function which is important.
      //width and height of the object would return 0 if accessed before
      //the image gets loaded.
      native_width = image_object.width;
      native_height = image_object.height;
    }
    else
    {
      //x/y coordinates of the mouse
      //This is the position of .magnify with respect to the document.
      var magnify_offset = $(this).offset();
      //We will deduct the positions of .magnify from the mouse positions with
      //respect to the document to get the mouse positions with respect to the
      //container(.magnify)
      var mx = e.pageX - magnify_offset.left;
      var my = e.pageY - magnify_offset.top;

      //Finally the code to fade out the glass if the mouse is outside the container
      if(mx < $(this).width() && my < $(this).height() && mx > 0 && my > 0)
      {
        $(".pic_large").fadeIn(100);
      }
      else
      {
        $(".pic_large").fadeOut(100);
      }
      if($(".pic_large").is(":visible"))
      {
        //The background position of .pic_large will be changed according to the position
        //of the mouse over the .pic_small image. So we will get the ratio of the pixel
        //under the mouse pointer with respect to the image and use that to position the
        //pic_large image inside the magnifying glass
        var rx = Math.round(mx/$(".pic_small").width()*native_width - $(".pic_large").width()/2)*-1;
        var ry = Math.round(my/$(".pic_small").height()*native_height - $(".pic_large").height()/2)*-1;
        var bgp = rx + "px " + ry + "px";

        //Time to move the magnifying glass with the mouse
        var px = mx - $(".pic_large").width()/2;
        var py = my - $(".pic_large").height()/2;
        //Now the glass moves with the mouse
        //The logic is to deduct half of the glass's width and height from the
        //mouse coordinates to place it with its center at the mouse coordinates

        //If you hover on the image now, you should see the magnifying glass in action
        $(".pic_large").css({left: px, top: py, backgroundPosition: bgp});
      }
    }
  })

  $(".right_side_bar_before a").on("click", function(event) {
    // event.preventDefault();
    // $(this).toggle();
    $(".right_side_bar_after").toggle();
  });

  $(".right_side_bar_after a").on("click", function(event) {
    // event.preventDefault();
    $(".right_side_bar_after").toggle();
  });

  $(".bottom_bar_before").on("click", function(event) {
    // event.preventDefault();
    // $(this).toggle();
    $(".bottom_bar_after").toggle();
  });

  $(".bottom_bar_after a").on("click", function(event) {
    // event.preventDefault();
    $(".bottom_bar_after").toggle();
  });

  console.log(window.innerHeight);
  $(".pic_small").css("height", window.innerHeight);


  $(window).on("resize", function() {
    // console.log(window.innerHeight);
    $(".pic_small").css("height", window.innerHeight);
  });
})
