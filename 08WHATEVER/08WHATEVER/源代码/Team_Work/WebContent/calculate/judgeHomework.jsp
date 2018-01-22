<%@page import="java.util.List"%>
<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.model.Operation" %>
<%@ page import="team.WHATEVER.Math.model.ErrorQuestion" %>
<%@ page import="team.WHATEVER.Math.model.Homework" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>判题界面</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body onLoad="timedCount()">
 <jsp:include  page="./top.jsp"></jsp:include>
<div id="content">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">来看看你的答题情况</legend>
    </fieldset>
<%

    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>
<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<div style="position: relative; width: 100%; display: table; * position: absolute; * top: 50%; * left: 0;">
   <p style="font-size:30px;position: relative; top: 50%; left: 0; text-align: center; width: 100%; * top: 0;">
   <div id="middle">
<%

int h_id=Integer.parseInt(String.valueOf(session.getAttribute("h_id")));
UserDaoImpl userDao=new UserDaoImpl();
List<Homework> homeworks=userDao.find_homework(h_id);

Homework h=homeworks.get(0);//获得List中的一个元素
String Question_first=h.getQ_Question();//得到作业中的第一道题目
boolean is = Question_first.contains("/");//记录是否是分数题，true:是分数题，false:不是分数题
int i=0;
int j=0,k=0;
int dui=0,cuo=0;
if(is==false)//如果不是分数题
{
	for(Homework homework:homeworks)
	   {
		  j++;
		   String Question=homework.getQ_Question();//计算式
		   String inputResult=request.getParameter("inputResult"+i);
		   String CorrectResult=homework.getQ_RorrectResult();
		   Operation operation=new Operation();
		   %>
		   
		   <span style="font-size:25px"><%=Question %><%=inputResult %></span>
		   <% 
		   if((""+CorrectResult).equals(inputResult))
		   {
			   operation.setQ_Status(0);
			   dui++;
		   %>
		   <span style="font-size:25px;color:green">√</span><br><br>
		   
		   <%
		   }else{
		   %>
		   <span style="font-size:25px;color:red">×</span>
		   &nbsp;&nbsp;&nbsp;
		   <span style="font-size:25px"><%=CorrectResult %></span><br><br>
		   <%
		   operation.setQ_Status(-1);
		   cuo++;
		   
		   ErrorQuestion errorQuestion=new  ErrorQuestion();
		   errorQuestion.setQ_CorrectResult(CorrectResult);
		   errorQuestion.setQ_Question(Question);
		   errorQuestion.setQ_Type(1);
		   errorQuestion.setU_Id(login_user.getU_Id());
		   userDao.add_ErrorQuestion(errorQuestion);//将错题增加到错题表里
		   }
		   operation.setU_Id(login_user.getU_Id());
		   operation.setQ_Question(Question);
		   operation.setQ_CorrectResult(CorrectResult);
		   operation.setQ_Type(1);
		   operation.setQ_InputResult(inputResult);
		   operation.setH_id(h_id);
		   userDao.add_operation(operation);
		   i++;
	   }
}
else
{
	for(Homework homework:homeworks)//如果作业题是分数题
    { 
		char fuhao='0';
		String Question=homework.getQ_Question();
		Operation operation=new Operation();
		int first=Question.indexOf("/");//第一个/出现的位置
		int second=Question.indexOf("+");//第一个符号出现的位置
		if(second!=0)
		{
	        fuhao='+';
		}
		if(second==0)
		{
			second=Question.indexOf("-");
			if(second!=0)
    		{
    	        fuhao='-';
    		}
		}
		if(second==0)
		{
			second=Question.indexOf("×");
			if(second!=0)
    		{
    	        fuhao='×';
    		}
		}
		if(second==0)
		{
			second=Question.indexOf("÷");
			if(second!=0)
    		{
    	        fuhao='÷';
    		}
		}
		
		int three=Question.indexOf("/",first+1);//第二个"/"出现的位置 
		int four=Question.indexOf("=");//“=”出现的位置
		String str1_fenzi=Question.substring(0, first);//第一个分数的分子
    	String str1_fenmu = Question.substring(first + 1, second);//第一个分数的分母
        String str2_fenzi=Question.substring(second+1,three);//第二个分数的分子
    	String str2_fenmu = Question.substring(three+1, four );//第二个分数的分母
    	String inputFenzi=request.getParameter("Molecule"+i).trim();
  	    String inputFenmu=request.getParameter("jie"+i).trim();
  	     String inputResult;
  	    if(inputFenzi.equals("")&&inputFenmu.equals(""))//若输入答案为空
  	    {
  	    	inputResult=" ";
  	    }
  	    else
  	    {
  	      inputResult=inputFenzi+"/"+inputFenmu;
  	    }
    	%>
    	<div class="fraction" style="font-size:30px;"><div> <%=str1_fenzi %></div><div style="border-top:2px solid black;font-size:30px;"><%=str1_fenmu %></div></div><div class="nomal">
	    	 <%=fuhao%></div><div class="fraction" style="font-size:30px;"><div> <%=str2_fenzi %></div><div style="border-top:2px solid black;font-size:30px;"><%=str2_fenmu %></div></div>
             <div class="nomal"> =</div>

    	 <%if(inputFenzi.equals("")&&inputFenmu.equals(""))
    	  {
    	  }
    	  else
    	  {
    		  %>
    		  <div class="fraction"style="font-size:30px;"><div> 
         <%=inputFenzi %>
           <%="</div><div style='border-top:1px solid black;'>"%>
          <%=inputFenmu %>
            <%="</div></div>"%>
    	<% 
    	  }
    	if(inputResult.equals(homework.getQ_RorrectResult()))//回答正确
    	{
    		  operation.setQ_Status(0);
   		      dui++;
   	   %>
   	   <div class='nomal'>
   	   <font color="green">√</font></div><br><br><br><br><br><br>
   	   <%
    	
      }else{
    	  String CorrectResult=homework.getQ_RorrectResult();//得到题目的正确答案
    	  int five=CorrectResult.indexOf("/");//第一个/出现的位置
    	  String CorrectFenzi=CorrectResult.substring(0, five);
    	  String CorrectFenmu=CorrectResult.substring(five+1,CorrectResult.length());
 	   %>
 	   <div class='nomal'>
 	   <font color="red">×</font>
 	   &nbsp;&nbsp;&nbsp;
 	   </div>
 	   <div class="fraction" style="font-size:30px;"><div>
 	   <%=CorrectFenzi %>
 	   </div><div style="border-top:2px solid black;">
 	   <%=CorrectFenmu %>
 	   </div></div>
 	   <br><br><br><br><br><br>
 	   <%
 	   operation.setQ_Status(-1);
 	   cuo++;
 	   
 	  
 	   ErrorQuestion errorQuestion=new  ErrorQuestion();
 	   errorQuestion.setQ_CorrectResult(CorrectResult);
 	   errorQuestion.setQ_Question(Question);
 	   errorQuestion.setQ_Type(1);
 	   errorQuestion.setU_Id(login_user.getU_Id());
 	   userDao.add_ErrorQuestion(errorQuestion);//将错题增加到错题表里
 	   
 	  
 	   }
        operation.setH_id(h_id);
 	   operation.setU_Id(login_user.getU_Id());
 	   operation.setQ_Question(Question);
 	   operation.setQ_CorrectResult(homework.getQ_RorrectResult());
 	   operation.setQ_Type(0);
 	   operation.setQ_InputResult(inputResult);
 	   userDao.add_operation(operation);
 	   i++;
    }  
    

}

%>
<span style="font-size:28px;">恭喜你，答对了</span><span style="color:red;font-size:30px;" ><%=dui %></span><span style="font-size:28px;">道题，答错了</span><span style="color:red;font-size:30px;" ><%=cuo %></span><span style="font-size:28px;">道题！！！</span>
</div>
</p>
</div>
</div>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>
</div>
<script src="../layui/layui.js"></script>
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
</body>
</html>