<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.sql.*,db.*"%>
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

<html>
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
		<meta http-equiv="expires" content="0" />
		<script language="javascript">
			function keyw(i)
			{
			 document.getElementById("keyw"+i).value="1";
			}
		</script>
		<link href="Head.css" rel="stylesheet" type="text/css" />
		<link href="deptChg.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="outer">
			<!--                     网页头部                   -->
			<div class="titlepic">
				<p>
					党校在线考试平台
				</p>
			</div>
			<div class="menucontainer">
				<div class="menu">
					<ul>
						<li>
							<a>用户设定</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="AddAdmin.jsp">添加管理员</a>
											</li>
											<li>
												<a href="DelAdmin.jsp">删除管理员</a>
											</li>
											<li>
												<a href="SeaAdmin.jsp">查看管理员</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>学员管理</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="SeaStudent.jsp">考试分配</a>
											</li>
											<li>
												<a href="chgStudent.jsp">查看修改</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>试题维护</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="AddSelQue.jsp">添加选择题</a>
											</li>
											<li>
												<a href="SeaSelQue.jsp">查询选择题</a>
											</li>
											<li>
												<a href="AddJudQue.jsp">添加判断题</a>
											</li>
											<li>
												<a href="SeaJudQue.jsp">查询判断题</a>
											</li>
											<li>
												<a href="AddAnsQue.jsp">添加解答题</a>
											</li>
											<li>
												<a href="SeaAnsQue.jsp">查看解答题</a>
											</li>
											<li>
												<a href="AddSeaMid.jsp">添加下载中级试卷</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>考试管理</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="SetTime.jsp">考试设定</a>
											</li>
											<li>
												<a href="SeaTestSet.jsp">考试查看</a>
											</li>
											<li>
												<a href="testCheck.jsp">试卷批阅</a>
											</li>
											<li>
												<a href="GetGoal.jsp">成绩统计</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li></li>
						<li>
							<a href="ChgPwd.jsp">修改密码</a>
						</li>
						<li>
							<a href="deptChg.jsp">学院更改</a>
						</li>
						<li>
							<a href="infoBroad.jsp">信息发布</a>
						</li>
						<li>
							<a href="safeExit.jsp">安全退出</a>
						</li>
					</ul>
				</div>
			</div>
			<br />
			<br />

			<!-- 网页正文 -->
			<%if (logType==3){%>
			<%
		request.setCharacterEncoding("GBK");
		if ("1".equals(request.getParameter("keyw1"))) {
			String deptName = request.getParameter("deptName").trim();
			Connection conCall = DBConn.pool.getConnection();
			conCall.setAutoCommit(true);
			CallableStatement cs = conCall
			.prepareCall("{call insert_dept(?)}");
			cs.setString(1, deptName);
			cs.execute();
			cs.close();
			conCall.close();
			out.write("<script>alert('已添加院系！');</script>");
		} else if ("1".equals(request.getParameter("keyw2"))) {
			String dept1 = request.getParameter("admindept1");
			String dept2 = request.getParameter("admindept2");
			String queryS = "update student set dept_id=" + dept1
			+ " where dept_id=" + dept2;
			int n = con.executeUpdate(queryS);
			out.write("<script>alert('院系名单转移成功，共有" + n
			+ "人被转移！');</script>");
		} else if ("1".equals(request.getParameter("keyw3"))) {
			String deptId = request.getParameter("admindept").trim();
			Connection conCall = DBConn.pool.getConnection();
			conCall.setAutoCommit(true);
			CallableStatement cs = conCall
			.prepareCall("{call del_dept(?)}");
			cs.setInt(1, Integer.parseInt(deptId));
			cs.execute();
			cs.close();
			conCall.close();
			out.write("<script>alert('删除院系成功！');</script>");
		}
%>
			<div id="bod">
				<div id="bodin">
					<div id="l1">
						<form action="deptChg.jsp" method="post">
							<fieldset>
								<legend>
									院系创建
								</legend>
								<span>院系名:</span>
								<input id="deptName" name="deptName" size=16 />

								<input type="hidden" id="keyw1" name="keyw1" value="0" />
								<br />

								<input name="submit" type="submit" class="con" value="确定"
									onclick="keyw(1);" />
							</fieldset>
						</form>
					</div>

					<div id="l2">
						<form action="deptChg.jsp" method="post">
							<fieldset>
								<legend>
									院系名单转移
								</legend>

								<span>原院系:</span>
								<select name="admindept1" id="admindept1">
									<%
											rs = con
											.executeQuery("select * from department where not(dept_id=0)");
											while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>">
										<%=rs.getString(2)%>
									</option>
									<%
									}
									%>
								</select>
								<p>
									<span>现院系:</span>
									<select name="admindept2" id="admindept2">
										<%
												rs = con
												.executeQuery("select * from department where not(dept_id=0)");
												while (rs.next()) {
										%>
										<option value="<%=rs.getInt(1)%>">
											<%=rs.getString(2)%>
										</option>
										<%
										}
										%>
									</select>
									<input type="hidden" id="keyw2" name="keyw2" value="0" />
									<br />

									<input name="submit" type="submit" class="con" value="确定"
										onclick="keyw(2);" />
								</p>
							</fieldset>
						</form>
					</div>
					<div id="l3">
						<form action="deptChg.jsp" method="post">
							<fieldset>
								<legend>
									院系删除
								</legend>
								<span>院系名:</span>
								<select name="admindept" id="admindept">
									<%
											rs = con
											.executeQuery("select * from department where not(dept_id=0)");
											while (rs.next()) {
									%>
									<option value="<%=rs.getInt(1)%>">
										<%=rs.getString(2)%>
									</option>
									<%
									}
									%>
								</select>
								<input type="hidden" id="keyw3" name="keyw3" value="0" />
								<br />

								<input name="submit" type="submit" class="con" value="确定"
									onclick="keyw(3);" />

							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<%}else{
			%>
				<br/><br/><br/><br/><br/><br/>
				<h1 style="size:20px;color:#990000;" align="center">对不起，您不具有该权限!</h1>
			<%
				}
			%>
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
