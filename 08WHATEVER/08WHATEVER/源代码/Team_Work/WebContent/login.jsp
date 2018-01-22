<%@page import="team.WHATEVER.Math.Util.UserException"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@page import="team.WHATEVER.Math.dao.IUserDao"%>
<%@page import="team.WHATEVER.Math.Util.DaoFactory"%>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
   //接收客户端传递过来的参数
	String nickname = request.getParameter("昵称");
	String password = request.getParameter("密码");
	boolean validate=ValidateUtil.validateNull(request, new String[]{"昵称","密码"});
	     if(!validate){
	    	 
	    	 %>
	    		<jsp:forward page="home.jsp"></jsp:forward>
	    	<%
	     
	     }
	     %>
	     <%
	     IUserDao userDao=DaoFactory.getDaoImpl();
	     User user= userDao.find_user(nickname);
	     if(!(user==null))
	     {
	    	 if(password.contentEquals(user.getU_Password()))
	    	 {
	    		 session.setAttribute("loginUser",user);
	    			response.sendRedirect(request.getContextPath()+"/Yangshi/connect1.jsp");
	    	 }
	    	 else
	    	 {
	    		 session.setAttribute("loginError","密码错误");
	    		 response.sendRedirect("home.jsp");
	    		 
	    	 }
	     }
	     else
	     {
	    	  session.setAttribute("loginError","用户不存在");
	    	  response.sendRedirect("home.jsp");
	     }
	     %>
	<%-- try
	{
	IUserDao userDao=DaoFactory.getDaoImpl();
	User user= userDao.login(nickname, password);
	
	session.setAttribute("loginUser",user);
	response.sendRedirect(request.getContextPath()+"/connect1.jsp");
	
	}catch(UserException e)
	{
	  System.out.println(e.getMessage());
	  //验证出错
	  request.setAttribute("loginError",e.getMessage());
	%> 
	<jsp:forward page="LoginInput.jsp"></jsp:forward> 
	<%
	  
	} --%>
 