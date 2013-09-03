!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK" errorPage="error.jsp"%>
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

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<script language="javascript">

	function keyw()
	{
	 document.getElementById("keyw").value=""+1;
	 Form.submit();
	}
</script>
		<link href="SeaJudQue.css" rel="stylesheet" type="text/css" />
		<link href="Head.css" rel="stylesheet" type="text/css"/>
	</head>
	<body >
	<!--                     网页头部                   -->
	    <div class="titlepic">
			<p>
				&nbsp;
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
											<a href="seaAdmin.jsp">查看管理员</a>
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
						<a href="infoBroad.jsp">信息发布</a>
					</li>
					<li>
						<a href="safeExit.jsp">安全退出</a>
					</li>
				</ul>
			</div>
		</div>

		<!--                 网页正文          -->
		<div id="outer">
			<form name="Form" action="seaAnsQue.jsp" method="post" >
				<div>
					<div>
					<div id="dept">
								<span>院系：</span>
								<select name="admindept" id="admindept">
								<%
									rs = con.executeQuery("select * from department");
									while(rs.next()){
								 %>
									<option value="<%=rs.getInt(1)%>">
										<%=rs.getString(2)%>
									</option>
									<%}%>
								</select>
							</div>
					    <div id="degree">
					         <span>等级：</span>
					         <select name="deg" id="deg">
					             <option value=1 selected="selected">初级</option>
					             <option value=2>高级</option>
                             </select>
					    </div>
					    <input type="hidden" id="keyw" name="keyw"value="0"/>
	                    <input type="submit" id="conf" value="搜索" onclick="keyw();"/> 
						<br />
					</div>
					<ul>
						<%
						String keyword=request.getParameter("keyw");	
						   if(!("1".equals(keyword)))
						     return ;
						String  dept=request.getParameter("dept");
						String  deg=request.getParameter("deg");
						
						String  queryS = "select s_name,s_class,s_score from student,score where s_type="+deg+"and student.s_user=score.s_user and dept="+dept+"order by s_score";
						rs = con.executeQuery(queryS);
						int num = 0;
						double totalscore=0;
						int    totalstudent=0;
						int    passed=0;
						int temp;
						out.print("<div>成绩如下:</div>");
						out.print("<table><tr><th>姓名</th><th>班级</th><th>成绩</th></tr>");
						while (rs.next()) {
								out.print("<tr>");
								num++;
								totalscore++;
								totalstudent++;
								out.print("<td>"+chTr.fromOracle(rs.getString(1))+"</td>");
								out.print("<td>"+chTr.fromOracle(rs.getString(2))+"</td>");
							    	  temp=Integer.parseInt(chTr.fromOracle(""+rs.getInt(3)));
							    	  if(temp>=60)
							    	  passed++;
								out.print("<td>"+temp+"</td>");
								out.print("</tr>");
							}
				        out.print("<div>参加考试人数："+totalstudent+"及格人数："+passed+"及格率："+totalscore/(passed*1.0)+"</div>");
					    
						%>
					</ul>
				</div>
			</form>
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
