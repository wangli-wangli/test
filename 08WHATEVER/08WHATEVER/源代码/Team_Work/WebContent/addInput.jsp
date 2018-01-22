<%@ page import="team.WHATEVER.Math.Util.ValidateUtil" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>用户添加页面</title>
</head>
<body>
	<h2 style="text-align:center;color:#000000; font-family:楷体 ;font-size:30px">先注册个用户</h2>
	<form action="add.jsp" method="get">
		<table align="center" border="0" width="400">
			<tr>
				<td>用户姓名:</td>
				<td>
					<input type="text" name="username" />
					<%-- <%=ValidateUtil.showError(request,"username")
					 %> --%>
				</td>
			</tr>
				<tr>
    			<td>用户密码 : </td>
    			<td>
    				<input type="password" name="密码" />
					<%= ValidateUtil.showError(request,"密码")
					 %>
    			</td>
    		</tr>
    		<tr>
    			<td>用户昵称:</td>
    			<td>
    				<input type="text" name="昵称" />
					<%=ValidateUtil.showError(request,"昵称")%>
    			</td>
    		</tr>
    		<tr>
    			<td>用户类型 :</td>
    			<td>
    				<input type="radio" name="类型" value="学生"> 学生
    				<input type="radio" name="类型" value="老师"> 老师
    			   <%=ValidateUtil.showError(request,"类型")%>
    			</td>
    		</tr>
    		<!-- <tr>
    			<td>用户小组 :</td>
    			<td>
    				<input type="text" name="group" />
    			</td>
    		</tr> -->
    		<tr align="center">
    			<td colspan="2">
    				<input type="submit" value="提交" />
    				<input type="reset" value="重置" />
    			</td>
    		</tr>
		</table>
	</form>
</body>
</html>