$(function(){
  // 用户选择登陆方式
  $(function(){
    var check = $(".login_top>ul>li>a");
    // console.log(check[1])
    check.click(function(){
      $(check).addClass("tabulous_active") 
      
    })
  })
})