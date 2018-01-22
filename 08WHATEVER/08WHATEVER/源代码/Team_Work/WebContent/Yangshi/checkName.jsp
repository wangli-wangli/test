<%@page import="team.WHATEVER.Math.Util.ValidateUtil"%>
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
<jsp:include  page="../calculate/top.jsp"></jsp:include>
<div id="content">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">你还没有填写真实姓名哦</legend>
    </fieldset>
    <%
    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>
    <div style="text-align:right;font-size:20px;">
          你好[<%=login_nickname %>]&nbsp;
    </div>
<form action="doCheckName.jsp" method="post"><br><br><br>
<%
   
   if("".contentEquals(login_user.getU_Name()))
   {
	 %>
	 <div class="layui-form-item">
     <label class="layui-form-label"></label>
     <input type="text" name="姓名" required  lay-verify="required" placeholder="快来设置姓名" autocomplete="off" class="layui-input" style="font-size:30px;width:500px;height:100px;">
     </div>
	 <%
   }
   else
   {
	   response.sendRedirect("join.jsp");
   }
%>
 <div class="layui-form-item">
  <div class="layui-input-block">
     <input type="submit" value="提交"  class="layui-btn" lay-submit lay-filter="formDemo" style="font-size:20px;width:300px;height:80px;margin-left:80px;"></a>
    </div>
</table>
</form>
</body>
</html>