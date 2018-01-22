<%@page import="team.WHATEVER.Math.model.User"%>
<%@page import="com.calculate.CalculateImpl"%>
<%@page import="com.calculate.Calculate" %>
<%@page import="java.util.Random"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>五年级上册</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body onLoad="timedCount()">
 <jsp:include  page="./top.jsp"></jsp:include>
</div>
<div id="content">
<%

    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>
<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<form action="./answer.jsp" method="post"/>
<%
String time=request.getParameter("time");
%>
<h1 style="color:red;text-align:left;" id="result">
</h1>
 <div style="position: relative; width: 100%; display: table; * position: absolute; * top: 50%; * left: 0;">
   <p style="font-size:30px;position: absolute; top: 50%; left: 0; text-align: center; width: 100%; * top: 0;">

<!--没有传参  -->
<%
 Random random=new Random();
if(request.getParameter("num")==null||"".equals(request.getParameter("num")))
{
%>
	你还没有选择题数哦！
<%
}
if(request.getParameter("time")==null||"".equals(request.getParameter("time")))
{
	%>
	你还没有选择时间哦！<br>
<%
} 

int num=Integer.parseInt(request.getParameter("num"));//题目的总个数
session.setAttribute("num1", num);
int i;
Calculate calculateImpl=new CalculateImpl();
String sum[]=new String[num];
//结果为string
String shizi[]=new String [num];

for(i=0;i<num;)
{
  int multiply1=random.nextInt(100)+1;
	int multiply2=random.nextInt(10000);
	//小数
	int dividend=random.nextInt(100);
	//整数
	DecimalFormat df=new DecimalFormat("#.00");
  double Multiply2;
  Multiply2=(double)multiply2/100;
	if(random.nextInt(4)==0||random.nextInt(4)==1)
	{
		//小数与整数乘法
		if(Multiply2<1)
		{
			shizi[i]=multiply1+"×0"+df.format(Multiply2)+"=";
		}
		else{
			shizi[i]=multiply1+"×"+df.format(Multiply2)+"=";
		}
			session.setAttribute("Shizi"+i, shizi[i]);
			sum[i]=calculateImpl.multiplyDecimalInteger(multiply1, multiply2);
			session.setAttribute("correct"+i,""+sum[i]);
			//为正确答案
%>
			   <tr  align="center">
			            	 <td><%=shizi[i]%>&nbsp;
			            	             <input type="text" name="jie<%=i %>" value=" " style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);  border-left: medium none; border-right: medium none;
          	             border-top: medium none; border-bottom: 1px solid rgb(139,0,255)"/>
          	             <%
          	             if((i%2)==0){
          	             %>
          	            	 &nbsp;&nbsp;&nbsp;&nbsp; 
          	             <% 
          	             }else{
          	             %>
          	            	<br><br>
          	            <%} %>	 
			            	           <!-- 输入答案 -->
			            	 </td>
			            	 </tr>
<%	
       i++;
	}
	else if(random.nextInt(4)==2)
	{
	   //整数除以小数
	   if(calculateImpl.dividIntDecimal(dividend, multiply2)!=null)
	   {
		   shizi[i]=dividend+"÷"+Multiply2+"=";
		   session.setAttribute("Shizi"+i, shizi[i]);
			sum[i]=calculateImpl.dividIntDecimal(dividend, multiply2);
			session.setAttribute("correct"+i,""+sum[i]);
			//为正确答案
%>
			   <tr  align="center">
			            	 <td><%=shizi[i]%>&nbsp;
			            	             <input type="text" name="jie<%=i %>" value=" " style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);  border-left: medium none; border-right: medium none;
          	             border-top: medium none; border-bottom: 1px solid rgb(139,0,255)"/>
          	             <%
          	             if((i%2)==0){
          	             %>
          	            	 &nbsp;&nbsp;&nbsp;&nbsp; 
          	             <% 
          	             }else{
          	             %>
          	            	<br><br>
          	            <%} %>	 
			            	           <!-- 输入答案 -->
			            	 </td>
			            	 </tr>
<%
      i++;
		}   
	}
	else
	{
		if(dividend==0)
		{
			dividend++;
		}
		//小数除以整数
		if(calculateImpl.dividDecinmalInt(multiply2, dividend)!=null)
		{
			shizi[i]=Multiply2+"÷"+dividend+"=";
			session.setAttribute("Shizi"+i,shizi[i]);
			sum[i]=calculateImpl.dividDecinmalInt(multiply2, dividend);
			session.setAttribute("correct"+i,""+sum[i]);
%>
			
			<td><%=shizi[i] %>&nbsp;
			<input type="text" name="jie<%=i%>" value=" " style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);  border-left: medium none; border-right: medium none;
          	             border-top: medium none; border-bottom: 1px solid rgb(139,0,255)"/>
          	             <%
          	             if((i%2)==0){
          	             %>
          	            	 &nbsp;&nbsp;&nbsp;&nbsp; 
          	             <% 
          	             }else{
          	             %>
          	            	<br><br>
          	            <%} %>	 
			</td>
			
<%
		i++;
		}
	}
}
%>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="我做完了" id="anniu" 
style="background-image:url(../images/submit_background.jpg) ;width:150px; height:50px;font-size:28px;"/>
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
var t;
var c=0;
//全局变量
function timedCount()
{
    var txtobj=<%=time%>;
    var sum=parseInt(txtobj)*60;
    var sum1=sum-c;
    //秒
	var hour=parseInt(sum1/3600);
    var	minute=parseInt(sum1/60%60);
    if(minute==60||minute<1)
    	minute=0;
    var lastsecs=parseInt(sum1%60);
    lastsecs=lastsecs<10?'0'+lastsecs:lastsecs;
    minute=minute<10?'0'+minute:minute;
    hour=hour<10?'0'+hour:hour;
    c++;
    document.getElementById("result").innerHTML=hour+":"+minute+":"+lastsecs;
    t=setTimeout("timedCount()",1000);
 if(sum1==0)
 {
	clearTimeout(t);
	alert("小朋友，答题时间结束了哦！");
	document.getElementById("anniu").click();
 }
}
</script>
</body>
</html>