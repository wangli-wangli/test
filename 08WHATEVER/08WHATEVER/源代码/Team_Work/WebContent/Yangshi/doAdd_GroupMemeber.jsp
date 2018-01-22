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
        
    UserDaoImpl userDao=new UserDaoImpl();
    User login_user=(User)session.getAttribute("loginUser");//查询到登录用户信息
    //获取客户端传递过来的参数
    String name=request.getParameter("学生昵称");
    
    String group=(String)session.getAttribute("group_name");
    boolean validate=ValidateUtil.validateNull(request,new String[]{"学生昵称"});
    if(!validate){
%>
  <jsp:forward page="addStudent.jsp"></jsp:forward> 
<%
     }
   %>
   <%
   User user=userDao.find_user3(name);//通过姓名查找到这个用户
   boolean  is=true;//判断是否可以加入小组
   if(!(user==null))
   {
	   if(user.getU_Type()==1)
	   {
   List<String> student_group=userDao.find_group(user.getU_Id());//根据学生的id找到学生的全部小组
  
   for(String groupp:student_group)
	{
	   
	    if(!(groupp.equals(group.trim())))
		{
	    	is=true;
		}
	    else//如果已经在学生的小组里已经找到该小组名,跳出循环，即该小组已存在，即该学生已在此小组中。
	    {
	    	is=false;break;
	    }  
	  
	   }
	if(is==true)
	{
		User_Group user_group=new User_Group();
		user_group.setUser_group(group);
		user_group.setUser_id(user.getU_Id());
		boolean isadd=userDao.add_group(user_group);//将小组信息增加到数据库表
		if(isadd==true)
		{
			session.setAttribute("info","添加成功");
			response.sendRedirect("addStudent.jsp");
		}
	}
   if(is==false)
	{
   	session.setAttribute("info", "该学生已在此小组中");
		response.sendRedirect("addStudent.jsp");
	} 
   }
   else
   {
	   session.setAttribute("info", "该用户不是学生");
	   response.sendRedirect("addStudent.jsp");
   }
   }
   else
   {
	   session.setAttribute("info", "该用户不存在");
		response.sendRedirect("addStudent.jsp");
   }
   %>
</body>
</html>