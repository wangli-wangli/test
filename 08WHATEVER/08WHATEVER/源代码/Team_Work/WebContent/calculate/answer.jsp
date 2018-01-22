<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.model.Operation" %>
<%@ page import="team.WHATEVER.Math.model.ErrorQuestion" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>答案界面</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
 <jsp:include  page="./top.jsp"></jsp:include>
<div id="content">
<%
    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>
<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">答案</legend>
    </fieldset>
   <div style="position: relative; width: 100%; display: table; * position: absolute; * top: 50%; * left: 0;">
   <p style="font-size:30px;position: relative; top: 50%; left: 0; text-align: center; width: 100%; * top: 0;">
<%
  UserDaoImpl userDao=new UserDaoImpl();
  int operationNumber=(Integer)session.getAttribute("num1");//题目的总个数
   //int operationNumber=Integer.parseInt(number);
   int dui=0;//答对题的个数
   int cuo=0;//答错题的个数
   for(int i=0;i<operationNumber;i++)
   {
	   String Question=(String)session.getAttribute("Shizi"+i);//计算式
	 
	   String inputResult=request.getParameter("jie"+i).trim();
	   String CorrectResult=((String)session.getAttribute("correct"+i)).trim();
	  
	   Operation operation=new Operation();
	   %>
	   
	   <%=Question %><%=inputResult %>
	   <% 
	   if(CorrectResult.equals(inputResult))
	   {
		   operation.setQ_Status(0);
		   dui++;
	   %>
	   <font color="green">√</font>
	    <%
            	             if((i%2)==0){
            	             %>
            	            	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            	             <% 
            	             }else{
            	             %>
            	            	<br><br>
            	            <%} %>	 
	   <%
	   }else{
	   %>
	   <font color="red">×</font>
	   &nbsp;&nbsp;&nbsp;
	    <%=CorrectResult %>
	     <%
            	             if((i%2)==0){
            	             %>
            	            	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            	             <% 
            	             }else{
            	             %>
            	            	<br><br>
            	            <%} %>	 
	   <%
	   operation.setQ_Status(-1);
	   cuo++;
	   
	   
	   ErrorQuestion errorQuestion=new  ErrorQuestion();
	   errorQuestion.setQ_CorrectResult(CorrectResult);
	   errorQuestion.setQ_Question(Question);
	   errorQuestion.setQ_Type(0);
	   errorQuestion.setU_Id(login_user.getU_Id());
	   userDao.add_ErrorQuestion(errorQuestion);//将错题增加到错题表里
	   }
	   operation.setU_Id(login_user.getU_Id());
	   operation.setQ_Question(Question);
	   operation.setQ_CorrectResult(CorrectResult);
	   operation.setQ_Type(1);
	   operation.setQ_InputResult(inputResult);
	   userDao.add_operation(operation);
	   
   }

%>
恭喜你，答对了<span style="font-size:40px;color:red;"><%=dui %></span>道题，答错了<span style="font-size:40px;color:red;"><%=cuo %></span>道题！！！
</p>
</div>
</div>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>
</div>
<script src="../layui/layui.js" charset="utf-8"></script>
<script>
layui.use('element', function(){
  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});     
</script>
<script></script>
</body>
</html>