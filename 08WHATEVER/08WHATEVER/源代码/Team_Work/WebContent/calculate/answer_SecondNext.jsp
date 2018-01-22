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
<title>二年级下册</title>
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
	   String correct_yushu=((String)session.getAttribute("Yushu"+i)).trim();//正确余数
	   String yushu=request.getParameter("jieYu"+i).trim();//输入的余数
	   if(yushu.equals(""))
		   yushu="0";
	   if(CorrectResult.equals(""))
		   CorrectResult="0";
	   
	   
	  
	   Operation operation=new Operation();
	   %>
	   
	   <%=Question %><%=inputResult %>...<%=yushu %>
	   <% 
	   if((CorrectResult.equals(inputResult))&&(correct_yushu.equals(yushu)))
	   {
		   operation.setQ_Status(0);
		   dui++;
	   %>
	   <font color="green">√</font><br><br> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <%
        }else{
	   %>
	   <font color="red">×</font>
	   &nbsp;&nbsp;&nbsp;
	   <%=CorrectResult %>...<%=correct_yushu %><br><br>
	   
	   <%
	   
	   operation.setQ_Status(-1);
	   cuo++;
	   
	   String correctanswer=CorrectResult+"..."+correct_yushu;//要向数据库里输入的正确答案
	   ErrorQuestion errorQuestion=new  ErrorQuestion();
	   errorQuestion.setQ_CorrectResult(correctanswer);
	   errorQuestion.setQ_Question(Question);
	   errorQuestion.setQ_Type(0);
	   errorQuestion.setU_Id(login_user.getU_Id());
	   userDao.add_ErrorQuestion(errorQuestion);//将错题增加到错题表里
	   }
	   String correctanswer=CorrectResult+"..."+correct_yushu;//要向数据库里输入的正确答案
	   String inputanswer=inputResult+"..."+yushu;//要向数据库里输入的输入答案
	   operation.setU_Id(login_user.getU_Id());
	   operation.setQ_Question(Question);
	   operation.setQ_CorrectResult(correctanswer);
	   operation.setQ_Type(0);
	   operation.setQ_InputResult(inputanswer);
	   userDao.add_operation(operation);
	   
   }

%>
恭喜你，答对了<span style="color:red; font-size:40px;"><%=dui %></span>道题，答错了<span style="color:red; font-size:40px;"><%=cuo %></span>道题！！！
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
layui.use('ul', function(){
	  var ul = ul.form; //只有执行了这一步，部分表单元素才会自动修饰成功
	  
	  //……
	  
	  //但是，如果你的HTML是动态生成的，自动渲染就会失效
	  //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
	  form.render();
	});      
</script>
</body>
</html>