<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"  pageEncoding="GBK"%>
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
		<link href="GetGoal.css" type="text/css" rel="stylesheet" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		 <div id="outer">
		<div>
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
				分数查询
			</div> 
			<div>
				<%
					ses.setSession(session);
					String s_user1 = ses.get("dxU1");
					String queryS = "select * from student where s_user='"
							+ s_user1 + "'";
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
						if (Num.getNum("scoreSea", con) == 1){
							rank_1 = con.getRank(dept_id, score_1, "1");
							rank_2 = con.getRank(dept_id, score_2, "2");
							rank_3 = con.getRank(dept_id, score_3, "3");
							rank_ans = con.getRank(dept_id, score_ans, "ans");
						}else{
							score_1 = -1;
							score_2 = -1;
							score_3 = -1;
							score_ans = -1;
							rank_1 = "未授权查看";
							rank_2 = "未授权查看";
							rank_3 = "未授权查看";
							rank_ans = "未授权查看";
						}
						
			%>
            <br/>
			<fieldset>
				<legend>
					正式考试成绩:
				</legend>
				<table border=1>
					<tr align="center">
						<th width="74">等级</th>
						<th width="28">分数</th>
						<th width="64">院系排名</th>
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
					练习成绩统计
				</legend>
				<table border=1>
					<tr>
						<th>
							考试分数
						</th>
						<th>
							考试时间
						</th>
						<th>
							考试类型
						</th>
					</tr>
					<%
						queryS = "select * from score where s_user='" + s_user1
									+ "' order by s_time desc";
							rs = con.executeQuery(queryS);
							int testTimes = 0;
							String s_type = null;
							
							while (rs.next()) {
								testTimes++;	
								switch(rs.getInt("s_type")){
									case 1: s_type = "初级"; break;
									case 2: s_type = "中级"; break;
									case 3: s_type = "高级"; break;
								}
					%>
					<tr>
						<td align=center><%=rs.getInt("s_score")%></td>
						<td align=center><%=rs.getString("s_time")%></td>
						<td align=center><%=s_type%></td>
					</tr>
					<%
						}
						
					%>
				</table>
				</fieldset>
				<br />
				<font color=red>总共练习次数:<%=testTimes%>次</font>
			</div>
		</div>
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