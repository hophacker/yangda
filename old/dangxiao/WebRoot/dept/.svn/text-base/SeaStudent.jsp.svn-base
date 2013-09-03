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
        <link href="SeaStudent.css" rel="stylesheet" type="text/css" />
		<script language="javascript">
			function keyWord() {
				document.getElementById("keyw").value=""+ 1;
				Form.submit();
		
			}
			function selectOne(cho ,type){
				for (j = 0; j < 4; j++)
					document.getElementById(cho+j).checked = false;
				document.getElementById(cho+type).checked = true;
			}
			function selectAll(type){
				total = document.getElementById("total").value;
				for (i = 1; i <= total; i++){
					selectOne("cho"+i, type);
				}
			}
		</script>
	    <style type="text/css">
<!--
.STYLE1 {font-size: 9}
-->
        </style>
</head>
	<body>
		<div id="outer">
			<!--                     网页头部                   -->
		<div class="titlepic">
			<p>党校在线考试平台
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
			<!-- 网页正文 -->
      
		</div>   
             <br />
			<br />

            <div id="bod">
               <div id="bodin"><br />

				<form action="SeaStudent.jsp" method="post" name="Form">

					<span id="d">学院:</span>
					<select tabindex='8' name="dept" id="dept">
						<%
							String queryS = "select * from department";
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
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名:
					<input size='10' id="suser" name="suser" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名:
					<input size='10' id="s_name" name="s_name" />
					<input type="submit" id="conf" value="分配" onclick="keyWord();" />

					<input type="hidden" id="keyw" name="keyw" value="0" />
				</form>
				<br />

				<%
					request.setCharacterEncoding("GBK");
					String keyword = request.getParameter("keyw");
					if ("1".equals(keyword)) {
						String s_user, s_id, s_name, s_class, dept_id, dept_name;
						dept_id = request.getParameter("dept");
						s_user = request.getParameter("suser");
						s_name = request.getParameter("s_name");
						queryS = "select s_id, s_name, s_class, s_user, score_type, dept_name from student, department where student.dept_id=department.dept_id";
						int label = 0;
						if (!(dept_id.equals("0"))) 
							queryS += " and student.dept_id='" + dept_id + "'";
						if (!(s_user.equals(""))) 
							queryS += " and s_user='" + s_user + "'";
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
								姓名							</th>
							<th width="88">
								学号							</th>
							<th width="125">
								班级							</th>
							<th width="144">
								学院							</th>
							<th width="341">
								参加考试							</th>
						</tr>
						<%
							while (rs.next()) {
									s_user = rs.getString("s_user");
									s_id = rs.getString("s_id");
									s_class = rs.getString("s_class");
									s_name = rs.getString("s_name");
									dept_name = rs.getString("dept_name");
									score_type = rs.getInt("score_type");
									if (score_type < 0)
										score_type = 0;
									check[score_type] = "checked";
									num++;
						%>
						<tr>
							<td align="center"><%=s_name%></td>
							<td align="center"><%=s_id%></td>
							<td align="center"><%=s_class%></td>
							<td align="center"><%=dept_name%></td>
							<td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无
								<input type="checkbox" id="<%="cho" + num%>0"
									name="<%="cho" + num%>0" value="0" <%=check[0]%> onclick="selectOne('<%="cho" + num%>', 0);"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;初级
								<input type="checkbox" id="<%="cho" + num%>1"
									name="<%="cho" + num%>1" value="1" <%=check[1]%> onclick="selectOne('<%="cho" + num%>', 1);"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中级
								<input type="checkbox" id="<%="cho" + num%>2"
									name="<%="cho" + num%>2" value="2" <%=check[2]%> onclick="selectOne('<%="cho" + num%>', 2);"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高级
								<input type="checkbox" id="<%="cho" + num%>3"
									name="<%="cho" + num%>3" value="3" <%=check[3]%> onclick="selectOne('<%="cho" + num%>', 3);"/>
								<input type="hidden" name="<%=num%>" id="<%=num%>"
									value="<%=s_user%>" />							</td>
						</tr>
						<%
							check[score_type] = "";
								}
						%>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						  <td>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" id="selAll" value="全无" onclick="selectAll(0);" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" id="selAll" value="全初" onclick="selectAll(1);" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" id="selAll" value="全中" onclick="selectAll(2);" /> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="button" type="button" id="button" onclick="selectAll(3);" value="全高" />							</td>
						</tr>
					</table>
					<p class="titlepic">
					  <input type="hidden" name="total" id="total" value="<%=num%>" />
					  <input type="submit" id="conf2" value="确认考试分配"  />
			      </p>
				</form>

				<%
					}
					
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
