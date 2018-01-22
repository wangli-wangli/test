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
	String username = request.getParameter("username");
	String password = request.getParameter("密码");
	String nickname = request.getParameter("昵称");
	String type = request.getParameter("类型");
	String group = "空";
	int Type = 0;
	boolean validate=ValidateUtil.validateNull(request, new String[]{"密码","昵称","类型"});//使用的同一个request对象
	if(!validate){
%>
	<jsp:forward page="home.jsp"></jsp:forward>
<%
	}
	User user = new User();
	user.setU_Name(username);
	user.setU_Password(password);
	user.setU_Nickname(nickname);
    if("老师".equals(type))
		Type=0;
    else
    	Type=1;
    user.setU_Type(Type);
    user.setU_Group(group);
	UserDaoImpl userDao = new UserDaoImpl();
	try{
		
	userDao.add_user(username, password, nickname, Type,group);
	//重定向
	out.print("添加成功");
	response.sendRedirect("home.jsp");
%>
	
<%
	}catch(UserException e){
		 session.setAttribute("Error", e.getMessage()+"");
		 response.sendRedirect("home.jsp");
		
%>
   
	<h2 style="color:red ; font-size:50px">发生错误 : <%=e.getMessage() %></h2>
	<%
	}
	%>
</html>