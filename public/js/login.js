$(function(){
  // 用户选择登陆方式
  $(function(){
    var check = $(".login_top>ul>li");
    var a = check
    console.log(a)
    for(var i=0;i<=check.length;i++){
      $(check[i]).click(function(){
        $(this).addClass("tabulous_active")
        .siblings().removeClass("tabulous_active")
        console.log(i)
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