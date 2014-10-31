$(function(){
  $(".author-button").on("click",function(){
    event.preventDefault()
   // var commentForm = ("<input type="text" name="comment"><br><input type="text" name="name">");
  $('.abstract-row').before('<tr><td><label for="poster_user_email">Email</label></td><td><span class="poster-user-email"><input id="poster_user_email" name="poster[user][email][]" type="text"></span></td></tr>')
  // $('.abstract-row').before('escape_javascript(<tr><td><%= ff.text_field :email %></td></tr>)')
  });
});

