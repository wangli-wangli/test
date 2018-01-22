<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.model.Homework" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传作业</title>
</head>
<body>
<%
UserDaoImpl userDao=new UserDaoImpl();
String group=(String)session.getAttribute("group_name");
int h_id=Integer.parseInt(String.valueOf(session.getAttribute("h_id")));
User login_user=(User)session.getAttribute("loginUser");//登录者
int operationNumber=(Integer)session.getAttribute("num1");//题目的总个数

 for(int i=0;i<operationNumber;i++)
 {
	   String Question=(String)session.getAttribute("Shizi"+i);//计算式
	   String CorrectResult=((String)session.getAttribute("correct"+i)).trim();
	   Homework homework=new Homework();
	   homework.setH_gruop(group);
	   homework.setH_Id(h_id);
	   homework.setQ_Question(Question);
	   homework.setQ_RorrectResult(CorrectResult);
	   homework.setU_Id(login_user.getU_Id());
	   userDao.add_homeWork(homework);
	   
 }
response.sendRedirect("./buzhi.jsp");
%>
</body>
</html>