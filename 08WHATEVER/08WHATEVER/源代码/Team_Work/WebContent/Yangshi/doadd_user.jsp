<%@page import="team.WHATEVER.Math.Util.UserException"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@page import="team.WHATEVER.Math.Util.ValidateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	//接收客户端传递过来的参数
	String username = request.getParameter("姓名");
	String password = request.getParameter("密码");
	String nickname = request.getParameter("昵称");
	String type = request.getParameter("类型");
	int Type = 0;
    boolean validate=ValidateUtil.validateNull(request, new String[]{"密码","昵称","类型"});//使用的同一个request对象
	if(!validate){
%>
	<jsp:forward page="add_user.jsp"></jsp:forward>
<%
	}
	if("老师".contentEquals(type.trim())||"学生".contentEquals(type.trim()))
	{
    if("老师".equals(type))
		Type=0;
    else
    	Type=1;
	UserDaoImpl userDao = new UserDaoImpl();
	try{
		
	userDao.add_user(username, password, nickname,Type,"空");
	//重定向
	response.sendRedirect("add_user.jsp");
	session.setAttribute("info","添加成功");
%>
	
<%
	}catch(UserException e){
		session.setAttribute("info", e.getMessage()+"");
		 response.sendRedirect("add_user.jsp");
%>
	<h2 style="color:red ; font-size:50px">发生错误 : <%=e.getMessage() %></h2>
	<%
	}
	%>
	<%
	}else
	{
	response.sendRedirect("add_user.jsp");
	}	
	%>
</html>