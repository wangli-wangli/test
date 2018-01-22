<%@page import="team.WHATEVER.Math.Util.UserException"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
<%@page import="team.WHATEVER.Math.dao.IUserDao"%>
<%@page import="team.WHATEVER.Math.Util.DaoFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    //接收客户端传递过来的参数
    int id=Integer.parseInt(request.getParameter("id"));
    String name=request.getParameter("姓名");
    String password=request.getParameter("密码");
    String nickname=request.getParameter("昵称");
    User Login_user=(User)session.getAttribute("loginUser");
    boolean flag=true;
     boolean validate=ValidateUtil.validateNull(request, new String[]{"密码","昵称"});
     if(!validate){
    	  if(Login_user.getU_Type()==0)
    	  {
     %>
     <jsp:forward page="myselfTeacher.jsp"></jsp:forward>
    <%
    	  }
    	  else if(Login_user.getU_Type()==1)
    	  {
    		  %>
    		     <jsp:forward page="myself.jsp"></jsp:forward>
    		    <%  
    	  }
    	  else
    	  {
    		  %>
 		     <jsp:forward page="myselfUser.jsp"></jsp:forward>
 		    <% 
    	  }
     }
     IUserDao userDao=DaoFactory.getDaoImpl();
     List<User> users=userDao.find_users();
     User user=userDao.find_user(id);
     if(name==null&&"".equals(name))
     {
   	    user.setU_Name("");
     }
     else{
    	 if(!(user.getU_Name().contentEquals(name.trim())))
    	 {
    		 session.setAttribute("INFO", "修改成功");
    	 }
     
   	 user.setU_Name(name);
     }
     if(password==null&&"".equals(password))
     {
   	    user.setU_Password("");
     }
   
     else
     {
    	 
    	 if(!(user.getU_Password().contentEquals(password.trim())))
    	 {
    		 session.setAttribute("INFO", "修改成功");
    	 }
    	 user.setU_Password(password);
     }
     for(User user2:users)
     {
    	 if(user2.getU_Nickname().contentEquals(nickname))
    	 {
    		 flag=false;
    	 }
     }
     if(flag)
     {
     
     user.setU_Password(password);
     user.setU_Nickname(nickname);
     
     session.setAttribute("INFO", "修改成功");
     }
     else
     {
    	 if(!(user.getU_Nickname().equals(nickname)))
    	 {
    	 session.setAttribute("INFO", "该昵称已存在");
    	 }
     }
     userDao.update_user(user);
     user=userDao.find_user(id);
     //将查询出来的数据封装到session中
     session.setAttribute("loginUser", user);
     if(Login_user.getU_Type()==1)
     {
    	 response.sendRedirect("myself.jsp");
     }
     else if(Login_user.getU_Type()==0)
     {
    	 response.sendRedirect("myselfTeacher.jsp");
     }
     else
     {
         response.sendRedirect("myselfUser.jsp");
     }
    	  
%>
