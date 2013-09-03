<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="java.sql.*,db.*" %>
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
	String m_user = request.getParameter("deladmin");
	int ret = con.executeUpdate("delete from dept_manager where m_user= '" + m_user +"'");
	response.setHeader("Refresh", "0;URL = ../DelAdmin.jsp");
	
	if (ret == 0){
		out.write("<script>alert('没有该用户名');</script>");	
	}
	else if(ret == -1)
		out.write("<script>alert('删除失败,数据库访问错误');</script>");
	else
		out.write("<script>alert('删除成功');</script>");
%>

<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
