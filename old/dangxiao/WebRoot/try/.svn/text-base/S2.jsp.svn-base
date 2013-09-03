<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'S2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%@page language="java" %>
	<%!String name=""; %>
	<%
		name = request.getParameter("thename");
		out.println(name);
		session.putValue("thename", name);
	 %>
  	您的姓名是:<%=name %>
  	<p>
  	<form method=POST action="/jack/session/S3.jsp">
  		您喜欢什么运动?
  		<input type=text name="sport">
  		<p>
  		<input type=submit value="下一步">
  	</form>
			
  </body>
</html>
