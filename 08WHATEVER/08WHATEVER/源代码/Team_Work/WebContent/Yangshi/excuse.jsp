<%@page import="team.WHATEVER.Math.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>练习做题</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
 <jsp:include  page="../calculate/top.jsp"></jsp:include>
<div id="content" style="text-align:center">
<div class="layui-fluid">
<%
    User login_user=(User)session.getAttribute("loginUser"); 
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
%>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<form class="layui-form" action="connect3.jsp" >
<div class="layui-form-item">
    <fieldset class="layui-elem-field layui-field-title">
    <legend style="color:red;font-size:25px;">请选择年级</legend>
    </fieldset>
    <div class="layui-input-block" style="text-align:center;">
      <input type="radio" name="grade" value="一年级上册" title="一年级上册" checked>
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
	   <br>
      <fieldset class="layui-elem-field layui-field-title">
      <legend style="color:red;font-size:25px;">选择答题时间</legend>
      </fieldset>
         <div class="layui-input-block" style="text-align:center">
	      <input type="radio" name="time" value="5" title="5分钟" checked>
	      <input type="radio" name="time" value="10" title="10分钟">
	      <input type="radio" name="time" value="20" title="20分钟">
	      <input type="radio" name="time" value="30" title="30分钟">
	      <input type="radio" name="time" value="60" title="1小时">
	   </div>
	   <br><br><br>
        <div class="layui-input-block" style="text-align:center">
	      <input value="开始答题"  class="layui-btn" type="submit" style="width:200px;height:50px;"/>
	      <input type="reset" value="重置" class="layui-btn layui-btn-primary"style="width:200px;height:50px;"/>
        </div>
  </form>
</div>
</div>
<br>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;
<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>
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
//Demo
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