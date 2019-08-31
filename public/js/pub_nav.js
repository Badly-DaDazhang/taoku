$(function(){
  $.ajax({
    type: "get",
    url: "public_nav.html",
    success: function (result) {
      //代码替换
      $(result).replaceAll("#public_nav");
      $.ajax({
        type:"get",
        url:"http://localhost:8848/index1/getcate",
        success:function(result2){
          console.log(result2.length);
          var html =``;

        }
      })
    }
  });
})