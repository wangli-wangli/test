<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
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
       User loguser = (User)session.getAttribute("loginUser");
       if(loguser.getU_Type()==0)
       {
    	   response.sendRedirect(request.getContextPath()+"/Yangshi/teacher.jsp");
       }
       else if(loguser.getU_Type()==1)
       {
    	   response.sendRedirect(request.getContextPath()+"/Yangshi/firstStudent.jsp");
       }
       else
       {
    	   response.sendRedirect(request.getContextPath()+"/Yangshi/Show.jsp");
       }
       
%>
</body>
</html>