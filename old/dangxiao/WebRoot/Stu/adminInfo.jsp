<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('�𾴵�ѧԱ,����δ��¼,���¼��');window.location.href='/Login.html'</script>");	
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
	    
		<!--         ��ҳͷ��     -->
		<div class="header">
			<div class="titlepic">
				<p>��У���߿���ƽ̨</p>
			</div>
		</div>
		<div class="menucontainer">
			<div class="menu">
				<ul>
					<li>
						<a href="PerInfo.jsp" id="SetTime" name="SetTime">��������</a>
					</li>
					<li>
						<a href="ChgPwd.jsp" id="ChgPwd" name="ChgPwd">�޸�����</a>
					</li>
					<li>
						<a href="Exam.jsp" id="SetTime" name="SetTime">�μӿ���</a>
					</li>
					<li>
						<a href="GetGoal.jsp" id="ChgPwd" name="ChgPwd">�ɼ���ѯ</a>
					</li>
					<li>
						<a href="adminInfo.jsp" id="adminInfo" name="adminInfo">����Ա֪ͨ</a>
					</li>
					<li>
						<a href="safeExit.jsp">��ȫ�˳�</a>
					</li>
				</ul>
			</div>
		</div>
		  <div id="bod">
		    <div id="bodin">
		<fieldset>
			<legend>
				����֪ͨ
			</legend>
			<table border=1 align="center" width="600" height="70">
				<tr>
					<th>
						����ʱ��
					</th>
					<th>
						����
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