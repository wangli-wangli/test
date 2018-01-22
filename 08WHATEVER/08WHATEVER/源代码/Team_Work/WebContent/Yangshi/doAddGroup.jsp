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
<title>Insert title here</title>
</head>
<body>
<%
    //获取客户端传递过来的参数
    String teacher=request.getParameter("老师昵称");//老师昵称
    String group=request.getParameter("小组名称");
    UserDaoImpl userDao=new UserDaoImpl();
   
    User login_user=(User)session.getAttribute("loginUser");//查询到登录用户信息
    boolean validate=ValidateUtil.validateNull(request,new String[]{"老师昵称","小组名称"});
    if(!validate){
    %>
       <jsp:forward page="join.jsp"></jsp:forward> 
    <%
     }
    
    boolean  is=false;//判断是否可以加入小组
    User teacher_User=userDao.find_user(teacher);
    if(teacher_User!=null)
    {
     if(teacher_User.getU_Type()==0)//查看老师昵称是否正确,小组名称是否正确.如果老师昵称正确
     {
    	List<String> teacher_group=userDao.find_group(teacher_User.getU_Id());//根据老师的id找到老师的全部小组
    	boolean isadd;
    	for(String groupp:teacher_group)
    	{
    	    if(groupp.equals(group))//如果已经在老师的小组里已经找到学生填入的小组名
    		{
    			User_Group user_group=new User_Group();
    			user_group.setUser_group(group);
    			user_group.setUser_id(login_user.getU_Id());
    			isadd=userDao.add_group(user_group);//将小组信息增加到数据库表
    			if(isadd==true)
    			{
    				session.setAttribute("add", "加入成功");
    			}
    			if(isadd=false)
    			{
    				session.setAttribute("add", "你已加入该小组");
    			}
    			is=true;break;	
    		}

    	}
    	if(is)
    	{
    		response.sendRedirect("join.jsp");
    	}
    	else
    	{
    		session.setAttribute("add","小组名称输入错误");
    		response.sendRedirect("join.jsp");
    	}
    }
     else
     {
     	session.setAttribute("add", "老师昵称输入错误");
     	response.sendRedirect("join.jsp");
     }
    }
    else
    {
    	session.setAttribute("add", "老师不存在");
    	response.sendRedirect("join.jsp");
    }
        
    
%>

     

</body>
</html>