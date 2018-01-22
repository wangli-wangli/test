<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="team.WHATEVER.Math.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
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
	<a href="Show.jsp">首页</a>
    <a href="add_user.jsp">用户添加</a>
    <a href="List.jsp">用户列表</a>
	<li class="layui-nav-item layui-this" style="underline:none; background:white">
	<a href="javascript:;" style="color:black">个人中心</a>
	<dl class="layui-nav-child" style="none" >
	<dd><a href="myselfUser.jsp">修改资料</a>
	<dd><a href="Loginout.jsp">退出登录</a>
	</dl>
	</li>
</ul>
</div>
</div>
<div id="content">
<div class="layui-fluid">
<%
    User login_user=(User)session.getAttribute("loginUser");
    String login_nickname=login_user.getU_Nickname();//获取用户昵称
String message=(String)session.getAttribute("info");
if(message==null)
{

message="";
} 
session.putValue("info", "");
%>
<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">添加用户</legend>
    </fieldset>
     &nbsp;&nbsp;&nbsp;<span style="color:blue; font-family:楷体 ;font-size:30px"><%=message %></span><br><br>
   <form class="layui-form" action="doadd_user.jsp">
  <div class="layui-form-item">
    <label class="layui-form-label"></label>
    <input type="text" name="昵称" required  lay-verify="required" placeholder="请输入用户昵称" autocomplete="off" class="layui-input" style="font-size:30px;width:500px;height:100px;">
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label"></label>
    <input type="text" name="姓名" placeholder="请输入用户姓名" autocomplete="off" class="layui-input" style="font-size:30px;width:500px;height:100px;">
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label"></label>
    <input type="text" name="密码" required  lay-verify="required" placeholder="请输入用户密码" autocomplete="off" class="layui-input" style="font-size:30px;width:500px;height:100px;">
  </div>
   </div>
    <div class="layui-form-item">
    <label class="layui-form-label"></label>
    <td class="left"><span style="font-size:30px;color:red;">*</span><span class="red" style="font-size:30px">用户类型:</span>&nbsp;</td>
  <label for="teacher"><input type="radio" name="类型" id="teacher" value="老师" style="width:40px;height:40px"><span style="color:red;font-size:30px;">老师</span></label>&nbsp;&nbsp;
  <label for="student"><input type="radio" name="类型" id="student" value="学生" style="width:40px;height:40px"><span style="color:red;font-size:30px;">学生</span></label>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo"style="font-size:20px;width:300px;height:80px;margin-left:80px;">添加</button>
    </div>
  </div>
</form>
  
</div>
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>

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