<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"
	errorPage="error.jsp"%>
<%@ page import="java.sql.*,db.*"%>
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
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="DelAdmin.css" rel="stylesheet" type="text/css" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
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
			<!--                 网页正文          -->
			
			<br />
			<br />
			<%if (logType==3){%>

			<div id="bod">
				<div id="bodin">
					<div id="header">
						删除院管理员
					</div>
					<br />
					<form action="Admin/del.jsp" method=post>
						<div id="count">
							账号:
							<input id="deladmin" name="deladmin" value="" />
						</div>
						<div>
							<input type="submit" id="conf" value="删除" />
						</div>
					</form>
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
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
