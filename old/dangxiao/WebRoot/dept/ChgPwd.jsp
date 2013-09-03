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
		if ("1".equals(request.getParameter("keyw"))) {
			String table = null;
			String m_user = null;
			String queryS = null;
			if (logType == 2){
				table = "dept_manager";
				m_user = ses.get("dxU2");	
			}
			else{
				table = "school_manager";
				m_user = ses.get("dxU3");
			}
			queryS = "select m_pwd from " + table + " where m_user='"+m_user+"'";
			rs = con.executeQuery(queryS);
			rs.next();
			String pwd = rs.getString("m_pwd");
			String oldpwd = request.getParameter("oldpwd");
			String newpwd = request.getParameter("newpwd");
			String confpwd = request.getParameter("confpwd");
			if (oldpwd != null) {

			if (!pwd.equals(oldpwd)) {
				response.setHeader("Refresh", "0;URL=ChgPwd.jsp");
				out
				.write("<script>alert('输入的旧密码有误，请重新输入！');</script>");
			} else if (newpwd.equals("")) {
				response.setHeader("Refresh", "0;URL=ChgPwd.jsp");
				out
				.write("<script>alert('输入的新密码不能为空，请重新输入！');</script>");
			} else if (!newpwd.equals(confpwd)) {
				response.setHeader("Refresh", "0;URL=ChgPwd.jsp");
				out
				.write("<script>alert('两次输入的新密码不一样，请重新输入！');</script>");
			} else {
				
				
				queryS = "update " + table + " set m_pwd='"
					+ newpwd
					+ "' where m_user='"
					+ m_user + "'" ;
			
			con.executeUpdate(queryS);

			response.setHeader("Refresh", "0;URL=ChgPwd.jsp");
			out.write("<script>alert('修改密码成功');</script>");
		}
			}
		}
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="ChgPwd.css" rel="stylesheet" type="text/css" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
		<script language="javascript">
	function keyword() {
		document.getElementById("keyw").value = "" + 1;
		Form.submit();
	}
</script>
	</head>
	<body>
		<!--                     网页头部                   -->
		<div id="outer">
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

				<!--                 网页正文          -->
				<br />
				<br />
				<div id="bod">
					<div id="bodin">
						<div align="center">
							<div id="header">
								修改密码
							</div>
							<br />
							<form name="Form" action="ChgPwd.jsp" method="post">
								<div id="orgin">
									原密码:
									<input type="password" id="oldpwd" name="oldpwd" value="" />
								</div>
								<div id="new">
									新密码:
									<input type="password" id="newpwd" name="newpwd" value="" />
								</div>
								<div id="chec">
									确定:
									<input type="password" id="confpwd" name="confpwd" value="" />
								</div>
								<input type="hidden" id="keyw" name="keyw" value="0" />
								<div>
									<input type="submit" id="conf" value="确认修改"
										onclick="keyword();" />
								</div>
							</form>
						</div>
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
