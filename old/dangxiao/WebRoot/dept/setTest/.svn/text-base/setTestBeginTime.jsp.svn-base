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
	request.setCharacterEncoding("GBK");
	String dept_id;
	int total = Integer.parseInt(request.getParameter("total").trim());
	for (int i = 1; i <= total; i++) {
			dept_id = request.getParameter("num"+i);
			String begin = null;
			for (int j = 1; j <= 3; j++){
				begin =  request.getParameter("" + i +j);
				if (!begin.trim().equals("")){
					String updateStr = "update test_time set " 
					+ " pri_begin_" + j + "='" + begin + "' where dept_id ='" + dept_id + "'";
				con.executeUpdate(updateStr);	
				}
			}
			for (int j = 4; j <= 6; j++){
				begin =  request.getParameter("" + i +j);
				if (!begin.trim().equals("")){
					String updateStr = "update test_time set " 
					+ " adv_begin_" + (j-3) + "='" + begin + "' where dept_id ='" + dept_id + "'";
				con.executeUpdate(updateStr);	
				}
			}
		}
			//con_end
		
		out.print("<script>history.back();alert('设定开始时间成功!');</script>");
%><%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
