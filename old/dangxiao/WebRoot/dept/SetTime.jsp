<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*,java.util.Date"%>
<%
	int logType = 0;
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (!ses.get("dxU2").equals(""))
		logType = 2;
	if (!ses.get("dxU3").equals(""))
		logType = 3;
	if (logType == 0) {
		out
		.write("<script>alert('�𾴵Ĺ���Ա,����δ��¼,���¼��');window.location.href='/Login.html'</script>");
		return;
	}
	session.setMaxInactiveInterval(7200);
%>

<%
	DBConn con = new DBConn();
	ResultSet rs;
	con.open();
	try {
%>
<%
		if ("1".equals(request.getParameter("keyw"))) {
			int num = Num.getNum("scoreSea", con);
			num = 1 - num;
			Num.chgNum("scoreSea", num, con);
		}
		int priSelNum = Num.getNum("priSelNum", con);
		int advSelNum = Num.getNum("advSelNum", con);
		int priJudNum = Num.getNum("priJudNum", con);
		int advJudNum = Num.getNum("advJudNum", con);
		int ansNum = Num.getNum("ansNum", con);
		int j = Num.getNum("selWei", con);
		int judWei = Num.getNum("judWei", con);
		rs = con.executeQuery("select * from test_time");
		rs.next();
		String sss = rs.getString("pri_inter");
		String pri_inter = StrKit.SetTime(rs.getString("pri_inter"));
		String adv_inter = StrKit.SetTime(rs.getString("adv_inter"));
		rs = con.executeQuery("select num from numClass where cla='validTime'");
		rs.next();
		int valid = rs.getInt(1);
		String scoreSeaButton = null, scoreSeaState = null;
		int numGet = Num.getNum("scoreSea", con);
		if (numGet == 0) {
			scoreSeaState = "ѧ�������Բ鿴���Գɼ�";
			scoreSeaButton = "����Ϊ����";
		} else if (numGet == 1) {
			scoreSeaState = "ѧ�����Բ鿴���Գɼ�";
			scoreSeaButton = "����Ϊ������";
		} else {
			scoreSeaState = "δ֪����";
			scoreSeaButton = "δ֪����";
		}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
		<link href="SetTime.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			
			
						
			function keyWord() {
				document.getElementById("keyw").value="1";
				formSea.submit();
			}
			
		</script>
	</head>
	<body>
		<div id="outer">
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
					</div>
				</div>
				<br />
				<br />
				<%
				if (logType == 3) {
					Date now = new Date();
				%>
				<div id="bod">
					<div id="bodin">
						<!--��ҳ����---->
						<h3><font  color="red"> ��������ǰʱ�䣺<%=now%></font></h3>
						<br/>
						<fieldset>
							<legend>
								�趨���Բ�ѯ
							</legend>
							<form name="formSea" metho=post action="SetTime.jsp">
								<input type="button" value="<%=scoreSeaButton%>" onclick="keyWord();" />
								<br />
								��ǰ״̬��
								<a><%=scoreSeaState%>
								</a>
								<input type="hidden" name="keyw" id="keyw" value="0" />
							</form>
						</fieldset>

						<form action="setTest/setQueWei.jsp" method="post"
							onsubmit="return checkWei();">
							<div id="header">
								��ĿȨ���趨:[1-99]��
							</div>
							<table border=1>
								<tr>
									<td>
										����ѡ����
									</td>
									<td>
										<input type="text" size="4" id="selWei" name="selWei"
											value="<%=selWei%>" />
										��
									</td>
								</tr>
								<tr>
									<td>
										�����ж���
									</td>
									<td>
										<input type="text" size="4" id="judWei" name="judWei"
											value="<%=judWei%>" />
										��
									</td>
								</tr>
							</table>
							<br />
							<input type="submit" value="ȷ����Ŀ�����趨" />
						</form>
						<fieldset>
							<legend>
								<div>
									<p>
										��Ŀ���趨:[0-999]��
									</p>
								</div>
							</legend>
							<form action="setTest/setQueNum.jsp" method="post"
								onsubmit="return checkNum();">
								<table border=1>
									<p>
										��Ŀ��Ŀ��
									</p>
									<tr>
										<th>
											1
										</th>
										<th>
											����
										</th>
										<th>
											�߼�
										</th>
									</tr>
									<tr>
										<td>
											ѡ������Ŀ��
										</td>
										<td>
											<input type="text" size="4" id="priSelNum" name="priSelNum"
												value="<%=priSelNum%>" />
										</td>
										<td>
											<input type="text" size="4" id="advSelNum" name="advSelNum"
												value="<%=advSelNum%>" />
										</td>
									</tr>
									<tr>
										<td>
											�ж�����Ŀ:
										</td>
										<td>
											<input type="text" size="4" id="priJudNum" name="priJudNum"
												value="<%=priJudNum%>" />
										</td>
										<td>
											<input type="text" size="4" id="advJudNum" name="advJudNum"
												value="<%=advJudNum%>" />
										</td>
									</tr>
								</table>
								<br />
								(�߼�)�������Ŀ:
								<input type="text" size="4" id="ansNum" name="ansNum"
									value="<%=ansNum%>" />
								<br />
								<br />
								<input type="submit" value="ȷ�Ͽ������趨" />
							</form>
						</fieldset>

						
						

						<%
						} else {
						%>
						<br />
						<br />
						<br />
						<br />
						<br />
						<br />
						<h1 style="size:20px;color:#990000;" align="center">
							�Բ����������и�Ȩ��!
						</h1>
						<%
						}
						%>
					</div>
				</div>
			</div>
	</body>
</html>
<%
		} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		con.close();
	}
%>
