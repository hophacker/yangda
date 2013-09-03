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
	SmartUpload paper = new SmartUpload();
	paper.initialize(pageContext);
	request.setCharacterEncoding("GBK");
	long maxSize = 20 * 1024 * 1024;// 每个上传文件的最大长度为20MB
	paper.setMaxFileSize(maxSize);
	paper.upload();	
	File paperFile = paper.getFiles().getFile(0);
	if (!paperFile.isMissing()){
		String paperName =paper.getRequest().getParameter("paperName").trim();
		String paperDes = paper.getRequest().getParameter("paperDes").trim();
		String paperExt = paperFile.getFileExt();
		con.setAutoCommit(false);
		CallableStatement cs = con.prepareCall("{call insert_testPaper(?, ?, ?, ?)}");
		try{
			cs.setString(1, paperExt);
			cs.setString(2, paperName);
			cs.setString(3, paperDes);
			cs.registerOutParameter(4, Types.INTEGER);
			cs.execute();
			con.commit();
			int id = cs.getInt(4);
			String path = "/testPaper/" + id +"."+paperExt;
			paperFile.saveAs(path, File.SAVEAS_VIRTUAL);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			cs.close();
			con.close();
		}
		
		response.setHeader("Refresh", "0;URL=../AddSeaMid.jsp");
		out.print("<script>alert('上传考卷成功！');</script>");
	}else{
		response.setHeader("Refresh", "0;URL=../AddSeaMid.jsp");
		out.print("<script>alert('上传考卷成功！');</script>");
	}

%>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>