<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType=0;
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
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
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="SeaTestSet.css" rel="stylesheet" type="text/css" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<!--                     ��ҳͷ��                   -->
		<div id="outer">
			<!--                     ��ҳͷ��                   -->
			<div class="titlepic">
				<p>
					��У���߿���ƽ̨
				</p>
			</div>
			<div class="menucontainer">
				<div class="menu">
					<ul>
						<li>
							<a>�û��趨</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="AddAdmin.jsp">���ӹ���Ա</a>
											</li>
											<li>
												<a href="DelAdmin.jsp">ɾ������Ա</a>
											</li>
											<li>
												<a href="SeaAdmin.jsp">�鿴����Ա</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>ѧԱ����</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="SeaStudent.jsp">���Է���</a>
											</li>
											<li>
												<a href="chgStudent.jsp">�鿴�޸�</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>����ά��</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="AddSelQue.jsp">����ѡ����</a>
											</li>
											<li>
												<a href="SeaSelQue.jsp">��ѯѡ����</a>
											</li>
											<li>
												<a href="AddJudQue.jsp">�����ж���</a>
											</li>
											<li>
												<a href="SeaJudQue.jsp">��ѯ�ж���</a>
											</li>
											<li>
												<a href="AddAnsQue.jsp">���ӽ����</a>
											</li>
											<li>
												<a href="SeaAnsQue.jsp">�鿴�����</a>
											</li>
											<li>
												<a href="AddSeaMid.jsp">���������м��Ծ�</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>���Թ���</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="SetTime.jsp">�����趨</a>
											</li>
											<li>
												<a href="SeaTestSet.jsp">���Բ鿴</a>
											</li>
											<li>
												<a href="testCheck.jsp">�Ծ�����</a>
											</li>
											<li>
												<a href="GetGoal.jsp">�ɼ�ͳ��</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						
						<li>
							<a href="ChgPwd.jsp">�޸�����</a>
						</li>
						<li>
							<a href="deptChg.jsp">ѧԺ����</a>
						</li>
						<li>
							<a href="infoBroad.jsp">��Ϣ����</a>
						</li>
						<li>
							<a href="safeExit.jsp">��ȫ�˳�</a>
						</li>
					</ul>
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