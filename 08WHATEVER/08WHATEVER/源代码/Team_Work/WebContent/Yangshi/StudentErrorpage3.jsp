<%@page import="team.WHATEVER.Math.model.ErrorQuestion"%>
<%@page import="team.WHATEVER.Math.model.User"%>
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
     <%
	String parameter=request.getParameter("time");//参数
	if(parameter==null)
	{
		parameter=(String)session.getAttribute("ti");
	}
    session.setAttribute("ti",parameter);
	int time[]=new int[3];
	time[0]=Integer.parseInt(parameter.substring(0, 4));
	time[1]=Integer.parseInt(parameter.substring(5, 7));
	time[2]=Integer.parseInt(parameter.substring(8, 10));
	boolean is1=false;
	
	UserDaoImpl userDao=new UserDaoImpl(); 
	 User loginUser=(User)session.getAttribute("loginUser");//查询到登录用户信息
	 String login_nickname=loginUser.getU_Nickname();
	List<ErrorQuestion> errorQuestions=userDao.find_ErrorQuestions(loginUser.getU_Id()); //查询到登录者做过的全部题目
%>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">错题本</legend>
    </fieldset>
     <a href="StudentErrorpage2.jsp" class="layui-btn" style="background:red;float:right;">返回</a> 
   <!-- <table class="layui-hide" id="test"></table> -->
  <table class="layui-table">
    <thead>
   <tr>
			<th style="font-size:25px;text-align:center;">编号</th>
			<th style="font-size:25px;text-align:center;">题目</th>
			<th style="font-size:25px;text-align:center;">正确答案</th>
			<th style="font-size:25px;text-align:center;">答题日期</th>
			<th style="font-size:25px;text-align:center;">题目类型</th>
			<th colspan="2"style="font-size:25px;text-align:center;">用户操作</th>
		</tr>
		</thead>
		 <tbody>
   <% 	
    int id=0;
	for( ErrorQuestion errorQuestion:errorQuestions)
    {
    	String Date=errorQuestion.getQ_Date();
    	String Month=Date.substring(5, 7);//获取时间中的月
    	String Year=Date.substring(0, 4);//获取时间中的年
    	String Day=Date.substring(8, 10);//获取时间中的日
    	int day2=Integer.parseInt(Day);
    	int year2=Integer.parseInt(Year);
    	int month2=Integer.parseInt(Month);//将月转换乘int型
    	if((day2==time[2])&&(month2==time[1])&&(year2==time[0]))//遍历到查询的这一天
    	{
    
    		id++;
    		//输出年月
    			%>
    		  <tr>
			<td style="font-size:25px;text-align:center;"> <%=id%></td>
			<td style="font-size:25px;text-align:center;"> <%=errorQuestion.getQ_Question() %></td>
			<td style="font-size:25px;text-align:center;"> <%=errorQuestion.getQ_CorrectResult() %></td>
			<td style="font-size:25px;text-align:center;"> <%=errorQuestion.getQ_Date() %></td>
			
			<%
			if(errorQuestion.getQ_Type()==0)
			{
				%>
				<td style="font-size:25px;text-align:center;"> 练习</td>
				<% 
			}
			else
			{
				%>
				<td style="font-size:25px;text-align:center;"> 作业</td>
				<% 
				
			}
			%>
			<td style="font-size:25px;text-align:center;"> <a href="deleteQuestion.jsp?id=<%=errorQuestion.getQ_Id() %>"><span  style="color:red;">删除</span></a></td>
			</tr>
			<%
    	}
    	
    }

%>
</tbody>
</div>
</table>
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
var table = layui.table;
//调用分页
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage
  ,layer = layui.layer;
laypage.render({
  elem: 'demo20'
  ,count: id
  ,jump: function(obj){
    //模拟渲染
    document.getElementById('biuuu_city_list').innerHTML = function(){
      var arr = []
      ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
      layui.each(thisData, function(index, item){
        arr.push('<li>'+ item +'</li>');
      });
      return arr.join('');
    }();
  }
});

});
</script>
</body>
</html>