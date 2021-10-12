import $ from 'jquery';

document.addEventListener("turbolinks:load", function(){
  $(".like_toggle").click(function(){
    let button = $(this);
    $.ajax({
      type: "POST",
      url: `/user/posts/${button.attr("id")}/like_toggle`,
      success: function(data){
        toggleButton(button, data);
      }
    })
  });

  function toggleButton(button, data){
    let buttonIcon = button.children().first();
    if(data.liked==true){
      buttonIcon.css("color", "#80c0ff");
      
    }else {
      buttonIcon.css("color", "#fff");
    }
    button.next().html(data.likesCount)
  }
});