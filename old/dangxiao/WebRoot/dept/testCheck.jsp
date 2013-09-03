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
        <link href="testCheck.css" rel="stylesheet" type="text/css" />
		<script language="javascript">
			function keyWord() {
				document.getElementById("keyw").value=""+ 1;
				Form.submit();
		
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
			<!-- 网页正文 -->
		</div>
        <br />
		<br />


           <div id="bod">
              <div id="bodin">           
			<form action="testCheck.jsp" method="post" name="Form">

				<span>院系:</span>
				<select tabindex='8' name="dept" id="dept">
					<%
						String queryS = "select * from department";
						if (logType == 2) queryS += " where dept_id ='" + ses.get("m_dept_id") + "'";
						rs = con.executeQuery(queryS);
						while (rs.next()) {
					%>
					<option value="<%=rs.getInt(1)%>">
						<%=rs.getString(2)%>
					</option>
					<%
					}
					%>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>用户名:</span>
				<input size='10' id="suser" name="suser" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</<span>姓名:</span>
				<input size='10' id="s_name" name="s_name" />
				<input type="submit" id="conf" value="查看" onclick="keyWord();" />
				<input type="hidden" id="keyw" name="keyw" value="0" />
			</form>
			<br />
			<br />

			<%
				request.setCharacterEncoding("GBK");
				String keyword = request.getParameter("keyw");
				if ("1".equals(keyword)) {
					String s_user, s_id, s_name, s_class, dept_id, dept_name;
					int score_ans;
					dept_id = request.getParameter("dept");
					s_user = request.getParameter("suser");
					s_name = request.getParameter("s_name");
					queryS = "select distinct s_id, s_name, s_class, student.s_user, dept_name, score_ans  from student, ansQue, department where student.dept_id=department.dept_id and student.s_user=ansQue.s_user";
					if (!(dept_id.equals("0")))
						queryS += " and student.dept_id='" + dept_id + "'";
					if (!(s_user.equals("")))
						queryS += " and student.s_user='" + s_user + "'";
					if (!(s_name.equals("")))
						queryS += " and s_name='" + s_name + "'";
					rs = con.executeQuery(queryS);
					int num = 0, score_type;
					String[] check = new String[4];
					for (int i = 0; i < 4; i++)
						check[i] = "";
			%>
			<form action="SeaStudent/confAll.jsp" method="post">
				<table border=1>
					<tr>
						<th width="68">
							姓名
						</th>
						<th width="88">
							学号
						</th>
						<th width="125">
							班级
						</th>
						<th width="180">
							院系
						</th>
						<th>
							批阅情况
						</th>
						<th width="120">
							主观题批阅
						</th>
					</tr>
					<%
							while (rs.next()) {
								s_name = rs.getString("s_name");
								s_id = rs.getString("s_id");
								s_class = rs.getString("s_class");
								dept_name = rs.getString("dept_name");
								s_user = rs.getString("s_user");
								score_ans = rs.getInt("score_ans");
								num++;
					%>
					<tr>
						<td align="center">
							<%=s_name%>
						</td>
						<td align="center">
							<%=s_id%>
						</td>
						<td align="center">
							<%=s_class%>
						</td>
						<td align="center">
							<%=dept_name%>
						</td>
						<td align="center">
							<%
								if (score_ans == -1) out.print("未批阅");
								else out.print("" + score_ans + "分");
							%>
						</td>
						<td align="center">
							<input type="button"id="conf2" value="批阅"onclick="window.open('testCheck/goTestCheck.jsp?s_user=<%=s_user%>', '');" />
							</form>
						</td>
					</tr>
			<%
					}
				}
				
			%>
			
				</table>
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
