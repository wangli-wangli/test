<%@page import="java.util.List"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.Homework"%>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<a href="teacher.jsp" >首页</a>
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
<%
User login_user=(User)session.getAttribute("loginUser"); 
String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>


<div id="content" style="text-align:center">
<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<div class="layui-fluid">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
<legend style="color:red;font-size:25px;">删除小组</legend>
</fieldset>

<div class="layui-btn-container" style="text-align:center">
    <% 
     UserDaoImpl userDao=new UserDaoImpl();
     List<String> groups=userDao.find_group(login_user.getU_Id());
     %>
     <table class="layui-table">
     <thead>
         <tr>
   			<th style="font-size:30px;text-align:center;">小组名称</th>
   			<th colspan="1" style="font-size:30px;text-align:center;">用户操作</th>		
   		</tr>
   		</thead>
   		<%
     for(String group:groups)
     {
    	 session.setAttribute("小组", group);
    	 %>
    	  <tbody>
		<tr>
			<td style="font-size:25px;text-align:center;"> <%=group%></td>
			<td style="font-size:25px;text-align:center;"> <a href="Delete_Group.jsp" ><span style="color:red;">删除</span></a></td>
		</tr>
		<%
		} 
		%>
		</tbody>
		</table>

 
</div>
</div>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;
<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>
</div>
<script src="../layui/layui.js" charset="utf-8"></script>
<script>
layui.use('element', function(){
  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});
layui.use('ul', function(){
	  var ul = ul.form; //只有执行了这一步，部分表单元素才会自动修饰成功
	  
	  //……
	  
	  //但是，如果你的HTML是动态生成的，自动渲染就会失效
	  //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
	  form.render();
	});      
</script>
<script></script>
</body>
</html>