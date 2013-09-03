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
<%
	String dept = request.getParameter("dept_id").trim();
	String s_name = request.getParameter("s_name").trim();
	String s_user = request.getParameter("s_user").trim();
	String queryS = "select * from student,department where student.dept_name=department.dept_name ";
	if (!dept.equals("0"))
		queryS += (" dpeartment.dept_id='" + dept + "' ");
	if (!s_name.equals(""))
		queryS += (" s_name='" + s_name + "' ");
	if (!s_user.equals(""))
		queryS += (" s_user='" + s_user + "' ");
	rs = con.executeQuery(queryS);
	int num = 0, score_type;
%>
	<table border=1>
		<tr>
			<th>
				姓名
			</th>
			<th>
				用户名
			</th>
			<th>
				学号
			</th>
			<th>
				院系
			</th>
			<th>
				班级
			</th>
			<th>
				生日
			</th>
			<th>
				邮箱
			</th>
			<th>
				成绩(初)
			</th>
			<th>
				成绩(中)
			</th>
			<th>
				成绩(高)
			</th>
		</tr>
		<%
			while (rs.next()) {
				num++;
		%>
		<tr>
			<td><%=rs.getString("s_name")%></td>
			<td><%=rs.getString("s_user")%></td>
			<td><%=rs.getString("s_id")%></td>
			<td><%=rs.getString("dept_name")%></td>
			<td><%=rs.getString("s_class")%></td>
			<td><%=rs.getString("s_date_year")+"年"+rs.getString("s_date_month")+"月"+rs.getString("s_date_day")+"日"%></td>
			<td><%=rs.getString("s_mail")%></td>
			<td><%=rs.getString("score_1")%></td>
			<td><%=rs.getString("score_2")%></td>
			<td><%=rs.getString("score_3")%></td>
		</tr>
		<%
			}
		%>
	</table>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
