<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"
	%>
<%@ page import="java.sql.*,db.*,com.jspsmart.upload.*"%>
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
	if ("1".equals(request.getParameter("keyw1"))) {
		con.executeUpdate("update department set paper_id=-1");
		out.print("<script>alert('设置成功！');</script>");
	}
	if ("1".equals(request.getParameter("keyw2"))) {
		Num.chgNum("canDownMid", Integer.parseInt(request.getParameter("downMidVal")), con);
		out.print("<script>alert('设置成功！');</script>");
	}
	String[] dept_name = department.getNames(con);
	int canDownMid = Num.getNum("canDownMid", con);
%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
		<link href="AddSeaMid.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
	function keyWord() {
		document.getElementById("keyw").value = "" + 1;
		Form.submit();
	}
	function check() {
		if (document.getElementById("paperName").value == "") {
			alert("文件名不能为空");
			return false;
		}
		if (document.getElementById("paperDes").value == ""){
		 	alert("文件描述不能为空");
		 	return false;
		}
		if (document.getElementById("paperContent").value == "") {
			alert("未标识文件实体位置");
			return false;
		}
		return true;
	}
	function selectAll(){
		if (document.getElementById("1") == null){
			alert("题目为空！");
			return;
		}
		num = 1;
		isCheck = document.getElementById("1").checked;
		while(document.getElementById(""+num) != null){
			document.getElementById(""+num).checked = !isCheck;
			num++;
		}
	}
	function keyWord2() {
		document.getElementById("keyw2").value="1";
		document.formCanDown.submit();
	}
	function keyWord1() {
		document.getElementById("keyw1").value="1";
		if(confirm("确认重置？")){
			document.formMid.submit();
		}
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
					<div id="up">
						<%
						if (logType == 3) {
						%>
						
						
						<form name="formMid" method=post action="AddSeaMid.jsp">
								<h3 style="color:#CC00FF">该键将使所有院系获得下一个未使用中级试卷下载资格！请慎重使用该键！</h3>
								<input type="button" value="重置中级试卷下载状态" onclick="keyWord1();" />
								<input type="hidden" name="keyw1" id="keyw1" value="0" />
						</form>
						<fieldset>
							<legend>
								设定中级试卷是否可以下载
							</legend>
							<form name="formCanDown" method=post action="AddSeaMid.jsp">
								<input type="button" value="修改下载状态" onclick="keyWord2();" />
								<br />
								当前状态：
								<a><%if (canDownMid==1) out.print("可以下载"); else out.print("不可以下载");%></a>
								<input type="hidden" name='downMidVal' value=<%=1-canDownMid%> />
								<input type="hidden" name="keyw2" id="keyw2" value="0" />
							</form>
						</fieldset>
						<br/><br/>
						<br/><br/>
						<div>
							上传中级考试试卷
						</div>
						<form name="Form" method="post" action="AddSeaMid/upload.jsp"
							enctype="multipart/form-data" onsubmit="return check();">
							<table height="157" border='1'>
								<tr>
									<td width="68" height="35">
										试卷名
									</td>
									<td width="445" align="center">
										<input type=text size=20 name='paperName' id='paperName' />
									</td>
								</tr>
								<tr>
									<td height="73">
										试卷描述
									</td>
									<td align="center">
										<textarea name="paperDes" id="paperDes" cols="40" rows="3"></textarea>
									</td>
								</tr>
								<tr>
									<td height="39">
										选择试卷
									</td>
									<td align="center">
										<input type="file" name="paperContent" id="paperContent" />
									</td>
								</tr>
							</table>
							<input type="submit" id="conf" value="上传试卷" />
						</form>
						<%
						}
						%>
					</div>
					<br />
					<div id="see">
						<div>
							<h2>
								试卷
							</h2>
						</div>
						<%
							String queryS = null;
							
										//所有没有选用的试卷在数据库中用-1表示
							int paper_id = -1;
							String paper_name = null;
							String paper_des = null;
							if (logType == 3) {
						%>
						<form action="AddSeaMid/del.jsp" method="post">
							<table border=2>
								<tr>
									<th width="59">
										序号
									</th>
									<th width="75">
										试卷名
									</th>
									<th width="414">
										试卷描述
									</th>
									<th width="79">
										下载
									</th>
									<th width="74">
										删除
									</th>
								</tr>
								<%
							queryS = "select * from testPaper";
							rs = con.executeQuery(queryS);
							int num = 0;
							while (rs.next()) {
								paper_id = rs.getInt("paper_id");
								paper_name = rs.getString("paper_name");
								paper_des = rs.getString("paper_des");
								num++;
								%>
								<tr>
									<td align="center">
										<%=num%>
									</td>
									<td align="center">
										<%=paper_name%>
									</td>
									<td align="center">
										<%=paper_des%>
									</td>
									<td align="center">
										<a href="AddSeaMid/download.jsp?paper_id=<%=paper_id*12345+54321%>">下载</a>
									</td>
									<td align="center">
										<input type="checkbox" id="<%="cho" + num%>"
											name="<%="cho" + num%>" />
										<input type="hidden" name="<%=num%>" id="<%=num%>"
											value="<%=paper_id%>" />
									</td>
								</tr>
								<tr>
									<td>使用院系</td>
									<td colspan=4>
										<%=testPaper.getUseDept(rs.getString("user_info"), dept_name)%>
									</td>
								</tr>
							<%}%>
							
							</table>
							<input type="hidden" name="total" id="total" value="<%=num%>" />
							<input type="submit" id="conf2" name="conf2" value="确认删除选定试卷" />
							<%}else{
										int dept_id = Integer.parseInt(ses.get("m_dept_id"));
 										queryS = "select paper_id from department where dept_id=" + dept_id;
										rs = con.executeQuery(queryS); rs.next();
										paper_id = rs.getInt(1);
										String user_info = null;
										if (paper_id == -1) {
											queryS = "select paper_id, user_info from testPaper";
											rs = con.executeQuery(queryS);
											int[] id = new int[100];
											String[] user = new String[100];
											int total = 0;
											while(rs.next()){
												if (rs.getString("user_info").charAt(dept_id) == '0'){
													id[total] = rs.getInt("paper_id");
													user[total] = rs.getString("user_info");
													total++;
												}
											}
											if (total != 0){
												int num = new Random().nextInt(total);
												paper_id = id[num];
												user_info = user[num];
												user_info = user_info.substring(0, dept_id) + "1" + user_info.substring(dept_id+1, user_info.length());						
												con.executeUpdate("update testPaper set user_info='"
														+ user_info
														+ "' where paper_id=" + paper_id);
												con.executeUpdate("update department set paper_id="
													+ paper_id + " where dept_id=" + dept_id);
											}
										}
							if (canDownMid == 0){
								out.print("<h1>尚未开放下载，请联系校管理员。</h1>");
							}
							else if (paper_id == -1){
								out.print("<h1>当前尚无试卷可供下载，请联系校管理员。</h1>");
							}
							else {%>
							<a href="AddSeaMid/download.jsp?paper_id=<%=paper_id*12345+54321%>"
								align="center"><h1>
									下载中级考卷
								</h1>
							</a>
							<%
									}
								}	
							%>
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
