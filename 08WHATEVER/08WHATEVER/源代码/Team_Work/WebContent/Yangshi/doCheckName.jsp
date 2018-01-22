<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
<%@page import="team.WHATEVER.Math.dao.IUserDao"%>
<%@page import="team.WHATEVER.Math.Util.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String name=request.getParameter("姓名");
   User login_user=(User)session.getAttribute("loginUser");//查询到登录用户信息
   boolean validate=ValidateUtil.validateNull(request, new String[]{"姓名"});
   if(!validate){
   %>
   <jsp:forward page="checkName.jsp"></jsp:forward>
<%
   }
   IUserDao userDao=DaoFactory.getDaoImpl();
   User user=userDao.find_user(login_user.getU_Id());
   
   user.setU_Name(name);
   userDao.update_user(user);
   session.setAttribute("loginUser", user);
   response.sendRedirect("join.jsp"); 
   

%>
</body>
</html>