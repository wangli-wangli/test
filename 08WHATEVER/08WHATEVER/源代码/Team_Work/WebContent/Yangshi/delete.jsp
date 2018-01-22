<%@page import="team.WHATEVER.Math.dao.UserDaoImpl"%>
<%@page import="team.WHATEVER.Math.Util.DaoFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%-- <%@include file="../inc/AdminCheck.jsp"  %> --%>
<%
int id=Integer.parseInt(request.getParameter("id"));
  %>
    <%-- <jsp:include page="../inc/AdminCheck.jsp"> 
        <jsp:param name="id" value="<%=id %>"/>
	</jsp:include>- --%>
<% 
   //工厂模式（习惯分装--模式）
   UserDaoImpl userDao=DaoFactory.getDaoImpl();
   userDao.delete_user(id);
   response.sendRedirect("./List.jsp");
 %>
