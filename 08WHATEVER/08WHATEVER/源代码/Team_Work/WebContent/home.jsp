<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加减乘除首页</title>
<link href="./css/style.css" rel="stylesheet" type="text/css"/>
<link href="./font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="./layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
<div class="head_nav">
<a class="head_logo" href="">
<img src="./images/log.jpg"/>
</a>
</div>
<%
       
String TYPE =(String)session.getAttribute("TYPE");
if(TYPE==null)
{
	TYPE="";
}

%>
<%
  String loginError =(String)session.getAttribute("loginError");
   if(loginError==null)
   {
      loginError="";
   }
    session.putValue("loginError", "");
   %>
<div id="content">
<br><br>
<div id="left">
<div class="layui-carousel" id="test1">
	  <div carousel-item>
	    <div><img src="./images/首页2.png" width="900" height="600"/></div>
	    <div><img src="./images/加.gif" width="900" height="600"/></div>
	  </div>
</div>
</div>
<div id="right">
<div class="layui-tab">
  <ul class="layui-tab-title">
    <li class="layui-this" style="min-width: 229px;"><h1 style="font-size:25px">登录</h1></li>
    <li style="min-width: 229px;"><h1 style="font-size:25px">注册</h1></li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
    <form action="login.jsp" onsubmit="return validate()==1"  method="post">
    <table class="content">
	<tr>
		<td class="left">昵称:</td>&nbsp;
		<td><input type="text" value="" name="昵称" class="num"/>
		 <%= ValidateUtil.showError(request,"昵称") %>
        <%  
          if(loginError.contentEquals("用户不存在")) 
          {
          %>
        	 <span style="color:#ff0000; font-family:楷体"><%=loginError %></span>
          <%  }
       %>
       </td>
	</tr>
   <tr>
		<td class="left">密码:</td>&nbsp;
		<td><input type="password" value="" name="密码" class="pas"/>
		<%=ValidateUtil.showError(request,"密码") %>
       <%  
          if(loginError.contentEquals("密码错误")) 
          {
        	  %>
         	 <span style="color:#ff0000; font-family:楷体"><%=loginError %></span>
         <%  }
      %>
      </td>
	</tr>
	<tr>
		<td class="left">验证码:</td>&nbsp;
		<td><input type="text" id="ctl00_txtcode" class="yan"/>&nbsp;
	      <%
				 String[] color={"red","PaleVioletRed","DarkGreen ","Peru","Crimson"};
				 int i=(int)(Math.random()*5);
				 %>
			  <input  type="submit" id="code" onclick="createCode()" readonly="true"  style="background:Khaki ;font-family:Algerian;font-size:30px;width:100px;color:<%=color[i] %>"  />
	</td>
	</tr>	
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" value="登录" onclick="validate()"  readonly="true" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal"style="width:300px"/></td>
	</tr>
</table>
</form>
    </div>
    <div class="layui-tab-item">
    <%
    String error=(String)session.getAttribute("Error");
    if(error==null)
    {
    	error="";
    }
    session.setAttribute("Error", ""); 
    %>
    <span style="color:blue; font-family:楷体 ;font-size:30px"><%=error%></span><br>
     <form action="add.jsp" method="post">
	<table class="content">
		<tr>
		  <td class="left">姓名:&nbsp;</td>
		  <td><input type="text" value="" name="username"  class="tex01"/></td>
		</tr>
		<tr>
		  <td class="left"><span class="red" style="font-size:30px;">*</span>昵称:&nbsp;</td>
		  <td><input type="text" value="" class="num" name="昵称"/>
		  
		  <span style="color:#ff0000; font-family:楷体;"><%=ValidateUtil.showError(request,"昵称")%></span>
		  </td>
		  
		</tr>
		<tr>
			<td class="left"><span class="red" style="font-size:30px;">*</span>用户类型:&nbsp;</td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="teacher"><input type="radio" name="类型" id="teacher" value="老师" style="width:20px;height:20px">老师</label>&nbsp;&nbsp;
			<label for="student"><input type="radio" name="类型" id="student" value="学生" style="width:20px;height:20px">学生</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#ff0000; font-family:楷体;"><%= ValidateUtil.showError(request,"类型")
					 %></span>
			</td>
		</tr>
		<tr>
		   <td class="left"><span class="red" style="font-size:30px;">*</span>设置密码:&nbsp;</td>&nbsp;&nbsp;
		   <td><input type="password" value="" name="密码" class="pas"/>
		   <span style="color:#ff0000; font-family:楷体"><%= ValidateUtil.showError(request,"密码")%></span>
		   </td></tr>
		   
	<tr>
		<td>&nbsp;</td>
		<div class="layui-anim layui-anim-scaleSpring">
		<td ><input class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal"style="width:300px" type="submit" value="提交"/></td>
		</div>
	</tr>
	</table>
	</form>
    </div>
  </div>
</div>
</div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->
<div id="footer">
&copy;&nbsp;WHATEVER软件工程团队&nbsp;|&nbsp;<a href="https://jq.qq.com/?_wv=1027&k=5bGfYhH" style="font-size:16px; color:red">联系我们</a>
</div>
<script src="./layui/layui.js"></script>
<script>
layui.use('carousel', function(){
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#test1'
    ,width: '900px' //设置容器宽度
    ,height:'600px'
    ,arrow: 'hovor' //始终显示箭头
    ,anim: 'default' //切换动画方式
  });
});
var carousel = layui.carousel;

//监听轮播切换事件
carousel.on('change(test1)', function(obj){ //test1来源于对应HTML容器的 lay-filter="test1" 属性值
console.log(obj.index); //当前条目的索引
console.log(obj.prevIndex); //上一个条目的索引
console.log(obj.item); //当前条目的元素对象
});
var ins = carousel.render(options);

//重置轮播
ins.reload(options);
</script>
<div id="LAY_democodejs">
<script>
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  //触发事件
  var active = {
    tabAdd: function(){
      //新增一个Tab项
      element.tabAdd('demo', {
        title: '新选项'+ (Math.random()*1000|0) //用于演示
        ,content: '内容'+ (Math.random()*1000|0)
        ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
      })
    }
    ,tabDelete: function(othis){
      //删除指定Tab项
      element.tabDelete('demo', '44'); //删除：“商品管理”
      
      
      othis.addClass('layui-btn-disabled');
    }
    ,tabChange: function(){
      //切换到指定Tab项
      element.tabChange('demo', '22'); //切换到：用户管理
    }
  };
  
  $('.site-demo-active').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
  
  //Hash地址的定位
  var layid = location.hash.replace(/^#test=/, '');
  element.tabChange('test', layid);
  
  element.on('tab(test)', function(elem){
    location.hash = 'test='+ $(this).attr('lay-id');
  });
  
});
</script>
</div>
<script> 
//产生验证码 
window.onload = function() {
 createCode()
}
var code; //在全局定义验证码 
function createCode() {
 code = "";
 var codeLength = 4; //验证码的长度 
 var checkCode = document.getElementById("code");
 var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
  'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //随机数 
 for(var i = 0; i < codeLength; i++) { //循环操作 
 var index = Math.floor(Math.random() * 36); //取得随机数的索引（0~35） 
  code += random[index]; //根据索引取得随机数加到code上 
 }
 checkCode.value = code; //把code值赋给验证码 
}
//校验验证码  并且看是否能进登陆的界面进行挑选

function validate() {
var inputCode = document.getElementById("ctl00_txtcode").value.toUpperCase(); //获取输入框内验证码并转化为大写  
if(inputCode.length <= 0) { //若输入的验证码长度为0 
 alert("请输入验证码！"); //则弹出请输入验证码 
 return 0;
} 
else if(inputCode != code) { //若输入的验证码与产生的验证码不一致时 
 alert("验证码输入错误!"); //则弹出验证码输入错误 
 createCode(); //刷新验证码 
 document.getElementById("ctl00_txtcode").value = "";//清空文本框 
 return 0;
} else {return 1; //输入正确时 
 //alert("正在登陆"); //弹出 
 }
}
</script>
</body>
</html>