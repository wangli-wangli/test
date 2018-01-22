<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="team.WHATEVER.Math.model.User"%>
<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.model.Homework"%>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>布置作业</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
<div class="head_nav" style="height:70px">
<a class="head_logo" href="">
<img src="../images/log.jpg"/>
</a>
<div class="head_nav_R">
<ul class="layui-nav" style="background-color:white">
	<a href="teacher.jsp" >首页</a>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">小组</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="create.jsp">创建小组</a>
	<dd><a href="teacherFind.jsp">查看小组</a>
	<dd><a href="GroupFind.jsp">删除小组</a>
	</dl>
	</li>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">个人中心</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="myselfTeacher.jsp">修改资料</a>
	<dd><a href="Loginout.jsp">退出登录</a>
	</dl>
	</li>
</ul>
</div>
</div>
<div id="content" style="text-align:center">
<div class="layui-fluid">
<%
User login_user=(User)session.getAttribute("loginUser"); 
String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<br>
 <a href="teacherFind'.jsp" class="layui-btn" style="background:red;float:right;">返回</a> 
<form class="layui-form" action="connect6.jsp">
<div class="layui-form-item">
    <fieldset class="layui-elem-field layui-field-title">
    <legend style="color:red;font-size:25px;">请选择年级</legend>
    </fieldset>
    <div class="layui-input-block" style="text-align:center;">
      <input type="radio" name="grade" value="一年级上册" title="一年级上册"checked>
      <input type="radio" name="grade" value="一年级下册" title="一年级下册">
      <br>
      <input type="radio" name="grade" value="二年级上册" title="二年级上册">
      <input type="radio" name="grade" value="二年级下册" title="二年级下册">
      <br>
      <input type="radio" name="grade" value="三年级上册" title="三年级上册">
      <input type="radio" name="grade" value="三年级下册" title="三年级下册">
      <br>
      <input type="radio" name="grade" value="四年级上册" title="四年级上册">
      <input type="radio" name="grade" value="四年级下册" title="四年级下册">
      <br>
      <input type="radio" name="grade" value="五年级上册" title="五年级上册">
      <input type="radio" name="grade" value="五年级下册" title="五年级下册">
      <br>
      <input type="radio" name="grade" value="六年级上册" title="六年级上册">
      <input type="radio" name="grade" value="六年级下册" title="六年级下册">
      </div>
      <br>
	 <fieldset class="layui-elem-field layui-field-title">
	  <legend style="color:red;font-size:25px;">选择答题数量</legend>
	  </fieldset>
	  <div class="layui-input-block" style="text-align:center">
	      <input type="radio" name="count" value="10" title="10" checked>
	      <input type="radio" name="count" value="20" title="20">
	      <input type="radio" name="count" value="30" title="30">
	      <input type="radio" name="count" value="40" title="40">
	      <input type="radio" name="count" value="50" title="50">
	   </div>
	   <fieldset class="layui-elem-field layui-field-title">
    <legend style="color:red;font-size:25px;">作业编号</legend>
    </fieldset>
    <div class="layui-input-block" style="text-align:center;">
	   <%
	   int max;
        UserDaoImpl userDao=new UserDaoImpl();
       List<Integer> homework_ids=userDao.find_h_id();
       if(!homework_ids.contains("[]"))
       {
    	   max=0;
       }
       else
       {
        	max=homework_ids.get(0);//记录表中最大的作业编号
       }
        for(int id:homework_ids)
         {
	         if(id>max)
	        {
		       max=id;
	         }
         }
       int homework_id=max+1;
        session.setAttribute("h_id", ""+homework_id);
%>
                        生成作业编号：<%=homework_id %>
</div>
	   <br><br>
        <div class="layui-input-block" style="text-align:center">
	      <button class="layui-btn" type="submit" style="width:200px;height:50px;">发布作业</button>
	      <button type="reset" class="layui-btn layui-btn-primary"style="width:200px;height:50px;">重置</button>
        </div>
  </form>
</div>
</div>
<br>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>

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