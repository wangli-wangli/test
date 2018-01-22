 <%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
<%@ page import="team.WHATEVER.Math.dao.UserDaoImpl" %>
<%@ page import="team.WHATEVER.Math.model.User" %>
<%@ page import="team.WHATEVER.Math.model.Homework" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开始答题</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"/>
<link href="../font-awesome-4.7.0" rel="stylesheet" type="text/css"/>
<link href="../layui/css/layui.css" rel="stylesheet"  media="all">
</head>
<body>
 <jsp:include  page="./top.jsp"></jsp:include>
<div id="content">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend style="color:red;font-size:25px;">作业</legend>
    </fieldset>
   <form action="judgeHomework.jsp" method="post">
   <div id="middle" style="text-align:middle">
  <div style="width:100%; overflow:auto; clear:both;">
<% 
    int h_id=Integer.parseInt(request.getParameter("h_id"));
    UserDaoImpl userDao=new UserDaoImpl();
    List<Homework> homeworks=userDao.find_homework(h_id);
    Homework h=homeworks.get(0);//获得List中的一个元素
    int i=0;
    String Question_first=h.getQ_Question();//得到作业中的第一道题目
    boolean is = Question_first.contains("/");//记录是否是分数题，true:是分数题，false:不是分数题
    if(is==false)//作业不是分数题
    {
	    for(Homework homework:homeworks)//如果作业题不是分数题
	    { 
	    	
	    	%>
	    	<h2><%=homework.getQ_Question() %>
	    	 <input type="text" name="inputResult<%=i %>"  
            	             style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);  border-left: medium none; border-right: medium none;
            	             border-top: medium none; border-bottom: 1px solid rgb(139,0,255)"><a class="clear"></a></h2>
            	             <br><br>
	    	<% 
	    	  i++;
	    }
    }
    else //是分数题
    {
    	for(Homework homework:homeworks)//如果作业题不是分数题
	    { 
    		String Question=homework.getQ_Question();
    		char fuhao='+';
    		int first=Question.indexOf("/");//第一个/出现的位置
    		int second=Question.indexOf("+");//第一个符号出现的位置
    		if(second!=0)
    		{
    	        fuhao='+';
    		}
    		if(second==0)
    		{
    			second=Question.indexOf("-");
    			if(second!=0)
        		{
        	        fuhao='-';
        		}
    		}
    		if(second==0)
    		{
    			second=Question.indexOf("×");
    			if(second!=0)
        		{
        	        fuhao='×';
        		}
    		}
    		if(second==0)
    		{
    			second=Question.indexOf("÷");
    			if(second!=0)
        		{
        	        fuhao='÷';
        		}
    		}
    		
    		int three=Question.indexOf("/",first+1);//第二个"/"出现的位置 
    		int four=Question.indexOf("=");//“=”出现的位置
    		String str1_fenzi=Question.substring(0, first);//第一个分数的分子
	    	String str1_fenmu = Question.substring(first + 1, second);//第一个分数的分母
	        String str2_fenzi=Question.substring(second+1,three);//第二个分数的分子
	    	String str2_fenmu = Question.substring(three+1, four );//第二个分数的分母
	    	
	    	%>
	    	<div class="fraction" style="font-size:30px;"><div> <%=str1_fenzi %></div><div style="border-top:2px solid black;font-size:30px;"><%=str1_fenmu %></div></div><div class="nomal">
	    	 <%=fuhao%></div><div class="fraction" style="font-size:30px;"><div> <%=str2_fenzi %></div><div style="border-top:2px solid black;font-size:30px;"><%=str2_fenmu %></div></div>
             <div class="nomal"> =</div>
	    	 <div class='fraction'><div>
                           <input type="text" name="Molecule<%=i %>" value="" style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"/>
                          <%="</div><div style='border-top:2px solid black;'>"%>
                           <input type="text" name="jie<%=i %>" value=" "  style="width:100px; height:32px;font-size:28px;background:rgba(0, 0, 0, 0);"/>
                           <%="</div></div>"%><br><br><br><br><br>
	    	<% 
	    	  i++;
	    }
    }
    session.setAttribute("h_id",""+h_id );

 %>
 <input type="submit" value="提交" 
style="background-image:url(../images/submit_background.jpg) ;width:150px; height:50px;font-size:28px;"/>
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