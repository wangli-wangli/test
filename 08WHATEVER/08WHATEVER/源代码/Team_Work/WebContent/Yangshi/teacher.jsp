<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老师界面</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
<div class="head_nav" style="height:70px">
<a class="head_logo" href="">
<img src="../images/log.jpg"/>
</a>
<div class="head_nav_R">
<ul class="layui-nav" style="background-color:white">
	<a href="teacher.jsp">首页</a>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">小组</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="create.jsp">创建小组</a>
	<dd><a href="teacherFind.jsp">查看小组</a>
	<dd><a href="GroupFind.jsp">删除小组</a>
	</dl>
	</li>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">个人中心</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="myselfTeacher.jsp">修改资料</a>
	<dd><a href="Loginout.jsp">退出登录</a>
	</dl>
	</li>
</ul>
</div>
</div>
<div id="content">
<%
    User login_user=(User)session.getAttribute("loginUser");
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>
<div style="text-align:right;font-size:20px;">
   <span style="font-size:40px;font-family:楷体;">你好</span><span style="font-size:40px;color:red;">&nbsp;[<%=login_nickname %>]</span>&nbsp;
</div>
<%        
       if(session.getAttribute("INFO")==null)
       {
    	   session.setAttribute("INFO", "");
       }
%>
<%=session.getAttribute("INFO") %>
<div class="layui-carousel" id="test1">
	  <div carousel-item>
	    <div><img src="../images/首页.jpg" width="1320" height="750"/></div>
	    <div><img src="../images/老师.jpg" width="1320" height="750"/></div>
	  </div>
</div>
</div>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>

<script src="../layui/layui.js"></script>
<script>
layui.use('element', function(){
  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
layui.use('carousel', function(){
	  var carousel = layui.carousel;
	  //建造实例
	  carousel.render({
	    elem: '#test1'
	    ,width: '1320px' //设置容器宽度
	    ,height:'750px'
	    ,arrow: 'hovor' //始终显示箭头
	    ,anim: 'default' //切换动画方式
	  });
	});
	var carousel = layui.carousel;

	//监听轮播切换事件
	carousel.on('change(test1)', function(obj){ //test1来源于对应HTML容器的 lay-filter="test1" 属性值
	console.log(obj.index); //当前条目的索引
	console.log(obj.prevIndex); //上一个条目的索引
	console.log(obj.item); //当前条目的元素对象
	});
	var ins = carousel.render(options);

	//重置轮播
	ins.reload(options);

</script>
</body>
</html>