$(function(){
	$.ajax({
		type:"get",
		url:"public_top.html",
		success:function(pub_top){
			$(pub_top).replaceAll("#public_top");
			var html= "";
			var uname = sessionStorage.getItem('uname');
			if(uname){
				html = `
					<div class="user-entry">您好
            <span> 
            	<a href="javascript:;">${uname}</a>
            	<div class="nc-grade-mini" style="cursor: pointer;"onclick="javascript:go('https://www.taokubuy.com/shop/index.php?act=pointgrade&op=index');">V0</div>
            </span> 欢迎回来，<a href="https://www.taokubuy.com"
				title="首页"
				alt="首页"><span>淘库商城</span></a>
			<span>[<a href="https://www.taokubuy.com/shop/index.php?act=login&op=logout">退出</a>]
			</span>
          
				`;
			}
			
		}
	});
})

