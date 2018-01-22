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
   String grade=request.getParameter("grade");
   String count=request.getParameter("count");
   if(grade.equals("一年级上册"))
       response.sendRedirect("../teacher_calculate/firstOnShow.jsp?num="+count);
   else if(grade.equals("一年级下册"))
	   response.sendRedirect("../teacher_calculate/FirstNextShow.jsp?num="+count);
   else if(grade.equals("二年级上册"))
	   response.sendRedirect("../teacher_calculate/SecondOnShow.jsp?num="+count);
   else if(grade.equals("二年级下册"))
	   response.sendRedirect("../teacher_calculate/SecondNextShow.jsp?num="+count);
   else if(grade.equals("三年级上册"))
	   response.sendRedirect("../teacher_calculate/ThirdOnShow.jsp?num="+count);
   else if(grade.equals("三年级下册"))
	   response.sendRedirect("../teacher_calculate/ThirdNextShow.jsp?num="+count);
   else if(grade.equals("四年级上册"))
	   response.sendRedirect("../teacher_calculate/FourthOnShow.jsp?num="+count);
   
   else if(grade.equals("四年级下册"))
	   response.sendRedirect("../teacher_calculate/FourthNextShow.jsp?num="+count);
   else if(grade.equals("五年级上册"))
	   response.sendRedirect("../teacher_calculate/FifthOnShow.jsp?num="+count);
   else if(grade.equals("五年级下册"))
	   response.sendRedirect("../teacher_calculate/FifthNextShow.jsp?num="+count);
   else if(grade.equals("六年级上册"))
	   response.sendRedirect("../teacher_calculate/SixthOnShow.jsp?num="+count);
   else 
	   response.sendRedirect("../teacher_calculate/SixthNextShow.jsp?num="+count);
   
   
%>
</body>
</html>