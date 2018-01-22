<%@page import="team.WHATEVER.Math.model.User"%>
<%@page import="team.WHATEVER.Math.model.Homework"%>
<%@page import="team.WHATEVER.Math.model.Operation"%>
<%@page import="java.util.List"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小组答题情况</title>
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
    <legend style="color:red;font-size:25px;">小组答题情况</legend>
    </fieldset>
    <a href="checkH.jsp" class="layui-btn" style="background:red;float:right;">返回</a> 
  <!-- <table class="layui-hide" id="test"></table> -->

<table class="layui-table">
  
  <%
  
  String h_id2=request.getParameter("h_id");
  int h_id=Integer.parseInt(h_id2);
  UserDaoImpl userDao=new UserDaoImpl();
  List<Integer> student_ids=userDao.find_id(group);
  session.setAttribute("h_id", ""+h_id);
  %>
  <thead>
 <tr>
      <th style="font-size:30px;text-align:center;">小组成员姓名</th>
      <th style="font-size:30px;text-align:center;">小组成员昵称</th>
      <th style="font-size:30px;text-align:center;">答对题数</th>
      <th style="font-size:30px;text-align:center;">答错题数</th>
      <th style="font-size:30px;text-align:center;">操作</th>
    </tr> 
   </thead>
  <% 
 
  for(int student_id:student_ids)
  {
	
	  if(student_id==login_user.getU_Id())//如果遍历到老师
	  {
		  
	  }
	  else
	  {
		  User student=userDao.find_user(student_id);//找到该小组的学生
		  if(student==null)
		  {
			%>
			
			<%
		  }
		  else
		  {
		  List<Operation> operations=userDao.find_Operations2(h_id, student_id);//找到该学生做的此次作业
		  int dui=0;//做对的题
		  int cuo=0;//做错的题
		  for(Operation operation:operations)
		  {
			  if(operation.getQ_Status()==0)
				  dui++;
			  else
				  cuo++;
		  }
	  
		  %>
		  <tbody>
		  <tr>
		  <td style="font-size:30px;text-align:center;"><%=student.getU_Name()%></td>
		  <td style="font-size:30px;text-align:center;"><%=student.getU_Nickname()%></td>
		  <td style="font-size:30px;text-align:center;"><%=dui %></td>
		  <td style="font-size:30px;text-align:center;"><%=cuo %></td>
		  <td style="font-size:30px;text-align:center;"> <a href="check_person.jsp?user_id=<%=student.getU_Id() %>">查看完成情况</a></td>
		  </tr>
		  </tbody>
	  <% 
		  }
	  }
  }
  
%>

</table>
  
  
</div>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;<a href="#" style="font-size:16px; color:red">联系我们</a>

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
var table = layui.table;
layui.use('table', function(){
	  var table = layui.table;
table.render({
  elem: '#test'
  ,url:'/demo/table/user/'
  ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
  ,cols: [[
    {field:'id', width:'20%', title: '小组成员姓名'}
    ,{field:'username', width:'20%', title: '答对题的数量'}
    ,{field:'sex', width:'20%', title: '答错题的数量'}
    ,{field:'sex', width:'40%', title: '操作'}
  ]]
})
});
</script>
</body>
</html>