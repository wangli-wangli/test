<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.model.User_Group" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建小组</title>
</head>
<body>
<%
        
    UserDaoImpl userDao=new UserDaoImpl();
   
    User login_user=(User)session.getAttribute("loginUser");//查询到登录用户信息
    //获取客户端传递过来的参数
    
    String group=request.getParameter("小组名称");
    boolean  is=false;//判断是否可以加入小组
    	/*List<String> teacher_group=userDao.find_group(login_user.getU_Id());//根据老师的id找到老师的全部小组*/
    	List<String> groups=userDao.find_group();//查找到所有小组名
    	System.out.println("groups"+groups);
    	if(groups.contains("[]"))
    	{
    	for(String groupp2:groups)
    	{
    		System.out.println("groupp2"+groupp2);
    		if(groupp2!=null&&group!=null)
    		{
    		if(!(groupp2.equals(group.trim())))
    		{
    	    	is=true;
    		}
    	    else//如果已经在全部的小组名称中已经找到老师填入的小组名,跳出循环，即该小组已存在。
    	    {
    	    	is=false;break;
    	    }
    		}
    	}
    	if(is==true)
    	{
    		User_Group user_group=new User_Group();
			user_group.setUser_group(group);
			user_group.setUser_id(login_user.getU_Id());
			boolean isadd=userDao.add_group(user_group);//将小组信息增加到数据库表
			if(isadd==true)
			{
				session.setAttribute("add","创建成功");
				response.sendRedirect("create.jsp");
			}
    	}
    	else
    	{
        	session.setAttribute("add", "该小组名已存在");
    		response.sendRedirect("create.jsp");
    	}
    	}
    	else
    	{
    		User_Group user_group=new User_Group();
			user_group.setUser_group(group);
			user_group.setUser_id(login_user.getU_Id());
			boolean isadd=userDao.add_group(user_group);//将小组信息增加到数据库表
    		session.setAttribute("add","创建成功");
			response.sendRedirect("create.jsp");
    	}
    	
%>
</body>
</html>