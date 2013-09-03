<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType=0;
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	request.setCharacterEncoding("GBK");
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
	String adv_inter = request.getParameter("adv");
	String pri_inter = request.getParameter("pri");
	String validTime = request.getParameter("valid");
	con.executeUpdate("update numClass set num='" + validTime + "' where cla='validTime'");
	String updateStr = "update test_time set "
			+ "pri_inter='" + pri_inter 
			+ "', adv_inter='" + adv_inter + "'";
	con.executeUpdate(updateStr);
		//con_end
	
	out.print("<script>history.back();alert('设定时长成功!');</script>");
%><%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
