$(function(){
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
      $(".banner-arrow>.pre").click(()=>{
        clearInterval(lbTime);
        s--;
        if(s<0){s=result.length-1};
        $(li[s]).siblings().removeClass("opacity");
        $(sli[s]).siblings().removeClass("current");
        $(li[s]).addClass("opacity");
        $(sli[s]).addClass("current");
        lbTime = setInterval(fun2,2500);
      });
      $(".banner-arrow>.next").click(()=>{
        clearInterval(lbTime);
        s++;
        if(s>result.length-1){s=0};
        $(li[s]).siblings().removeClass("opacity");
        $(sli[s]).siblings().removeClass("current");
        $(li[s]).addClass("opacity");
        $(sli[s]).addClass("current");
        lbTime = setInterval(fun2,2500);
      })
    }
  })
})
  // 导航下小导航
  $(function(){    
  var lbjfS = 0 ; //时间控制器  默认为9
  var move = -985;
  var lbjf = $(".jfocus-trigeminy>ul")
  var lbjfli =$(".jfocus-trigeminy>ul>li")
 
  var funjf = function(){
    lbjfS>-3940-move?lbjfS+=move:lbjfS=0 ;
    lbjf.css("left",lbjfS+"px");
  }  
  var lbjftime = setInterval(funjf,2500)
  lbjf.mouseenter(()=>{
    clearInterval(lbjftime)
    $("lbjfli>a").siblings().addClass("nopoint")
  });
  lbjf.mouseleave(()=>{
    lbjftime = setInterval(funjf,2500)
   
  })
  // 小轮播左箭头
  $(".jfocus-trigeminy>.pre").click(()=>{
    clearInterval(lbjftime);
      lbjfS-=move
      if(lbjfS>0){lbjfS=-3940-move};
      lbjf.css("left",lbjfS+"px");
      lbjftime = setInterval(funjf,2500)
  })
  
  // 小轮播右箭头
  $(".jfocus-trigeminy>.next").click(()=>{
    clearInterval(lbjftime);
      lbjfS+=move
      if(lbjfS<-3940-move){lbjfS=0};
      lbjf.css("left",lbjfS+"px");
      lbjftime = setInterval(funjf,2500)
      // console.log(1)
  })
  })
  // 新品导购选项
  $(()=>{
    // 导航栏鼠标移入选中
    var lis = $(".left-layout>.tabs-nav>li")
    lis.mouseenter(function(){
      $(this).addClass("tabs-selected")
      .siblings().removeClass("tabs-selected")
      
    })

    // 右侧导航栏轮播图
    var s = 0 ; //时间控制器  默认为9
    var move = -210;
    var ul = $(".sale-discount>ul");
    var li =$(".sale-discount>ul>li");
   
    var rightlb = function(){
      s>-840-move?s+=move:s=0 ;
      ul.css("left",s+"px");
    }  
    var lbtime = setInterval(rightlb,2500)
    ul.mouseenter(()=>{
      clearInterval(lbtime)
    });
    ul.mouseleave(()=>{
      lbtime = setInterval(rightlb,2500)
    })
    $(".sale-discount>.pre").click(()=>{
      clearInterval(lbtime);
        s-=move
        if(s>0){s=-840-move};
        ul.css("left",s+"px");
        lbtime= setInterval(rightlb,2500)
    })
    
    // 小轮播右箭头
    $(".sale-discount>.next").click(()=>{
      clearInterval(lbtime);
        s+=move
        if(s<-840-move){s=0};
        ul.css("left",s+"px");
        lbtime = setInterval(rightlb,2500)
        // console.log(1)
    })
  })
  // 销量 50 排名
  $(function(){
    var ul = $(".home-sale-layout .indexnewgoods .sale-goods-list>ul");
    var html = ``;
    for(var i=0;i<50;i++){
      html+=`<li>
      <dl>
        <dt class="good-name">
          <a href="" target="_blank" title="盛世zeepower远程距离20mm隔空隐藏形式无线充电器xr苹果x快充板安卓华为小米">盛世zeepower远程距离20mm隔空隐藏形式无线充电器xr苹果x快充板安卓华为小米</a>
        </dt>
        <dd class="good-thumb">
          <a href="" target="_blank">
            <img src="images/index/70_06173033747220649_240.png" alt="" />
          </a>
        </dd>
        <dd class="good-price">
          商城价：
          <em>￥168.00</em>
        </dd>
      </dl>
    </li>`
    }
    // console.log(ul.html());
    ul.html(html);
  })
      
})