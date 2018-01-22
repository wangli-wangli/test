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
<title>六年级上册</title>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
<link href="../css/Grade.css" rel="stylesheet" type="text/css"/> 
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
</head>
 <body onLoad="timedCount()">
 <jsp:include  page="./top.jsp"></jsp:include>
<br>
<%

    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>
<div id="content">
<form action="./answer_SixthOn.jsp" method="post">
<%
String time=request.getParameter("time");
%>
<h1 style="color:red;text-align:left;" id="result">
</h1>

<div id="content">
<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div> 
<!--没有传参  -->
<div id="middle">
<%
 Random random=new Random();
if(request.getParameter("num")==null||"".equals(request.getParameter("num")))
{
%>
	小朋友，你未选择题哦！
<%
}
if(request.getParameter("time")==null||"".equals(request.getParameter("time")))
{
	%>
	小朋友，你未选择时间哦！<br>
<%
} 
int num=Integer.parseInt(request.getParameter("num"));

session.setAttribute("num1", num);
int i,j=1;
Calculate calculateImpl=new CalculateImpl();
int sumMolecule[]=new int[num];
//分子
int sumDenominator[]=new int [num];
//分母
String shizi[]=new String [num];

for(i=0;i<num;)
{
	int molecule1=random.nextInt(50)+1;
	int molecule2=random.nextInt(50)+1;
	int denominator1=random.nextInt(50)+1;
	int denominator2=random.nextInt(50)+1;
	String str1,str2;
	str1="<div class='fraction' style='font-size:30px;'><div>" +molecule1 + "</div><div style='border-top:2px solid black;' style='font-size:30px;'>" + denominator1 + "</div></div>";
	str2="<div class='fraction' style='font-size:30px;'><div>" +molecule2 + "</div><div style='border-top:2px solid black;' style='font-size:30px;'>" + denominator2 + "</div></div>";
	if(random.nextInt(4)==0)
	{
		//加
			shizi[i]=str1+"<div class='nomal'>"+ "+" + "</div>"+str2+"<div class='nomal'>"+ "="+"</div>" ;
			session.setAttribute("Shizi"+i, molecule1+"/"+denominator1+"+"+molecule2+"/"+ denominator2+"=");
			sumMolecule[i]=calculateImpl.addMolecule(molecule1, denominator1, molecule2, denominator2);
			sumDenominator[i]=calculateImpl.addDenominator(molecule1, denominator1, molecule2, denominator2);
			session.setAttribute("correctFenzi"+i, ""+sumMolecule[i]);
			session.setAttribute("correctFenmu"+i, ""+sumDenominator[i]);
			//将分子分母都传参
%>
                               
                          <%=shizi[i]%>
                           <%="<div class='fraction'><div>" %>
                           <input type="text" name="Molecule<%=i %>" value="" style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"
            	            />
                          <%="</div><div style='border-top:2px solid black;'>"%>
                           <input type="text" name="jie<%=i %>" value=" "  style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);
            	           "/>
                           <%="</div></div>"%>
                           <%  if((j%2)==0){
            	             %>
            	               <br><br><br><br><br>
            	             <% 
            	             }else{
            	             %>
            	            	 &nbsp;<div class="nomal" > &nbsp; </div>&nbsp;<div class="nomal">&nbsp;</div>
            	            <%} %>	 
            	           <!-- 输入答案 -->
<%	
        i++;
        j++;
	}
	else if(random.nextInt(4)==1)
	{
		//减
			shizi[i]=str1+"<div class='nomal' >"+ "-" + "</div>"+str2+"<div class='nomal'>"+ "=" + "</div>";
			session.setAttribute("Shizi"+i, molecule1+"/"+denominator1+"+"+molecule2+"/"+ denominator2+"=");
			sumMolecule[i]=calculateImpl.subtractionMolecule(molecule1, denominator1, molecule2, denominator2);
			sumDenominator[i]=calculateImpl.subtractionDenominator(molecule1, denominator1, molecule2, denominator2);
			session.setAttribute("correctFenzi"+i, ""+sumMolecule[i]);
			session.setAttribute("correctFenmu"+i, ""+sumDenominator[i]);
			//将分子分母都传参
%>
                             
                           <%=shizi[i]%>
                           <%="<div class='fraction'><div>" %>
                           <input type="text" name="Molecule<%=i %>" value="" style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"/>
                          <%="</div><div style='border-top:2px solid black;'>"%>
                           <input type="text" name="jie<%=i %>" value=" " style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"/>
                           <%="</div></div>"%>
                            <%  if((j%2)==0){
            	             %>
            	               <br><br><br><br><br>
            	             <% 
            	             }else{
            	             %>
            	            	 &nbsp;<div class="nomal" > &nbsp; </div>&nbsp;<div class="nomal">&nbsp;</div>
            	            <%} %>	  
            	           <!-- 输入答案 -->
<%	
        i++;
        j++;
	}
	else if(random.nextInt(4)==2)
	{
		//乘
			shizi[i]=str1+"<div class='nomal'>"+ "×" + "</div>"+str2+"<div class='nomal'>"+ "=" + "</div>";
			session.setAttribute("Shizi"+i, molecule1+"/"+denominator1+"×"+molecule2+"/"+ denominator2+"=");
			sumMolecule[i]=calculateImpl.multiplyMolecule(molecule1, denominator1, molecule2, denominator2);
			sumDenominator[i]=calculateImpl.multiplyDenominator(molecule1, denominator1, molecule2, denominator2);
			session.setAttribute("correctFenzi"+i, ""+sumMolecule[i]);
			session.setAttribute("correctFenmu"+i, ""+sumDenominator[i]);
			//将分子分母都传参
%>
            	           
            	           <%=shizi[i]%>
                           <%="<div class='fraction'><div>" %>
                           <input type="text" name="Molecule<%=i %>" value="" style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"/> 
                          <%="</div><div style='border-top:2px solid black;'>"%>
                           <input type="text" name="jie<%=i %>" value=" " style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"/>
                           <%="</div></div>"%>
                           <%  if((j%2)==0){
            	             %>
            	               <br><br><br><br><br>
            	             <% 
            	             }else{
            	             %>
            	            	 &nbsp;<div class="nomal" > &nbsp; </div>&nbsp;<div class="nomal">&nbsp;</div>
            	            <%} %>	 	 
            	           <!-- 输入答案 -->
            	
<%	
        i++;
        j++;
	}
	else
	{
			shizi[i]=str1+"<div class='nomal'>"+ "÷" + "</div>"+str2+"<div class='nomal'>"+ "=" + "</div>";
			session.setAttribute("Shizi"+i,molecule1+"/"+denominator1+"÷"+molecule2+"/"+ denominator2+"=" );
			sumMolecule[i]=calculateImpl.dividMolecule(molecule1, denominator1, molecule2, denominator2);
			sumDenominator[i]=calculateImpl.dividDenominator(molecule1, denominator1, molecule2, denominator2);
			session.setAttribute("correctFenzi"+i, ""+sumMolecule[i]);
			session.setAttribute("correctFenmu"+i, ""+sumDenominator[i]);
			//将分子分母都传参
%>
            	           <!-- 输入答案 -->
            	          
            	          <%=shizi[i]%>
                           <%="<div class='fraction'><div>" %>
                           <input type="text" name="Molecule<%=i %>" value="" style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"/>
                          <%="</div><div style='border-top:2px solid black;'>"%>
                           <input type="text" name="jie<%=i %>" value=" "  style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"/>
                           <%="</div></div>"%>
                          <%  if((j%2)==0){
            	             %>
            	               <br><br><br><br><br>
            	             <% 
            	             }else{
            	             %>
            	            	 &nbsp;<div class="nomal" > &nbsp; </div>&nbsp;<div class="nomal">&nbsp;</div>
            	            <%} %>	 
            	           <!-- 输入答案 -->
            	
    <%	
        i++;
        j++;
	}
}
%>
<br><br><br><br><br><input type="submit" value="我做完了" id="anniu" 
style="background-image:url(../images/submit_background.jpg) ;width:150px; height:50px;font-size:28px;"/>
</div>
</div>
</form>
</div>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>
</div > 
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