<%@page import="java.util.List"%>
<%@page import="team.WHATEVER.Math.Util.UserException"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@page import="team.WHATEVER.Math.Util.ValidateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>
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
	<a href="Show.jsp">首页</a>
    <a href="add_user.jsp">用户添加</a>
    <a href="List.jsp">用户列表</a>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">个人中心</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="myselfUser.jsp">修改资料</a>
	<dd><a href="Loginout.jsp">退出登录</a>
	</dl>
	</li>
</ul>
</div>
</div>
<div id="content">
<%
    //筛选
   String content = request.getParameter("content");
    if(content==null||"".equals(content))
    {
    	content = "";
    }
	UserDaoImpl userDao = new UserDaoImpl();
	List<User> users = userDao.load(content);
	//获取登录用户信息
	User loginuser=(User)session.getAttribute("loginUser");
	
%>
 <form action="List.jsp"  method="post">  
	         <td colspan="8">
	          <span style="text-align:center;font-size:30px;color:red;">请输入用户姓名或昵称 :</span>&nbsp;
	            <input type="text" name="content" style="width:1000px; height:80px;font-size:50px;" />&nbsp;
	            <input type="submit" value="搜索"style="width:120px; height:60px;color:green;font-size:40px;font-family:楷体"/>
	         </td>
	   </form>
<table class="layui-table">
			<thead>
			<tr>
			<th style="font-size:30px;text-align:center;">用户编号</th>
			<th style="font-size:30px;text-align:center;">用户昵称</th>
			<th style="font-size:30px;text-align:center;">用户姓名</th>
			<th style="font-size:30px;text-align:center;">用户密码</th>
			<th style="font-size:30px;text-align:center;">用户类型</th>
			<th colspan="2" style="font-size:30px;text-align:center;">用户操作</th>
		</tr>
		</thead>
		<%
			for( User user : users ){
		%>
		<tr>
			<td style="font-size:30px;text-align:center;"> <%=user.getU_Id() %></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getU_Nickname() %></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getU_Name() %></td>
			<td style="font-size:30px;text-align:center;"> <%=user.getU_Password() %></td>
		<td>
		      <%
		       if(user.getU_Type()==0)
		       {
		    	   %>
                         <span style="color:#000000; font-family:楷体;font-size:30px;text-align:center;">老师</span>
                         <%		
		
			   }else if(user.getU_Type()==1)
			   {
			    %>
			        <span style="color:#000000; font-family:楷体;font-size:30px;text-align:center;">  学生</span>
		        <%		
		
			   }else
			   {
			   %>
			        <span style="color:red; font-family:楷体;font-size:30px;text-align:center;">  管理员</span>
			      <%
			    }
		     %>
		</td> 
			<td> <a href="delete.jsp?id=<%=user.getU_Id()%>"><span style="color:blue;font-size:30px">删除</span></a></td>
			<td> <a href="updateInput.jsp?id=<%=user.getU_Id()%>"><span style="color:blue;font-size:30px">更新</span></a></td>
		</tr>
		<%
			}
		%>
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
</script>
</body>
</html>