<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType=0;
	request.setCharacterEncoding("gb2312");
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
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	String s_user = request.getParameter("s_user");
	rs = con.executeQuery("select s_name from student where s_user='" +  s_user + "'"); rs.next();
	String s_name = rs.getString("s_name"); 
	String keyword = request.getParameter("keyw");
	String queryS = null;
	if ("1".equals(keyword)) {
		int total = Integer.parseInt(request.getParameter("total"));
		int totalScore = 0;
		int q_score;
		int q_id;
		for (int i = 1; i <= total; i++) {
			q_id =  Integer.parseInt(request.getParameter(""+i));
			q_score = Integer.parseInt(request.getParameter("score"+i));
			queryS = "update ansQue set q_score=" + q_score + "  where q_id=" + q_id + " and s_user='" + s_user + "'";
			con.executeUpdate(queryS);
			totalScore += q_score;
		}
		queryS = "update student set score_ans=" + totalScore + " where s_user='" + s_user +  "'";
		con.executeUpdate(queryS);
		out.print("<script>alert('批改成功')</script>");
	}
%>
<%
	queryS = "select question.q_id, q_ans, q_score, q_text, q_A from ansQue,question where s_user='"
			+ s_user + "' and question.q_id=ansQue.q_id";
	rs = con.executeQuery(queryS);
	String q_ans = null, q_text = null, q_right = null, q_score = null;
	int q_id, num = 0;
%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<script language="javascript">
			function check() {	
				var reg = /^[0-9]{1,3}$/i;
				total = document.getElementById("total").value;
				for (i = 1; i <= total; i++)
					if (!reg.test(document.getElementById("score"+i).value)){
					  alert("对不起您输入的分数有误，请查看:\n1、是否有未输入的分数\n2、是否全是数字");
					 	return false;
					}
				document.getElementById("keyw").value="1";	
				return true;
			}
		</script>
	</head>
	<body  bgcolor="#CFE1ED">
	<p style="color:#FF6633" align="center">
		注意：<br/>
		1.分数需以1至3位数字给出。<br/>
		2.需将考生的每条题目分数给出，否则无法提交。<br/><br/>
	</p>
		<h1 align="center">姓名:  <%=s_name%></h1>
		<form action="goTestCheck.jsp" method=post onsubmit="return check();">
			<%
			while (rs.next()) {
				num++;
				q_id = rs.getInt("q_id");
				q_ans = rs.getString("q_ans");
				int score = rs.getInt("q_score");
				if (score == -1)
					q_score = "未判分";
				else
					q_score = "" + score;
				q_text = rs.getString("q_text");
				q_right = rs.getString("q_A");
		%>
			<table width="972" border=1 align="center">
				<tr>
					<td width="59">
						题目					</td>
					<td width="886">
						<%=q_text%>
				  </td>
				</tr>
				<tr>
					<td>
						考生答案
					</td>
					<td>
						<%=q_ans%>
					</td>
				</tr>
				<tr>
					<td>
						参考答案
					</td>
					<td>
						<%=q_right%>
					</td>
				</tr>
				<tr>
					<td>
						判分
					</td>
					<td>
						<input size='10' name="score<%=num%>" id="score<%=num%>" value="<%=q_score%>" />
					</td>
				</tr>
		  </table>
			<input type="hidden" name="<%=num%>" id="<%=num%>" value="<%=q_id%>" />
			<br/><br/>
			<%
			}
			
			%>
			<input type="hidden" name="total" id="total" value="<%=num%>" />
			<input type="hidden" name="keyw" id="keyw" value="0" />
			<input type="hidden" name="s_user" id="s_user" value="<%=s_user%>" />
			<input type="hidden" name="s_name" id="s_name" value="<%=s_name%>" />
		    <p align="center" style="border-bottom-color:#009999; " >
				<input name="submit"   style=" color:#990033; font-size:36px; font-weight:800" type="submit" id="conf" value="提交批改" />
			</p>
		</form>
	</body>
</html>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
