<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
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
   String time=request.getParameter("time");
   if(count==null)
	   count="10";
   if(grade==null)
   {
	   grade="一年级上册";
   }
   int time2;
   if(time.equals("5"))
	   time2=5;
   else  if(time.equals("10"))
	   time2=10;
   else  if(time.equals("20"))
	   time2=20;
   else  if(time.equals("30"))
	   time2=30;
   else 
	   time2=60;
   if(grade.equals("一年级上册"))
       response.sendRedirect("../calculate/FirstOnEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("一年级下册"))
	   response.sendRedirect("../calculate/FirstNextEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("二年级上册"))
	   response.sendRedirect("../calculate/SecondOnEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("二年级下册"))
	   response.sendRedirect("../calculate/SecondNextEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("三年级上册"))
	   response.sendRedirect("../calculate/ThirdOnEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("三年级下册"))
	   response.sendRedirect("../calculate/ThirdNextEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("四年级上册"))
	   response.sendRedirect("../calculate/FourthOnEntry.jsp?num="+count+"&time="+time2);
   
   else if(grade.equals("四年级下册"))
	   response.sendRedirect("../calculate/FourthNextEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("五年级上册"))
	   response.sendRedirect("../calculate/FifthOnEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("五年级下册"))
	   response.sendRedirect("../calculate/FifthNextEntry.jsp?num="+count+"&time="+time2);
   else if(grade.equals("六年级上册"))
	   response.sendRedirect("../calculate/SixOnEntry.jsp?num="+count+"&time="+time2);
   else 
	   response.sendRedirect("../calculate/SixthNextEntry.jsp?num="+count+"&time="+time2);
   
	   
   
%>
</body>
</html>