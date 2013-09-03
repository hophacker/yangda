<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.sql.*,db.*" %>
<%
request.setCharacterEncoding("GBK");
ses.setSession(session);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
  	<font color=red>¿¼ÊÔ´ð°¸ÐÞ¸Ä</font><br/>
    <%=ses.get("ExamResult") %>
    <%session.removeAttribute("ExamResult"); %>
  </body>
</html>
