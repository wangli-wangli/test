<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
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
  
   int user_id=Integer.parseInt(request.getParameter("id"));
   String group=(String)session.getAttribute("group_name");
   UserDaoImpl userDao=new UserDaoImpl();
   userDao.delete_group(group, user_id);
   response.sendRedirect("./Member_check.jsp");
%>
</body>
</html>