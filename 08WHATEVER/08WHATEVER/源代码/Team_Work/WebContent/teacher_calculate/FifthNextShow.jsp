<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page import="com.calculate.Calculate" %>
<%@ page import="com.calculate.CalculateImpl" %>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>五年级下册</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
<div class="head_nav" style="height:70px">
<a class="head_logo" href="#">
<img src="../images/log.jpg"/>
</a>
<div class="head_nav_R">
<ul class="layui-nav" style="background-color:white">
	<a href="../Yangshi/teacher.jsp">首页</a>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">小组</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="../Yangshi/create.jsp">创建小组</a>
	<dd><a href="../Yangshi/teacherFind.jsp">查看小组</a>
	<dd><a href="../Yangshi/GroupFind.jsp">删除小组</a>
	</dl>
	</li>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">个人中心</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="../Yangshi/myselfTeacher.jsp">修改资料</a>
	<dd><a href="../Yangshi/LoginOut.jsp">退出登录</a>
	</dl>
	</li>
</ul>
</div>
</div>
<div id="content" style="text-align:center;font-size:30px;">
<div class="layui-fluid">
<%

User login_user=(User)session.getAttribute("loginUser"); 
String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">五年级下册</legend>
    </fieldset>
<form class="layui-form" action="../Yangshi/sendHomework.jsp">
    <%
Random random=new Random();
int num=Integer.parseInt(request.getParameter("num"));
session.setAttribute("num1", num);
int i;
Calculate calculateImpl=new CalculateImpl();
String sum[]=new String[num];
String shizi[]=new String [num];
%>
提示：运算结果保留两位小数<br><br>
<% 
for(i=0;i<num;)
{
	int multiply1=random.nextInt(10000);
	int multiply2=random.nextInt(10000);
	int multiply3=random.nextInt(100);
	int add1=random.nextInt(10000);
	int substraction1=random.nextInt(10000);
	double Multiply1,Multiply2,Add1,Substraction1;
	Multiply1=(double)multiply1/100;
	Multiply2=(double)multiply2/100;
	Add1=(double)add1/100;
	Substraction1=(double)substraction1/100;
	if(random.nextInt(4)==0)
	{
		sum[i]=calculateImpl.multiplyDecimal(multiply1, multiply2);
		session.setAttribute("correct"+i,sum[i]);
		
		shizi[i]=((double)multiply1/100)+"×"+((double)multiply2/100)+"=";
		session.setAttribute("Shizi"+i,shizi[i]);
%>
   
   
            	 <td><%=shizi[i]%>&nbsp;&nbsp;&nbsp;
            	 <font color=blue ><%=sum[i] %></font>
            	  <br><br>
            	 </td>
            	 </tr>
<%	
        i++;
	}
	else if(random.nextInt(4)==1)
	{
		//连乘
        sum[i]=String.valueOf(Double.parseDouble(calculateImpl.multiplyDecimal(multiply1, multiply2))*multiply3);
		session.setAttribute("correct"+i,sum[i]);
		shizi[i]=((double)multiply1/100)+"×"+((double)multiply2/100)+"×"+multiply3+"=";
		session.setAttribute("Shizi"+i,shizi[i]);
%>
                 <tr>
            	 <td><%=shizi[i]%>&nbsp;&nbsp;&nbsp;
            	 <font color=blue ><%=sum[i] %></font>
            	  <br><br>
            	 </td>
            	 </tr>
<%	
        i++;
	    
	}
	else if(random.nextInt(4)==2)
	{
		//乘加
		shizi[i]=Multiply1+"×"+Multiply2+"+"+multiply3+"=";
		session.setAttribute("Shizi"+i,shizi[i]);
		sum[i]=String.valueOf(Double.parseDouble(calculateImpl.multiplyDecimal(multiply1, multiply2))+multiply3);
		session.setAttribute("correct"+i,sum[i]);
		%>
            	 <td><%=shizi[i]%>&nbsp;&nbsp;&nbsp;
            	 <font color=blue ><%=sum[i] %></font>
            	  <br><br>
		            	 </td>
		            	 </tr>
		<%	
		        i++;
	}
	else
	{
		//乘减
		shizi[i]=Multiply1+"×"+Multiply2+"-"+multiply3+"=";
		session.setAttribute("Shizi"+i,shizi[i]);
		sum[i]=String.valueOf(Double.parseDouble(calculateImpl.multiplyDecimal(multiply1, multiply2))-multiply3);
		session.setAttribute("correct"+i,sum[i]);
		%>
		  
            	 <td><%=shizi[i]%>&nbsp;&nbsp;&nbsp;
            	 <font color=blue ><%=sum[i] %></font>
            	  <br><br>
		            	 </td>
		            	 </tr>
		<%	
		        i++;
	}
}
%>
<input class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal"style="width:400px;height:80px;font-size:40px;"type="submit" value="上传作业" id="anniu"/>
</form>
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
layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    layer.msg(JSON.stringify(data.field));
	    return false;
	  });
	});
</script>
</body>
</html>