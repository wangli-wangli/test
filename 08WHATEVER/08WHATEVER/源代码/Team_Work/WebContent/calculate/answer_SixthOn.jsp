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
<title>六年级上册</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
<link rel="stylesheet" href="../css/Grade.css" />
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
 <div id="middle">
<%
  UserDaoImpl userDao=new UserDaoImpl();
  int operationNumber=(Integer)session.getAttribute("num1");//题目的总个数
   int dui=0;//答对题的个数
   int cuo=0;//答错题的个数
   for(int i=0;i<operationNumber;i++)
   {
	   String Question=(String)session.getAttribute("Shizi"+i);//计算式
	   String inputFenzi=request.getParameter("Molecule"+i).trim();
	   String inputFenmu=request.getParameter("jie"+i).trim();
	   String CorrectFenzi=((String)session.getAttribute("correctFenzi"+i)).trim();
	   String CorrectFenmu=((String)session.getAttribute("correctFenmu"+i)).trim();
	   Operation operation=new Operation();
	 
	   
		
		int first=Question.indexOf("/");//第一个/出现的位置
		int second=Question.indexOf("+");//第一个符号出现的位置
		
		
		if(second<=0)
		{
			second=Question.indexOf("-");
		}
		
		
		if(second<=0)
		{
			second=Question.indexOf("×");
		 
		}
		if(second<=0)
		{
			second=Question.indexOf("÷");
			
		}
		
		int three=Question.indexOf("/",first+1);//第二个"/"出现的位置 
		int four=Question.indexOf("=");//“=”出现的位置
		String str1_fenzi=Question.substring(0, first);//第一个分数的分子
		
   	    String str1_fenmu = Question.substring(first + 1, second);//第一个分数的分母
       String str2_fenzi=Question.substring(second+1,three);//第二个分数的分子
     	String str2_fenmu = Question.substring(three+1, four );//第二个分数的分母
     	String character;
		character=Question.substring(second,second+1);
		
		
   	
	   %>
	    <div class="fraction" style="font-size:30px;"><div>
	     <%=str1_fenzi %></div>
	     <div style="border-top:2px solid black;font-size:30px;">
	     <%=str1_fenmu %></div></div><div class="nomal">
	    <%=character %></div><div class="fraction" style="font-size:30px;"><div>
	     <%=str2_fenzi %></div><div style="border-top:2px solid black;font-size:30px;">
	     <%=str2_fenmu %></div></div> <div class="nomal"> =</div>
	  <%="<div class='fraction' style='font-size:30px;'><div>" %>
	   <%=inputFenzi %>
	   <%if(inputFenzi.equals("")&&inputFenmu.equals("")){
		  
	   }else{%>
	   <%="</div><div style='border-top:2px solid black;'>"%>
	   <%} %>
	   <%=inputFenmu %>
	   <%="</div></div>"%> 
	                            
	   <% 
	   
	   if(CorrectFenzi.equals(inputFenzi)&&(CorrectFenzi.equals(inputFenzi)))
	   {
		   operation.setQ_Status(0);
		   dui++;
	   %>
	   <div class='nomal' style='font-size:30px;'>
	   <font color="green">√</font></div>
		   <%
		   if(i%2==0)
		    {
			 %>
		   &nbsp;<div class="nomal" > &nbsp; </div>&nbsp;<div class="nomal">&nbsp;</div>
		   <%
		    }
		   else
		   {
			   %>
			   <br><br><br><br>
			   <%
		   }
	   }else{
	   %>
	   <div class='nomal' style='font-size:40px;'>
	   <font color="red">×</font>
	   </div>
	   <div class='fraction' style='font-size:30px;'><div>
	   <%=CorrectFenzi %>
	   </div><div style='border-top:2px solid black;'>
	   <%=CorrectFenmu %>
	   </div></div>
	    <%
		   if(i%2==0)
		    {
			 %>
		   &nbsp;<div class="nomal" > &nbsp; </div>&nbsp;<div class="nomal">&nbsp;</div>
		   <%
		    }
		   else
		   {
			   %>
			   <br><br><br><br><br>
			   <%
		   }
	   operation.setQ_Status(-1);
	   cuo++;
	  
	  
	   String CorrectResult=CorrectFenzi+"/"+CorrectFenmu;
	   ErrorQuestion errorQuestion=new  ErrorQuestion();
	   errorQuestion.setQ_CorrectResult(CorrectResult);
	   errorQuestion.setQ_Question(Question);
	   errorQuestion.setQ_Type(1);
	   errorQuestion.setU_Id(login_user.getU_Id());
	   userDao.add_ErrorQuestion(errorQuestion);//将错题增加到错题表里
	   }
	   String inputResult;
	   if("".equals(inputFenmu)&&("".equals(inputFenzi)))
	   {
		   inputResult="";
	   }
	   else{
		   inputResult=inputFenzi+"/"+inputFenmu;
	   }
	  
	   String CorrectResult=CorrectFenzi+"/"+CorrectFenmu;
	   operation.setU_Id(login_user.getU_Id());
	   operation.setQ_Question(Question);
	   operation.setQ_CorrectResult(CorrectResult);
	   operation.setQ_Type(0);
	   operation.setQ_InputResult(inputResult);
	   userDao.add_operation(operation);
	   
   }
%>
<h1 text-align:center>恭喜你，答对了<span style="color:red; font-size:30px;"><%=dui %></span>道题，答错了<span style="color:red; font-size:30px;"><%=cuo %></span>道题！！！</h1>
</p>
</div>
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
layui.use('ul', function(){
	  var ul = ul.form; //只有执行了这一步，部分表单元素才会自动修饰成功
	  
	  //……
	  
	  //但是，如果你的HTML是动态生成的，自动渲染就会失效
	  //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
	  form.render();
	});      
</script>
<script></script>
</body>
</html>