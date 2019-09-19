$(function(){
  // 用户选择登陆方式
  $(function(){
    var check = $(".login_top>ul>li>a");
    // console.log(check[1])
    for(var i=0;i<=check.length;i++){
      $(check[i]).click(function(){
        $(this).addClass("tabulous_active")
        .siblings().removeClass("tabulous_active")
        console.log($(this)[0]  ,  ($(this)[0].siblings()))
      })
    }
  })
  // 登陆验证
  var btn = $("#btn>button")
  btn.click(function(){
    var uname = $("#uname").val()
    var upwd = $("#upwd").val()
    var reg =/^\w{6,20}$/
  })
})