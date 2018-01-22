<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil"%>
<%@ page import="team.WHATEVER.Math.model.Operation" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错题本</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
 <jsp:include  page="../calculate/top.jsp"></jsp:include>
<div id="content">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">错题本（月）</legend>
    </fieldset>
    <%
    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<form  action="./StudentErrorpage2.jsp"> 
    <div class="layui-btn-container" style="text-align:center">
    <%
    //因为遍历数据库是从上到下进行遍历的，所以遍历到的日期是从小到大的
    int beginIndex=5;//先要获取时间中的月，从时间字符串中的第5个字符开始
    int endIndex=7;//月的最后一个字符是第6位
    int between=1;
    int[] time={0,0};//记录循环遍历当前的月份，输出按钮上的月份
    boolean is1=false;
    boolean is2=false;
    UserDaoImpl userDao=new UserDaoImpl(); 
    /*String log_nickname=(String)session.getAttribute("用户昵称");*/
    User loginUser=(User)session.getAttribute("loginUser");//查询到登录用户信息
    List<Operation> operations=userDao.find_Operations(loginUser.getU_Id()); 
    
    for( Operation operation:operations)
    {
    	String Date=operation.getQ_Date();
    	String Month=Date.substring(beginIndex, endIndex);//获取时间中的月
    	String Year=Date.substring(0, 4);//获取时间中的年
 
    	int year2=Integer.parseInt(Year);
    	int month2=Integer.parseInt(Month);//将月转换乘int型
    	if(is1==false)//遍历到第一个operation,将第一个题目的月份赋值给time
    	{
    		time[0]=year2;
    		time[1]=month2;
    		is1=true;
    	}
    	if(year2>time[1])
    	{
    		time[0]=year2;
    	}
    	if(month2!=time[1])
    	{
    		time[1]=month2;
    		is2=false;
    	}
    	if((month2==time[1])&&(is2==false))//如果遍历到的月份处于按钮上的月份
    	{
    		//输出年月
    		%>
               
                <input type="submit"  name="time" value="<%=Year%>年<%=Month%>月 " class="layui-btn"style=" font-size:25px; width:200px;height:100px;"/>&nbsp;&nbsp;
    		<% 
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