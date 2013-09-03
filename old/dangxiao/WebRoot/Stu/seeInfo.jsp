<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('×ð¾´µÄÑ§Ô±,ÄúÉÐÎ´µÇÂ¼,ÇëµÇÂ¼£¡');window.location.href='/Login.html'</script>");	
		return;
	}
	session.setMaxInactiveInterval(7200);
%>
<%
	DBConn con = new DBConn();
	ResultSet rs;
	con.open();try{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <body>
  	<%
  		String info_id = request.getParameter("id"); 
  		rs = con.executeQuery("select info from infoBroad where info_id='" + info_id + "'");
  		rs.next();
  	%>
  	
  		<div align="center">
  			<%=rs.getString(1)%>
  		</div>
  	<%
  		 
  	%>
  </body>
</html>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>