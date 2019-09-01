$(function(){
  $.ajax({
    type: "get",
    url: "public_nav.html",
    success: function (result) {
      //代码替换
      $(result).replaceAll("#public_nav");
      $.ajax({
        type:"get",
        dataType:"json",
        url:"http://localhost:8848/index1/getcate",
        success:function(result2){
        // console.log(result2);
            // console.log(result2);
            // 循环生成导航列表
          var html =``;
          for(var i=0;i<result2.length;i++){
            html+=`
              <li class="${i%2==0?"odd":"even"}">
                <div class="class">
                  <span class="ico">
                    <img src="images/index/${result2[i].img}" alt="">
                  </span>
                  <h4><a href="">${result2[i].fname}</a></h4>
                  <span class="arrow"></span>
                </div>
                <div class="sub-class" style="display: none; top:${-34*i}px;" cat_menu_id="888">
                  <div class="sub-class-content">
                    <div class="recommend-class">
            `
            if(result2[i].hotgoods){
              var hotarr = result2[i].hotgoods.split(",")
              for(var j=0;j<hotarr.length;j++){
                html+=`
                      <span><a href="">${hotarr[j]}</a></span>
                `;
              }
            }
            html+=`
                    </div>
                  
            `
            $.ajax({
              type:"get",
              url:"http://localhost:8848/index1/getcatenums",
              data:{fid:result2[i].fid},
              dataType:"json",
              async: false,
              success:function(sonresult){
                // console.log(sonresult);
                for(var j=0;j<sonresult.length;j++){
                  html+=`
                  <dl>
                    <dt>
                      <h3><a href="">${sonresult[j].fname}</a></h3>
                    </dt>
                    <dd>`
                      // <a href="">电视</a>
                      var sons = sonresult[j].fnember.split(",")
                      console.log(sons);
                      for(var s=0;s<sons.length;s++){
                        html+=`
                        <a href="javascript:;">${sons[s]}</a>
                        `
                      }
                  html+=`
                    </dd>
                  </dl>
                  `
                  
                }
              }
            })
          
            // <h3><a href="">家用电器</a></h3>
            
            html+=`    
                  <div class="sub-class-right">
                    <div class="brans-list">
                      <ul>
                        <li>
                          <a href="" title="复旦申花">
                          <img src="images/index/06178945232014916_small.jpg" />
                          <span>复旦申花</span>
                          </a>
                        </li>
                      </ul>
                    </div>
                    <div class="adv-promotions">
                      <a target="_blank" href="">
                        <img src="images/index/05858318772100637.jpg" alt="" />
                      </a>
                    </div>
                  </div>
                </div>
              </li>
            `;  
          }

          $(".menu").html(html);
          // 循环生成热门商品 
        }  
      })
    }
  })
})