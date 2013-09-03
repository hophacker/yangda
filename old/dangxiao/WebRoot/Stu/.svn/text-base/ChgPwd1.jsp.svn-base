<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('尊敬的学员,您尚未登录,请登录！');window.location.href='/Login.html'</script>");	
		return;
	}
	session.setMaxInactiveInterval(7200);
%>
<%
	DBConn con = new DBConn();
	ResultSet rs;
	con.open();try{
%>
<%
	ses.setSession(session);
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('您尚未登录，请登录！');window.location.href='../Login.html'</script>");
		return;
	}
	String oldpwd = request.getParameter("oldpwd");
	String newpwd= request.getParameter("newpwd");
	String confpwd = request.getParameter("confpwd");
	String name = ses.get("dxU1");
	String pwd = ses.get("dxP1");
	
	if (!pwd.equals(oldpwd)){
		out.write("<script>history.back();alert('输入的旧密码有误，请重新输入！');</script>");
	}else if (newpwd.equals("")){
		out.write("<script>history.back();alert('输入的新密码不能为空，请重新输入！');</script>");
	}
	else if (!newpwd.equals(confpwd)){
		out.write("<script>history.back();alert('两次输入的新密码不一样，请重新输入！');</script>");
	}else{
		con.executeUpdate("update student set s_pwd='" + newpwd + "' where s_user='" + name + "'");
		
		out.write("<script>history.back();alert('密码修改成功！');</script>");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
    
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
  </body>
</html>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>