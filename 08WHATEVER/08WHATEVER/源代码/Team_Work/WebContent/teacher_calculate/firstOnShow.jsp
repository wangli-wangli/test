<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page import="com.calculate.Calculate" %>
<%@ page import="com.calculate.CalculateImpl" %>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一年级上册</title>
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
	<a href="../Yangshi/teacher.jsp">首页</a>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">小组</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="../Yangshi/create.jsp">创建小组</a>
	<dd><a href="../Yangshi/teacherFind.jsp">查看小组</a>
	<dd><a href="../Yangshi/GroupFind.jsp">删除小组</a>
	</dl>
	</li>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">个人中心</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="../Yangshi/myselfTeacher.jsp">修改资料</a>
	<dd><a href="../Yangshi/LoginOut.jsp">退出登录</a>
	</dl>
	</li>
</ul>
</div>
</div>
<div id="content" style="font-size:30px;text-align:center;">
<div class="layui-fluid">
<%
User login_user=(User)session.getAttribute("loginUser"); 
String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">一年级上册</legend>
    </fieldset>
<form class="layui-form" action="../Yangshi/sendHomework.jsp">
  <% 
Random random=new Random();
int num=Integer.parseInt(request.getParameter("num"));//题目的总个数
session.setAttribute("num1", num);
int i;
Calculate calculateImpl=new CalculateImpl();
int sum[]=new int[num];
String shizi[]=new String [num];

for(i=0;i<num;)
{
	int add1=random.nextInt(20);
	int add2=random.nextInt(20);
	if(calculateImpl.addTwenty(add1, add2)!=0)
	{
		shizi[i]=add1+"+"+add2+"=";
		sum[i]=calculateImpl.addTwenty(add1, add2);
		session.setAttribute("Shizi"+i, shizi[i]);
		session.setAttribute("correct"+i, ""+sum[i]);
		//为正确答案
%>
   
            	 <td><%=shizi[i]%>&nbsp;&nbsp;&nbsp;
            	 <font color=blue ><%=sum[i] %></font>
            	  <br><br>
            	 </td>
   </tr>
<%	
    i++;
	}
}
%>
<input class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal"style="width:400px;height:80px;font-size:40px;"type="submit" value="上传作业" id="anniu"/>
</form>
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