<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil"%>
<%@ page import="team.WHATEVER.Math.model.Operation" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除错题</title>
</head>
<body>

<% 
   int id=Integer.parseInt(request.getParameter("id"));
   UserDaoImpl userDao=new UserDaoImpl();
   userDao.delete_ErrorQuestion(id);
   response.sendRedirect("StudentErrorpage3.jsp"); 
   
%>    
</body>
</html>