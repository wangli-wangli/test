<%@page import="team.WHATEVER.Math.model.Homework"%>
<%@page import="java.util.List"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择作业编号</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
<div class="head_nav" style="height:70px">
<a class="head_logo" href="#">
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
<div class="layui-fluid">
<%
    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
    
    String group=(String)session.getAttribute("group_name");
    %>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">选择作业编号</legend>
        <a href="teacherFind'.jsp" class="layui-btn" style="background:red;float:right;">返回</a><br><br>
    </fieldset>
  <div class="layui-btn-container" style="text-align:center">
  <%
  
UserDaoImpl userDao=new UserDaoImpl();
List<Integer> h_ids=userDao.find_h_id(group);
int is=-1;
for(int h_id:h_ids)
{
	if(h_id!=is)
	{
		List<Homework> homeworks=userDao.find_homework(h_id);
		String time=homeworks.get(0).getQ_Date();//得到第一个作业的时间
	%>
	<a href="checkDati.jsp?h_id=<%=h_id%>"><button class="layui-btn" style="width:200px;height:100px; "><h1 style="font-size:30px"><%=h_id %></h1></button> <span>发布时间 ：<%=time %></span><br></a>
	<% 
	is=h_id;
	}
	
}
%>
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
layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    layer.msg(JSON.stringify(data.field));
	    return false;
	  });
	});
</script>
</body>
</html>