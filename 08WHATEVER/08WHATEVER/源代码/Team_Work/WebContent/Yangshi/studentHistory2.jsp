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
<title>查看历史记录</title>
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
	
	List<Operation> operations=userDao.find_Operations(login_user.getU_Id()); //查询到登录者做过的全部题目
%>

<div style="text-align:right;font-size:20px;">
   你好[<%=login_nickname %>]&nbsp;
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">查看历史记录</legend>
    </fieldset>
     <a href="studentHistory1.jsp" class="layui-btn" style="background:red;float:right;">返回</a> 
   <!-- <table class="layui-hide" id="test"></table> -->
  <table class="layui-table">
    <thead>
   <tr>
			<th style="font-size:25px;text-align:center;">编号</th>
			<th style="font-size:25px;text-align:center;">题目</th>
			<th style="font-size:25px;text-align:center;">正确答案</th>
			<th style="font-size:25px;text-align:center;">填入答案</th>
			<th style="font-size:25px;text-align:center;">答题结果</th>
			<th style="font-size:25px;text-align:center;">答题日期</th>
			<th style="font-size:25px;text-align:center;">题目类型</th>
			<th colspan="2" style="font-size:25px;text-align:center;">用户操作</td>
		</tr>
		</thead>
		 <tbody>
   <% 	
    int id=0;
	for( Operation operation:operations)
    {
    	String Date=operation.getQ_Date();
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
			<%
			
			 session.setAttribute("id", ""+id);
			
			session.setAttribute("title", ""+operation.getQ_Question());
			session.setAttribute("id", ""+id);
			
			%>
			
			<td style="font-size:25px;text-align:center;"> <%=id%></td>
			<td style="font-size:25px;text-align:center;"> <%=operation.getQ_Question() %></td>
			<td style="font-size:25px;text-align:center;"> <%=operation.getQ_CorrectResult() %></td>
			<td style="font-size:25px;text-align:center;"> <%=operation.getQ_InputResult() %></td>
			<%
			if(operation.getQ_Status()==0)
			{
				%>
				<td style="font-size:25px;text-align:center;">答对</td>
				<% 
			}
			else
			{
				%>
				<td style="font-size:25px;text-align:center;">答错</td>
				<% 
				
			}
			%>
			<td> <%=operation.getQ_Date() %></td>
			<%
			if(operation.getQ_Type()==0)
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
			<td style="font-size:25px;text-align:center;"> <a href="deleteOperation.jsp?id=<%=operation.getQ_id() %>"><span style="color:red">删除</span></a></td>
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
layui.use('table', function(){
	  var table = layui.table;
table.render({
  elem: '#test'
  ,url:'/demo/table/user/'
  ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
  ,cols: [[
    {field:'id', width:'5%', title: '编号'}
    ,{field:'title', width:'20%', title: '题目'}
    ,{field:'sex', width:'15%', title: '正确答案'}
    ,{field:'',width:'15%',title:'填入答案'}
    ,{field:'',width:'15%',title:'答题结果'}
    ,{field:'',width:'15%',title:'答题日期'}
    ,{field:'',width:'5%',title:'题目类型'}
    ,{field:'',width:'10%',title:'用户操作'}
  ]]
})
});
</script>
<script></script>
</body>
</html>