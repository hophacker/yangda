<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('�𾴵�ѧԱ,����δ��¼,���¼��');window.location.href='/Login.html'</script>");	
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
		out.write("<script>alert('����δ��¼�����¼��');window.location.href='../Login.html'</script>");
		return;
	}
	String oldpwd = request.getParameter("oldpwd");
	String newpwd= request.getParameter("newpwd");
	String confpwd = request.getParameter("confpwd");
	String name = ses.get("dxU1");
	String pwd = ses.get("dxP1");
	
	if (!pwd.equals(oldpwd)){
		out.write("<script>history.back();alert('����ľ������������������룡');</script>");
	}else if (newpwd.equals("")){
		out.write("<script>history.back();alert('����������벻��Ϊ�գ����������룡');</script>");
	}
	else if (!newpwd.equals(confpwd)){
		out.write("<script>history.back();alert('��������������벻һ�������������룡');</script>");
	}else{
		con.executeUpdate("update student set s_pwd='" + newpwd + "' where s_user='" + name + "'");
		
		out.write("<script>history.back();alert('�����޸ĳɹ���');</script>");
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