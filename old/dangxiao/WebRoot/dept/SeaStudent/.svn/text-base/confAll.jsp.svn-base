<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.sql.*,db.*" %>
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
	int total = Integer.parseInt(request.getParameter("total"));
	for (int num = 1; num <= total; num++){
		String s_user = request.getParameter(""+num);
		String type=null;
		for (int j = 0; j < 4; j++){
		 type = request.getParameter("cho"+num+j);
		 if (type != null) break;
		}
		con.executeUpdate("update student set score_type=" + type + " , end_sec=-1 where s_user= '" + s_user +"'");
	}
	
	response.setHeader("Refresh", "0;URL = ../SeaStudent.jsp");
	out.write("<script>alert('分配成功');</script>");
%>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
