
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
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
        	<link href="infoBroad.css" rel="stylesheet" type="text/css" />
		<script src="/common.js"></script>  
		<script type="text/javascript">
			function check(){
				if (document.getElementById("title").value == ""){
					 alert("标题不能为空!!");
					 return false;
				}
				if (document.getElementById("info").value == ""){
					 alert("内容不能为空!!");
					 return false;
				}
				return true;
			}
		</script>
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
        <div id="bod">
          <div id="bodin">
		<fieldset >
				<legend>
					信息发布
				</legend>
				<form action="info/add.jsp" method="post">
					<br />
					<div class="tt">通知标题</div>
					<textarea name="title" cols="80" rows="1" id="title" value=""></textarea>
					<br />
					<br />
					<div class="tt">通知正文</div>
					<textarea name="info" cols="80" rows="7" id="info" value=""></textarea>
					<br />
					<div>
						<input type="submit" name="conf" id="conf" value="添加通知" />
					</div>
					<br />
					<br />
					<br />
				</form>
			</fieldset>
			<br />
			<%
				String queryS = "select * from infoBroad order by info_date desc";
				rs = con.executeQuery(queryS);
				int num = 0;
				int info_id = 0;
			%>
			<form action="info/del.jsp" method="post" >
				<input type="submit" id="conf2" value="删除选定通知" />
				<ul >
					<%
						while (rs.next()) {
							info_id = rs.getInt(1);
							num++;
					%>
					<li>
						<input type="checkbox" name="<%=num%>" id="<%=num%>"
							value="<%=info_id%>" />
						<table border=1>
							<tr>
								<td>
									标题:
								</td>
								<td><%=rs.getString(2)%></td>
							</tr>
							<tr>
								<td>
									内容:
								</td>
								<td><%=rs.getString(3)%></td>
							</tr>
							<tr>
								<td>
									添加时间:
								</td>
								<td><%=rs.getString(4)%></td>
							</tr>
						</table>
					</li>
					<%
						}
					%>
				</ul>
				<input type='hidden' name='total' id='total' value='<%=num%>' />
			</form>
			<%
				
			%>
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
