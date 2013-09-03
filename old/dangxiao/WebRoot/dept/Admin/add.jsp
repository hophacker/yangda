<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType=0;
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (!ses.get("dxU2").equals(""))  logType = 2;
	if (!ses.get("dxU3").equals(""))  logType = 3;
	if (logType == 0){
		out.write("<script>alert('尊敬的管理员,您尚未登录,请登录！');window.location.href='/Login.html'</script>");	
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
	request.setCharacterEncoding("GBK");
	String m_user = request.getParameter("addadmin");
	String m_pwd = request.getParameter("addpwd");
	String m_name = request.getParameter("adminame");
	String dept_id = request.getParameter("admindept");
	String str = null; 
	str = "select * from dept_manager where m_user='" + m_user +"'";
	//System.out.println(str);
	String returnStr = null;
	if (con.executeQuery(str).next()){
		returnStr = "您输入的用户名已经被使用！";
	}else{
		str = "insert into dept_manager values('"
		 + m_user + "','"
		 +  m_pwd + "','"
		 +  m_name + "','"
		 +  dept_id + "')";
		con.executeUpdate(str);
		returnStr = "添加用户名成功！";
	}
	
	out.print("<script>history.back();alert('" + returnStr  + "');</script>");
%>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
