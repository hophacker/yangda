<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" language="java" %>
<%@ page import="java.sql.*,db.*,com.jspsmart.upload.*"%>
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
	int paper_id = (Integer.parseInt(request.getParameter("paper_id"))-54321)/12345;
	String queryS = null;
	int hasPaper = 0;
//	if (logType == 2){
//		queryS = "select paper_id from testPaper where dept_id=" + ses.get("m_dept_id");
//		rs = con.executeQuery(queryS);
//		if (rs.next() && paper_id != rs.getInt("paper_id")){
//				response.setHeader("Refresh", "0;URL=../AddSeaMid.jsp");
//				out.print("<script>alert('你们学院已经下载过试卷，不可以再下载！');</script>");
//		}
//	}
	queryS = "select paper_ext from testPaper where paper_id=" + paper_id;
	rs = con.executeQuery(queryS);
	rs.next();
	String paper_ext = rs.getString("paper_ext");
	String downfile= "/testPaper/"+paper_id+"." + paper_ext;
	SmartUpload su = new SmartUpload();
	su.initialize(pageContext);
	su.setContentDisposition(null);
	su.downloadFile(downfile);
	response.setHeader("Refresh", "0;URL=../AddSeaMid.jsp");
	out.print("<script>alert('下载成功！');</script>");
%>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
