<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('尊敬的学员,您尚未登录,请登录！');window.location.href='/Login.html'</script>");	
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
	request.setCharacterEncoding("GBK");
	String s_name = request.getParameter("s_name");
	String sclass = request.getParameter("sclass");
	String semail = request.getParameter("semail");
	String biryear = request.getParameter("biryear");
	String birmonth = request.getParameter("birmonth");
	String birday = request.getParameter("birday");
	String s_id = request.getParameter("s_id");
	String str = "update student set " + "s_name='" + s_name.trim() + "', s_class='"
			+ sclass.trim() + "', s_mail='" + semail.trim() + "', s_date_year='"
			+ biryear.trim() + "', s_date_month='" + birmonth.trim() + "', s_id='" + s_id.trim()
			+ "', s_date_day='" + birday.trim() + "' where s_user='"+ ses.get("s_user").trim() + "'";
	con.executeUpdate(str);
	session.setAttribute("s_name", s_name);
	session.setAttribute("biryear", biryear);
	session.setAttribute("birmonth", birmonth);
	session.setAttribute("birday", birday);
	session.setAttribute("sclass", sclass);
	session.setAttribute("semail", semail);
	session.setAttribute("s_id", s_id);
	String returnStr = "修改信息成功";
	out.print("<script>history.back();alert('" + returnStr + "');</script>");
	
%>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
