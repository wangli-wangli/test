<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加入小组</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body onload="opener.location.reload()">
 <jsp:include  page="../calculate/top.jsp"></jsp:include>
<div id="content">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">加入小组</legend>
    </fieldset>
    <%
    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>
<%
   String message=(String)session.getAttribute("add");
    if(message==null)
    {
          message="";
    } 
    session.putValue("add", "");
%>
<div style="text-align:right;font-size:20px;">
          你好[<%=login_nickname %>]&nbsp;
    </div>
<form class="layui-form" action="doAddGroup.jsp"> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:blue; font-family:楷体 ;font-size:30px"><%=message%></span><br><br>
   <div class="layui-form-item">
    <label class="layui-form-label"></label>
    <input type="text" name="老师昵称" required  lay-verify="required" placeholder="请输入老师昵称" autocomplete="off" class="layui-input" style="font-size:30px;width:500px;height:100px;">
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label"></label>
    <input type="text" name="小组名称" required  lay-verify="required" placeholder="请输入小组名" autocomplete="off" class="layui-input" style="font-size:30px;width:500px;height:100px;">
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
     <input type="submit" value="加入小组"  class="layui-btn" lay-submit lay-filter="formDemo" style="font-size:20px;width:300px;height:80px;margin-left:80px;"/>
    </div>
  </div>
  </div>
</form>
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
layui.use('form', function(){
	  var form = layui.form;
	  //监听提交
	  form.on('submit(0)', function(data){
	    layer.msg(JSON.stringify(data.field),
	    		{
	    	      title:"最终的提交信息"
	    		})
	    return false;
	  });
	});
</script>
<script></script>
</body>
</html>