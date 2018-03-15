$(function(){
	//设置导航栏的高度
	var winHeight = parseFloat($(window).height());
	var topHeight = parseFloat($('#top').height());
	var leftHeight = winHeight - topHeight;
	var leftdoc = $('#left');
	leftdoc.css('height',leftHeight);
	itin();
	function itin(){
		//左侧导航栏的js效果
		var title = $('.title-name');
		//var title = $('.left-title');
		title.toggle(function(){
			var left_info = $(this).parent('.left-title').find('.left-info');
			left_info.css('display','inline-block');
		},function(){
			var left_info = $(this).parent('.left-title').find('.left-info');
			left_info.css('display','none');
		})
		
		//iframe 的宽度和高度
		var myframe = $('#myframe');
		var winWidth = parseFloat($(window).width());
		var leftWidth = parseFloat($('#left').width());
		var rightWidth = winWidth - leftWidth - 5;
		myframe.css({
			'height':leftHeight,
			'width':rightWidth
		})
	}
	
	
})

$(function(){
	$(".screenbg ul li").each(function(){
		$(this).css("opacity","0");
	});
	$(".screenbg ul li:first").css("opacity","1");
	var index = 0;
	var t;
	var li = $(".screenbg ul li");	
	var number = li.size();
	function change(index){
		li.css("visibility","visible");
		li.eq(index).siblings().animate({opacity:0},3000);
		li.eq(index).animate({opacity:1},3000);
	}
	function show(){
		index = index + 1;
		if(index<=number-1){
			change(index);
		}else{
			index = 0;
			change(index);
		}
	}
	t = setInterval(show,8000);
	//根据窗口宽度生成图片宽度
	var width = $(window).width();
	$(".screenbg ul img").css("width",width+"px");
	
	window.check = function(){
		var no = $("input[name=Sno]");
		var psw = $("input[name=Spsw]");
		var noVal = no.val();
		var pswVal = psw.val();
		if(noVal == "" || noVal == null){
			alert('用户名不能为空');
			return false;
		}
		if(pswVal == "" || pswVal == null){
			alert('密码不能为空');
			return false;
		}
		if(pswVal.length < 6){
			alert('密码不能小于6位');
			return false;
		}	
	}
});