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
	String priSelNum = request.getParameter("priSelNum");
	String advSelNum = request.getParameter("advSelNum");
	String priJudNum = request.getParameter("priJudNum");
	String advJudNum = request.getParameter("advJudNum");
	String ansNum = request.getParameter("ansNum");
	con.executeUpdate("update numClass set num =" + priSelNum + " where cla ='priSelNum'");
	con.executeUpdate("update numClass set num =" + advSelNum + " where cla ='advSelNum'");
	con.executeUpdate("update numClass set num =" + priJudNum + " where cla ='priJudNum'");
	con.executeUpdate("update numClass set num =" + advJudNum + " where cla ='advJudNum'");
	con.executeUpdate("update numClass set num =" + ansNum + " where cla ='ansNum'");
	
	out.print("<script>history.back();alert('设定题目数成功!');</script>");
%>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
