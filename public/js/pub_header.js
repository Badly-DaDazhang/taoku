$(function(){
  $.ajax({
    type:"get",
    url:"public_header.html",
    success: function(pub_header) {
      $(pub_header).replaceAll("header")
    }
  })
})