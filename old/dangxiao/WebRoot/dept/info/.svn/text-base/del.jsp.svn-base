<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType = 0;
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (!ses.get("dxU2").equals(""))
		logType = 2;
	if (!ses.get("dxU3").equals(""))
		logType = 3;
	if (logType == 0) {
		out
		.write("<script>alert('尊敬的管理员,您尚未登录,请登录！');window.location.href='/Login.html'</script>");
		return;
	}
	session.setMaxInactiveInterval(7200);
%>

<%
	DBConn con = new DBConn();
	ResultSet rs;
	con.open();
	try {
%>
<% 
	int total = Integer.parseInt(request.getParameter("total"));
	for (int num = 1; num <= total; num++){
		String info_id = request.getParameter(""+num);
		if (info_id != null)
			con.executeUpdate("delete from infoBroad where info_id= '" + info_id +"'");
	}
	con.close();
	response.setHeader("Refresh", "0;URL = ../infoBroad.jsp");
	out.write("<script>alert('删除成功');</script>");
%>

<%
		} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		con.close();
	}
%>