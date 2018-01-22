<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil"%>
<%@ page import="team.WHATEVER.Math.model.Operation" %>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史记录（日）</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
<jsp:include  page="../calculate/top.jsp"></jsp:include>
<div id="content">
 <%
    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">历史记录（日）</legend>
    </fieldset>

 <a href="StudentErrorpage2.jsp" class="layui-btn" style="background:red;float:right;">返回</a> 
<form  action="studentHistory2.jsp"> 
    <div class="layui-btn-container" style="text-align:center">
    <%
    
    String parameter=request.getParameter("time");//参数
    if(parameter==null)
	{
		parameter=(String)session.getAttribute("ti");
	}
    int time[]=new int[3];
    time[0]=Integer.parseInt(parameter.substring(0, 4));
    time[1]=Integer.parseInt(parameter.substring(5, 7));
    boolean is1=false;
    boolean is2=false;
  
    UserDaoImpl userDao=new UserDaoImpl(); 
    
    User loginUser=(User)session.getAttribute("loginUser");//查询到登录用户信息
    List<Operation> operations=userDao.find_Operations(loginUser.getU_Id()); 
    int i=0;
    for( Operation operation:operations)
    { 
    	
    	String Date=operation.getQ_Date();
    	String Month=Date.substring(5, 7);//获取时间中的月
    	String Year=Date.substring(0, 4);//获取时间中的年
    	String Day=Date.substring(8, 10);//获取时间中的日
        
    	int day2=Integer.parseInt(Day);
    	int year2=Integer.parseInt(Year);
    	int month2=Integer.parseInt(Month);//将月转换乘int型
    	if(is1==false)//遍历到第一个operation,将第一个题目的月份赋值给time
    	{
    		time[2]=day2;
    		is1=true;
    	}
    	
    	if((day2!=time[2])&&(month2==time[1])&&(year2==time[0]))//遍历到这个月的下一天
    	{
    		time[2]=day2;
    		is2=false;
    	}
    	if((day2==time[2])&&(month2==time[1])&&(year2==time[0])&&(is2==false))//遍历到查询的这一天
    	{
    		i++;
    		//输出年月
    		%>
    		<input type="submit" name="time" value="<%=Year%>年<%=Month%>月<%=Day%>日 "class="layui-btn" style="width:210px;height:100px;font-size:25px;"> 
            &nbsp;&nbsp;&nbsp;
    		<% 
    		 if(i%5==0)
    		 {
    			 
    			 %>
    			 <br>
    			 <%
    		 }
    		is2=true;
    	}
    	
    }
    
%>
  
</div>
</div>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;
<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>
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