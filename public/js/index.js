$(function(){
  //首页轮播图
  $.ajax({
    url:"http://localhost:8848/index1/cal",
    type:"get",
    dataType:"json",
    success: function(result) {
      // console.log(result)
      // 动态生成轮播图页面级控制器
      var html = ``;
      var slideshtml=``;
      for(var i=0;i<result.length;i++){
        html += `
        <li style="background:url(${result[i].img}) center top no-repeat; z-index: 900; opacity: 0">
                <a href="${result[i].href}"title="${result[i].title}">&nbsp;</a>
            </li>
        `
        slideshtml+=`
          <li class=""><a href="javascript:void(0)">${i}</a></li>
        `
      }
      $("#fullScreenSlides").html(html);
      $(".full-screen-slides-pagination").html(slideshtml)
      // 轮播图实线
      var s=0  // 控制器   初始值为0   
      var li=$("#fullScreenSlides>li");
      var sli=$(".full-screen-slides-pagination>li")
      var fun = function(){
        $(li[s]).addClass("opacity");
        $(sli[s]).addClass("current");
      }
      fun();
      var fun2=function(){
        s++;
        if(s>=result.length){
          s=0;
        }
        $(li[s]).addClass("opacity");
        $(sli[s]).addClass("current");
        $(li[s]).siblings().removeClass("opacity");
        $(sli[s]).siblings().removeClass("current");
      }
      var lbTime=setInterval(fun2,2500);
      // 单击控制器组件
      for(a=0;a<sli.length;a++){
        $(sli[a]).click(
          (function(a){
            return function(){
              clearInterval(lbTime);
              $(li[a]).addClass("opacity");
              $(sli[a]).addClass("current");
              $(li[a]).siblings().removeClass("opacity");
              $(sli[a]).siblings().removeClass("current");
              s=a;
              lbTime=setInterval(fun2,2500)
            }
          })(a)
        )
      }
      li.mouseenter(function(){
        clearInterval(lbTime);
      });
      li.mouseleave(function(){
        lbTime=setInterval(fun2,2500)
      });
      //左右箭头
      


    }
  })
})