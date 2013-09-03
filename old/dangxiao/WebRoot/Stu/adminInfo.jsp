<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="GetGoal.css" type="text/css" rel="stylesheet" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	   <div id="outer">
	    
		<!--         网页头部     -->
		<div class="header">
			<div class="titlepic">
				<p>党校在线考试平台</p>
			</div>
		</div>
		<div class="menucontainer">
			<div class="menu">
				<ul>
					<li>
						<a href="PerInfo.jsp" id="SetTime" name="SetTime">个人资料</a>
					</li>
					<li>
						<a href="ChgPwd.jsp" id="ChgPwd" name="ChgPwd">修改密码</a>
					</li>
					<li>
						<a href="Exam.jsp" id="SetTime" name="SetTime">参加考试</a>
					</li>
					<li>
						<a href="GetGoal.jsp" id="ChgPwd" name="ChgPwd">成绩查询</a>
					</li>
					<li>
						<a href="adminInfo.jsp" id="adminInfo" name="adminInfo">管理员通知</a>
					</li>
					<li>
						<a href="safeExit.jsp">安全退出</a>
					</li>
				</ul>
			</div>
		</div>
		  <div id="bod">
		    <div id="bodin">
		<fieldset>
			<legend>
				公告通知
			</legend>
			<table border=1 align="center" width="600" height="70">
				<tr>
					<th>
						发布时间
					</th>
					<th>
						标题
					</th>
				</tr>
				
				<%
					rs = con.executeQuery("select title,info_id,info_date from infoBroad order by info_date desc");
					while (rs.next()) {
				%>
				<tr>
					<td align=center><%=rs.getString(3)%></td>
					<td align=center>
						<a href="#" onclick="window.open('seeInfo.jsp?id=<%=rs.getInt(2)%>','gxlb','menubar=0,scrollbars=1,resizable=1,width=300,height=400,left=100,top=0');">
							<%=rs.getString(1)%>
						</a>
					</td>
				</tr>

				<%
					}
					
				%>
			</table>
		</fieldset>
		</div>
		</div>
		</div>
	</body>
</html>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>