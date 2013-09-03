<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	DBConn con = new DBConn();
	ResultSet rs;
	con.open();
	try {
%>
<%
		ses.setSession(session);
		request.setCharacterEncoding("GBK");
		if (ses.get("dxU1").equals("")) {
			out
			.write("<script>alert('您尚未登录，请登录！');window.location.href='../Login.html'</script>");
			return;
		}
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":"
		+ request.getServerPort() + path + "/";
		String s_name = ses.get("s_name");
		String biryear = ses.get("biryear");
		String birmonth = ses.get("birmonth");
		String birday = ses.get("birday");
		String sdept = ses.get("dept_name");
		String sclass = ses.get("sclass");
		String s_id = ses.get("s_id");
		String semail = ses.get("semail");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB2312" />
		<link rel="stylesheet" type="text/css" href="PerInfo.css" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
	</head>
	<body>

		<div id="outer">
			<!--         网页头部     -->
			<div class="header">
				<div class="titlepic">
					<p>
						党校在线考试平台
					</p>
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
			<!--        网页正文    -->
			<div id="bod">
				<div id="bodin">
					<div id="header">
						个人信息
					</div>
					<form action="changeInfo.jsp" method="post">
						<div id="name">
							<span>姓名：</span>
							<input type="text" id="s_name" name="s_name" value="<%=s_name%>" />
						</div>
						<div id="birth">
							<span>出生年月：</span>
							<input type="text" size="5" name="biryear" id="biryear"
								value="<%=biryear%>" />
							年
							<input type="text" size="3" name="birmonth" id="birmonth"
								value="<%=birmonth%>" />
							月
							<input type="text" size="3" name="birday" id="birday"
								value="<%=birday%>" />
							日
						</div>
						<div id="dept">
							<span>院系：</span>
							<input type="text" name="sdept" readonly id="sdept"
								value="<%=sdept%>" />
						</div>
						<div id="class">
							<span>班级：</span>
							<input type="text" name="sclass" id="sclass" value="<%=sclass%>" />
						</div>
						<div id="no">
							<span>学号：</span>
							<input type="text" name="s_id" id="s_id" value="<%=s_id%>" />
						</div>
						<div id="mail">
							<span>邮箱：</span>
							<input type="text" name="semail" id="semail" value="<%=semail%>" />
						</div>
						<div id="change">
							<input type="submit" value="确认修改" />
						</div>
					</form>
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
