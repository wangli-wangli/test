<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/head.css" rel="stylesheet" type="text/css"/> 
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
<link href="../css/Grade.css" rel="stylesheet" type="text/css"/> 
</head>
 <body onLoad="timedCount()">
 <div class="head_nav" style="height:70px"> 
<a class="head_logo" href="#"> 
<img src="../images/log.jpg"/>
</a>
 <div class="head_nav_R"> 
<ul class="layui-nav" style="background-color:white"> 
	<a href="../Yangshi/firstStudent.jsp">首页</a>
	<a href="../Yangshi/excuse.jsp">练习做题</a>
	<a href="../Yangshi/studentFind.jsp">查看作业</a>
	<a href="../Yangshi/studentHistory.jsp">历史记录</a>
	<a href="../Yangshi/StudentErrorpage1.jsp">错题本</a>
	<li class="layui-nav-item layui-this" style="underline:none; background:white"> 
	<a href="javascript:;" style="color:black">小组</a>
	 <dl class="layui-nav-child" style="none" >
	<dd><a href="../Yangshi/checkName.jsp">加入小组</a>
	<dd><a href="../Yangshi/studentDeleteGroup.jsp">退出小组</a>
	</dl>
	</li>
	 <li class="layui-nav-item layui-this" style="underline:none; background:white"> 
	<a href="javascript:;" style="color:black">个人中心</a>
	 <dl class="layui-nav-child" style="none" >
	<dd><a href="../Yangshi/myself.jsp">修改资料</a>
	<dd><a href="../Yangshi/Loginout.jsp">退出登录</a>
	</dl>
	</li>
</ul>
</div>
</div>
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
</script>
</body>
</html>