<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*,often.*"%>

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
		<link href="chgStudent.css" rel="stylesheet" type="text/css" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
		<script>
	function SeaDept() {
		var xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		var str = "chgStudent/stuInfoByDept.jsp?dept_id=" + dept.value
				+ "&s_name=" + s_name.value + "&s_user=" + s_user.value;
		xmlhttp.open("post", str, false);
		xmlhttp.send(null);
		answer.innerHTML = xmlhttp.responseText;
	}
	function keyWord() {
		document.getElementById("keyw").value = "" + 1;
		document.Form.submit();
	}
	function keyWord1() {
		document.getElementById("keyw1").value = "" + 1;
		document.Form1.submit();
	}
	function keyWord2(value) {
		document.getElementById("keyw2").value = "" + value;
		document.Form2.submit();
	}
</script>
	</head>
	<body>

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
		<br/>
		<div id="outer">
			<%
				String keyword2 = request.getParameter("keyw2");
				String queryS = null;
				String s_user2 = request.getParameter("s_user2");
				String s_class2 = request.getParameter("s_class2");
				String s_dept2 = request.getParameter("s_dept2");
				String s_id2 = request.getParameter("s_id2");
				String s_name2 = request.getParameter("s_name2");
				
				if ("1".equals(keyword2) || "2".equals(keyword2)) {
					rs = con.executeQuery("select * from student where s_user='" + s_user2 + "'");
					if (!rs.next()) {
						out.print("<script>alert('该用户名不存在')</script>");
					} else if ("1".equals(keyword2)) {
						con.deleteStudent(s_user2);
						out.print("<script>alert('删除用户成功')</script>");
					} else if ("2".equals(keyword2)) {
						queryS = "update student set";
						int sure = 0;
						if (!s_class2.equals("")) {
							queryS += " s_class='" + s_class2 + "'";
							sure = 1;
						}
						if (!s_dept2.equals("")) {
							if (sure == 1)
								queryS += ',';
							queryS += " dept_id='" + s_dept2 + "'";
							sure = 1;
						}
						if (!s_id2.equals("")) {
							if (sure == 1)
								queryS += ',';
							queryS += " s_id='" + s_id2 + "'";
							sure = 1;
						}
						if (!s_name2.equals("")) {
							if (sure == 1)
								queryS += ',';
							queryS += " s_name='" + s_name2 + "'";
							sure = 1;
						}
						if (sure == 1) {
							queryS += " where s_user='" + s_user2 + "'";
						}
						con.executeUpdate(queryS);
						out.print("<script>alert('修改用户成功')</script>");
					}
				}
			%>
			<fieldset>
				<legend>
					学员删除修改
				</legend>
				<%if (logType==3){ %>
					<form action="chgStudent/delTestScore.jsp" method="post" onsubmit="return confirm('您确认删除所有正式考试的信息吗？');">
						<input class="m"type="submit" value="清空所有正式考试成绩" />
					</form>
				<%} %>
				<br/>
				<form name="Form2" action="chgStudent.jsp" method="post">
				
					<span>姓&nbsp;&nbsp;&nbsp;名:</span>
					<input  class="l"id="s_name2" name="s_name2" size=20 />
					
					<span>学号:</span>
					<input class="l"id="s_id2" name="s_id2" size=20 />
					<span>班级:</span>
					<input class="l" id="s_class2" name="s_class2" size=20 />
					<span>院系:</span>
					<select id="s_dept2" name="s_dept2">
						<%
							queryS = "select * from department";
							if (logType == 2) queryS += " where dept_id='" + ses.get("m_dept_id") + "'";
							rs = con.executeQuery(queryS);
							while (rs.next()) {
									int dept_id = rs.getInt(1);
									String dept_name = rs.getString(2);
									if (dept_id ==0) dept_name = "全校";
										%>
										<option value="<%=dept_id%>">
											<%=dept_name%>
										</option>
										<%
								}
						%>
					</select><br />
					<span>用户名:</span>
					<input class="l"id="s_user2" name="s_user2" size=20 />
					<input type=button  class="m"value="删除" onclick="keyWord2(1);" />
					<input type=button  class="m" value="修改" onclick="keyWord2(2);" />
					<input type="hidden" id="keyw2" name="keyw2" value="" />
				</form>
			</fieldset>
			<fieldset>
				<legend>
					总体查看
				</legend>
				<form name="Form" action="chgStudent.jsp" method="post">
					<span> 院系 <select tabindex='8' id="dept" name="dept">
							<%
							queryS = "select * from department";
							if (logType == 2) queryS += " where dept_id='" + ses.get("m_dept_id") + "'";
							rs = con.executeQuery(queryS);
							while (rs.next()) {
									int dept_id = rs.getInt(1);
									String dept_name = rs.getString(2);
										%>
										<option value="<%=dept_id%>">
											<%=dept_name%>
										</option>
										<%
								}
						%>
						</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>姓名:</span> <input class="l"
							id="s_name" name="s_name" size=20 />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>用户名:</span> 
						<input class="l" id="s_user" name="s_user" size=20 /> 
							<input type=button class="m" value="检索注册和正考信息" onclick="keyWord();" /> 
							<span id="answer" />
						<input type="hidden" id="keyw" name="keyw" value="0" /> </span>
				</form>
			</fieldset>
			<fieldset>
				<legend>
					单个学员精确查看
				</legend>
				<form name="Form1" action="chgStudent.jsp" method="post">
					<span>用户名:</span>
					<input  class="l"id="s_user1" name="s_user1" size=20 />
					<input type=button class="m" value="查看该学员所有考试信息 " onclick="keyWord1();" />
					<input type="hidden" id="keyw1" name="keyw1" value="0" />
				</form>
			</fieldset>
			<br />
			<br />
			<%
				String keyword1 = request.getParameter("keyw1");
				if ("1".equals(keyword1)) {
					String s_user1 = request.getParameter("s_user1").trim();
					queryS = "select * from student where s_user='" + s_user1 + "'";
					rs = con.executeQuery(queryS);
					if (rs.next()) {
						int score_type = rs.getInt("score_type");
						String dept_id = rs.getString("dept_id");
						out.print("考试状态:");
						out.print("<font color=red>");
						switch (score_type) {
							case 0 :
								out.print("最近没有参加过考试");
								break;
							case 1 :
								out.print("有初级考试待考");
								break;
							case -1 :
								out.print("最近参加过初级考试");
								break;
							case 2 :
								out.print("有中级考试待考");
								break;
							case -2 :
								out.print("最近参加过中级考试");
								break;
							case 3 :
								out.print("有高级考试待考");
								break;
							case -3 :
								out.print("最近参加过高级考试");
								break;
						}
						out.print("</font>");
						int score_1 = rs.getInt("score_1");
						int score_2 = rs.getInt("score_2");
						int score_3 = rs.getInt("score_3");
						int score_ans = rs.getInt("score_ans");
						String rank_1, rank_2, rank_3, rank_ans;
						rank_1 = con.getRank(dept_id, score_1, "1");
						
						rank_2 = con.getRank(dept_id, score_2, "2");
						
						rank_3 = con.getRank(dept_id, score_3, "3");
						
						rank_ans = con.getRank(dept_id, score_ans, "ans");
			%>
			<br />
			<br />
			<fieldset>
				<legend>
					正式考试成绩:
				</legend>
				<table border=1>
					<tr align="center">
						<th width="66" >等级</th>
						<th width="60" >分数</th>
						<th width="89" >院系排名</th>
					</tr>
					<tr align="center">
						<td>初级</td>
						<td><%=score_1%></td>
						<td><%=rank_1%></td>
					</tr>
					<tr align="center">
						<td>中级</td>
						<td><%=score_2%></td>
						<td><%=rank_2%></td>
					</tr>
					<tr align="center">
						<td>高级(客观)</td>
						<td><%=score_3%></td>
						<td><%=rank_3%></td>
					</tr>
					<tr align="center">
						<td>高级(主观)</td>
						<td><%=score_ans%></td>
						<td><%=rank_ans%></td>
					</tr>
				</table>
				<%
					}//----------------------------------------------------- ("1".equals(keyword1)
				%>
			</fieldset>
			<br />
			<fieldset>
				<legend>
					该同学练习成绩统计
				</legend>
				<table border=1>
					<tr>
						<th width="84">
							练习分数						</th>
						<th width="129">
							练习时间						</th>
						<th width="131">
							练习类型						</th>
					</tr>
					<%
						queryS = "select * from score where s_user='" + s_user1
									+ "' order by s_time desc";
							rs = con.executeQuery(queryS);
							int testTimes = 0;
							while (rs.next()) {
								testTimes++;
								String typeS = null;
								int type = rs.getInt("s_type");
								if (type == 1) typeS = "初级";
								else typeS = "高级";
					%>
					<tr>
						<td align=center><%=rs.getInt("s_score")%></td>
						<td align=center><%=rs.getString("s_time")%></td>
						<td align=center><%=typeS%></td>
					</tr>
					<%
						}
					%>
				</table>
				<br />
				<font color=red>总共练习次数:<%=testTimes%>次</font>
				<%
					}
				%>
				<%
					String keyword = request.getParameter("keyw");
					if ("1".equals(keyword)) {
						String dept = request.getParameter("dept").trim();
						String s_name = request.getParameter("s_name").trim();
						String s_user = request.getParameter("s_user").trim();
						queryS = "select * from student,department where department.dept_id=student.dept_id ";
						if (!(dept.equals("0") && s_name.equals("") && s_user
								.equals(""))) {
							if (!dept.equals("0"))
								queryS += ("and department.dept_id='" + dept + "' ");
							if (!s_name.equals(""))
								queryS += ("and s_name='" + s_name + "' ");
							if (!s_user.equals(""))
								queryS += ("and s_user='" + s_user + "' ");
						}
						rs = con.executeQuery(queryS);
						int num = 0, score_type;
				%>
				<table border=1>
					<tr>
						<th width="42">
							姓名						</th>
						<th width="58">
							用户名						</th>
						<th width="115">
							学号						</th>
						<th width="156">
							院系						</th>
						<th width="109">
							班级						</th>
						<th width="75">
							生日						</th>
						<th width="120">
							邮箱						</th>
						<th width="64">
							成绩(初)						</th>
						<th width="66">
							成绩(中)						</th>
						<th width="66">
							成绩(高[客观])						</th>
						<th width="66">
							成绩(高[主观]))						</th>
							
					</tr>
					<%
						while (rs.next()) {
								num++;
					%>
					<tr align="center">
						<td><%=rs.getString("s_name")%></td>
						<td><%=rs.getString("s_user")%></td>
						<td><%=rs.getString("s_id")%></td>
						<td><%=rs.getString("dept_name")%></td>
						<td><%=rs.getString("s_class")%></td>
						<td><%=rs.getString("s_date_year") + "年"
								 + rs.getString("s_date_month") + "月"
								 + rs.getString("s_date_day") + "日"%></td>
						<td><%=rs.getString("s_mail")%></td>
						<td><%=transChar.score(rs.getString("score_1"))%></td>
						<td><%=transChar.score(rs.getString("score_2"))%></td>
						<td><%=transChar.score(rs.getString("score_3"))%></td>
						<td><%=transChar.score(rs.getString("score_ans"))%></td>
					</tr>
					<%
							}
						}
					%>
				</table>
			</fieldset>
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
