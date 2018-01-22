<%@page import="team.WHATEVER.Math.model.Homework"%>
<%@page import="java.util.*"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看小组成员</title>
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
    <legend style="color:red;font-size:25px;">查看成员信息</legend>
    </fieldset>
    <a href="teacherFind'.jsp" class="layui-btn" style="background:red;float:right;">返回</a><br><br>
  <div class="layui-btn-container" style="text-align:center">
    </div>
  <% 
  
  UserDaoImpl userDao=new UserDaoImpl(); 
  List<Integer> student_ids=userDao.find_id(group);
  List<User> Student_Members=new ArrayList<User>();
  Student_Members.clear();
  User user=null;
  for(int stu_id:student_ids)
  {
	  user=userDao.find_user(stu_id);
	  if(user!=null)
	  {
	  if(user.getU_Type()==1)
	  {
	  Student_Members.add(user);
	  }
	  }
  }
  %>
  <table class="layui-table">
  <colgroup>
    <col width="20%">
    <col width="20%">
    <col width="20%">
    <col>
  </colgroup>
  <thead>
      <tr>
			<th style="font-size:30px;text-align:center;">学生姓号</th>
			<th style="font-size:30px;text-align:center;">学生昵称</th>
			<th colspan="1" style="font-size:30px;text-align:center;">用户操作</th>
			
		</tr>
		</thead>
		<%
			for( User user1 : Student_Members ){

		%>
		 <tbody>
		<tr>
			<td style="font-size:25px;text-align:center;"> <%=user1.getU_Name() %></td>
			<td style="font-size:25px;text-align:center;"> <%=user1.getU_Nickname() %></td>
			<td style="font-size:25px;text-align:center;"> <a href="Move_Group.jsp?id=<%=user1.getU_Id() %>" ><span style="color:red;">移除</span></a></td>
		</tr>
		<%} %>
		</tbody>
  </table>

  
  
  
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