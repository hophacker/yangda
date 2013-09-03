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
		.write("<script>alert('尊敬的管理员,您尚未登录,请登录！');window.location.href='/Login.html'</script>");
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
			scoreSeaState = "学生不可以查看考试成绩";
			scoreSeaButton = "设置为可以";
		} else if (numGet == 1) {
			scoreSeaState = "学生可以查看考试成绩";
			scoreSeaButton = "设置为不可以";
		} else {
			scoreSeaState = "未知错误";
			scoreSeaButton = "未知错误";
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
			<!--                     网页头部                   -->
			<div id="outer">
				<!--                     网页头部                   -->
				<div class="titlepic">
					<p>
						党校在线考试平台
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
						<!--网页正文---->
						<h3><font  color="red"> 服务器当前时间：<%=now%></font></h3>
						<br/>
						<fieldset>
							<legend>
								设定考试查询
							</legend>
							<form name="formSea" metho=post action="SetTime.jsp">
								<input type="button" value="<%=scoreSeaButton%>" onclick="keyWord();" />
								<br />
								当前状态：
								<a><%=scoreSeaState%>
								</a>
								<input type="hidden" name="keyw" id="keyw" value="0" />
							</form>
						</fieldset>

						<form action="setTest/setQueWei.jsp" method="post"
							onsubmit="return checkWei();">
							<div id="header">
								题目权重设定:[1-99]分
							</div>
							<table border=1>
								<tr>
									<td>
										单条选择题
									</td>
									<td>
										<input type="text" size="4" id="selWei" name="selWei"
											value="<%=selWei%>" />
										分
									</td>
								</tr>
								<tr>
									<td>
										单条判断题
									</td>
									<td>
										<input type="text" size="4" id="judWei" name="judWei"
											value="<%=judWei%>" />
										分
									</td>
								</tr>
							</table>
							<br />
							<input type="submit" value="确认题目分数设定" />
						</form>
						<fieldset>
							<legend>
								<div>
									<p>
										题目数设定:[0-999]条
									</p>
								</div>
							</legend>
							<form action="setTest/setQueNum.jsp" method="post"
								onsubmit="return checkNum();">
								<table border=1>
									<p>
										题目数目：
									</p>
									<tr>
										<th>
											1
										</th>
										<th>
											初级
										</th>
										<th>
											高级
										</th>
									</tr>
									<tr>
										<td>
											选择题数目：
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
											判断题数目:
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
								(高级)解答题数目:
								<input type="text" size="4" id="ansNum" name="ansNum"
									value="<%=ansNum%>" />
								<br />
								<br />
								<input type="submit" value="确认考题数设定" />
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
							对不起，您不具有该权限!
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
