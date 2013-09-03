<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.sql.*,db.*,java.io.File"%>
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
	String queryS = null;
	int total = Integer.parseInt(request.getParameter("total"));
	for (int num = 1; num <= total; num++)
		if (request.getParameter("cho"+num) != null){
			String paper_id = request.getParameter("" + num);
			queryS = "select paper_ext from testPaper where paper_id=" + paper_id;
			rs = con.executeQuery(queryS);
			rs.next();
			String paper_ext = rs.getString("paper_ext");
			String delFile= "../../testPaper/"+paper_id+"." + paper_ext;
			queryS = "delete from testPaper where paper_id=" + paper_id;
			con.executeUpdate(queryS);
			new File(delFile).delete();
	}
	
	response.setHeader("Refresh", "0;URL=../AddSeaMid.jsp");
	out.print("<script>alert('删除考卷成功！');</script>");
%>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
