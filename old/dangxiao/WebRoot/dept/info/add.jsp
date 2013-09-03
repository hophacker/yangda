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
	String title = request.getParameter("title");
	String info = request.getParameter("info");
	String retStr = null;
	Connection conCal = null;
	CallableStatement cs = null;
		try{
			conCal = DBConn.pool.getConnection();
			cs = conCal.prepareCall("{call add_info(?, ?)}");
			cs.setString(1, chTr.toOracle(title.trim()));
			cs.setString(2, chTr.toOracle(info.trim()));
			cs.execute();
			cs.close();
			
			retStr =  "添加通知成功！";
		}catch(Exception ex){
			ex.printStackTrace();
			retStr =  "通知添加失败！";
		}
		response.setHeader("Refresh", "0;URL = ../infoBroad.jsp");
		out.print("<script>alert('" +  retStr + "');</script>");
%>
<%
		} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		con.close();
	}
%>