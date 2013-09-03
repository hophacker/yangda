<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="java" import="java.util.*" pageEncoding="GBK"%>
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
<%
	String queryS = null;
	ses.setSession(session);
	String s_user = ses.get("s_user");
	queryS = "select score_type, dept_id, end_sec from student where s_user = '" + s_user + "'";
	rs = con.executeQuery(queryS); rs.next();
	int dept_id = rs.getInt("dept_id");
	int score_type =  rs.getInt("score_type");
	int end_Sec = rs.getInt("end_sec");
	
//	
	//-----------------------session--------------------------------
	//type：本次考试类型
	//score_type：可参加考试类型
	//leftSec:考试剩余时间
	int leftSec;
	session.setAttribute("dept_id", dept_id);
	if (end_Sec != -1){
		leftSec = time.leftSecond(""+end_Sec);
		if (leftSec > 0 && score_type < 0)
			score_type = -score_type;
	}
	else leftSec = time.getLeftTimeByDeptId(score_type, dept_id, con);
	session.setAttribute("score_type", score_type);
	 
	//如果有endSecond说明已经进入考试，并且提前将score_type置负值，故求反
	//-----------------------session--------------------------------
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="Exam.css" rel="stylesheet" type="text/css" />
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
			<br />
			<br />
			<div id="header">
				<form action="test.jsp" method=post>
					<input type="hidden" name="type" id="type" value="4" />
					<input type='submit' name='test' id='test' value='进入初级训练' />
				</form>
				<br/>
				<form action="test.jsp" method=post>
					<input type="hidden" name="type" id="type" value="6" />
					<input type='submit' name='test' id='test' value='进入高级训练' />
				</form>
			</div>
			<br/>
			<br/>
			<div id="info">
			</div>
			<% 
				if (score_type <= 0 || leftSec == 0) {
					out.print("<span style='font-size: 20pt; color: #F03; font-weight: bold'>抱歉，没有你可以参加的考试</span>");
					return;
				} else if (score_type == 1) {
			%>
			<div>
					<input type='button'
						style="font-size: 20pt; color: #F03; font-weight: bold; "
						name='test' id='test' value='进入党校初级考试' 
						onclick="window.open('test.jsp?type=1','bfs','fullscreen,scrollbars');"
						/>
			</div>
			<%
				} else if (score_type == 3) {
			%>
			<div>
					<input type='button'
						style="font-size: 20pt; color: #F03; font-weight: bold; border: 1"
						name='test' id='test' value='进入党校高级考试' 
						onclick="window.open('test.jsp?type=3','bfs','fullscreen,scrollbars');"
						/>
			</div>
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