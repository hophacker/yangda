<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType=0;
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	request.setCharacterEncoding("GBK");
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
	String dept_id = request.getParameter("dept_id");
	String queryS = "select s_id, s_name, s_class, s_user, score_type from student where dept_id='"
			+ dept_id + "'";
	rs = con.executeQuery(queryS);
	int num = 0, score_type;
	String s_user, s_id, s_name, s_class;
	String[] check = new String[4];
	for (int i = 0; i < 4; i ++) check[i] = "";
%>
<form action="SeaStudent/confAll.jsp" method="post">
	<table border=1>
		<tr>
			<th>
				姓名
			</th>
			<th>
				学号
			</th>
			<th>
				班级
			</th>
			<th>
				参加考试
			</th>
		</tr>
		<%
			while (rs.next()) {
				s_user = rs.getString("s_user");
				s_id = rs.getString("s_id");
				s_class = rs.getString("s_class");
				s_name = rs.getString("s_name");
				score_type = rs.getInt("score_type");
				if (score_type < 0) score_type = 0;
				check[score_type] = "checked";
				num++;
		%>
		<tr>
			<td><%=s_name%></td>
			<td><%=s_id%></td>
			<td><%=s_class%></td>
			<td>
				 	无<input type="radio" id="<%="cho"+num%>" name="<%="cho"+num%>" value="0" <%=check[0]%>/>
				初级<input type="radio" id="<%="cho"+num%>" name="<%="cho"+num%>" value="1" <%=check[1]%>/>
				中级<input type="radio" id="<%="cho"+num%>" name="<%="cho"+num%>" value="2" <%=check[2]%>/>
				高级	<input type="radio" id="<%="cho"+num%>" name="<%="cho"+num%>" value="3" <%=check[3]%>/>
						<input type="hidden" name="<%=num%>" id="<%=num%>" value="<%=s_user%>">
			</td>
		</tr>
		<%
			check[score_type] = "";
			}
		%>
	</table>
	<input type="hidden" name="total" id="total" value="<%=num%>"/>
	<input type="submit" value="确认考试分配">
</form>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>
