$(function(){
  // 用户选择登陆方式
  $(function(){
    var check = $(".login_top>ul>li>a");
    check.click(function(){
      $(check).addClass("tabulous_active") 
      .siblings().removeClass("tabulous_active")
    })
  })
})