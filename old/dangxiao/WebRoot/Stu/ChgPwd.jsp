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
		<link href="ChgPwd.css" type="text/css" rel="stylesheet" />
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
		<!--        网页正文    -->
		   <div id="bod">
				 <div id="bodin">
						<div id="header">
								修改密码
						</div>
						<form action="ChgPwd1.jsp" method="post">
					<div id="old">
						原密码:
						<input type="password" id="oldpwd" name="oldpwd" value="" />
					</div>
					<div id="new">
						新密码:
						<input type="password" id="newpwd" name="newpwd" value="" />
					</div>
					<div id="chc">
						确认:
						<input type="password" id="confpwd" name="confpwd" value="" />
					</div>
					<div>
						<input type="submit" id="conf" value="确定修改" />
					</div>
				</form>
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