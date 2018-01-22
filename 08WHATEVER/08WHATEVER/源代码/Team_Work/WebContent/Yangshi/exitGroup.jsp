<%@page import="team.WHATEVER.Math.model.User"%>
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

    User login_user=(User)session.getAttribute("loginUser"); 
   int user_id=login_user.getU_Id();
   String group=(String)session.getAttribute("小组");
   UserDaoImpl userDao=new UserDaoImpl();
   userDao.delete_group(group, user_id);
   response.sendRedirect("studentDeleteGroup.jsp");
%>
</body>
</html>