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
		out.write("<script>alert('�𾴵Ĺ���Ա,����δ��¼,���¼��');window.location.href='/Login.html'</script>");	
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
	String selWei = request.getParameter("selWei");
	String judWei = request.getParameter("judWei");
	con.executeUpdate("update numClass set num =" + selWei + " where cla ='selWei'");
	con.executeUpdate("update numClass set num =" + judWei + " where cla ='judWei'");
	
	out.print("<script>history.back();alert('�趨��ĿȨ�سɹ�!');</script>");
%><%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
