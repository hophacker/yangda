<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK" errorPage="error.jsp"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType=0;
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (!ses.get("dxU2").equals(""))  logType = 2;
	if (!ses.get("dxU3").equals(""))  logType = 3;
	if (logType == 0){
		out.write("<script>alert('�𾴵Ĺ���Ա,����δ��¼,���¼��');window.location.href='/Login.html'</script>");	
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
		<script language="javascript">
	function keyword() {
		document.getElementById("keyw").value = "" + 1;
		Form.submit();
	}
	function keyword1() {
		document.getElementById("keyw1").value = "" + 1;
		Form1.submit();

	}
</script>
		<link href="GetGoal.css" rel="stylesheet" type="text/css" />
		<link href="Head.css" rel="stylesheet" type="text/css" />

	</head>
	<body>
   <div id="outer">
			<!--                     ��ҳͷ��                   -->
			<div class="titlepic">
				<p>
					��У���߿���ƽ̨
				</p>
			</div>
			<div class="menucontainer">
				<div class="menu">
					<ul>
						<li>
							<a>�û��趨</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="AddAdmin.jsp">��ӹ���Ա</a>
											</li>
											<li>
												<a href="DelAdmin.jsp">ɾ������Ա</a>
											</li>
											<li>
												<a href="SeaAdmin.jsp">�鿴����Ա</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>ѧԱ����</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="SeaStudent.jsp">���Է���</a>
											</li>
											<li>
												<a href="chgStudent.jsp">�鿴�޸�</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>����ά��</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="AddSelQue.jsp">���ѡ����</a>
											</li>
											<li>
												<a href="SeaSelQue.jsp">��ѯѡ����</a>
											</li>
											<li>
												<a href="AddJudQue.jsp">����ж���</a>
											</li>
											<li>
												<a href="SeaJudQue.jsp">��ѯ�ж���</a>
											</li>
											<li>
												<a href="AddAnsQue.jsp">��ӽ����</a>
											</li>
											<li>
												<a href="SeaAnsQue.jsp">�鿴�����</a>
											</li>
											<li>
												<a href="AddSeaMid.jsp">��������м��Ծ�</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>���Թ���</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="SetTime.jsp">�����趨</a>
											</li>
											<li>
												<a href="SeaTestSet.jsp">���Բ鿴</a>
											</li>
											<li>
												<a href="testCheck.jsp">�Ծ�����</a>
											</li>
											<li>
												<a href="GetGoal.jsp">�ɼ�ͳ��</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li></li>
						<li>
							<a href="ChgPwd.jsp">�޸�����</a>
						</li>
						<li>
							<a href="deptChg.jsp">ѧԺ����</a>
						</li>
						<li>
							<a href="infoBroad.jsp">��Ϣ����</a>
						</li>
						<li>
							<a href="safeExit.jsp">��ȫ�˳�</a>
						</li>
					</ul>
				</div>
			</div>
        <br />
		<br />

		<!-- -->
       <div id="bod">
         <div id="bodin">
		<fieldset>
			<legend>
				��ѧԺ�ɼ�ͳ��
			</legend>
			<form name="Form" action="GetGoal.jsp" method="post">
				&nbsp;&nbsp;&nbsp;
                <span>ѧԺ��</span>
				<select name="admindept" id="admindept">
					<%
						
						rs = con.executeQuery("select * from department where not(dept_name='��')");
						while (rs.next()) {
					%>
					<option value="<%=rs.getInt(1)%>">
						<%=rs.getString(2)%>
					</option>
					<%
						}
						
					%>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>�ȼ���</span>
				<select name="deg" id="deg">
					<option value=1 selected="selected">
						����
					</option>
					<option value=3>
						�߼�
					</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>������:</span>
				<input id="divide" name="divide" size=10 />
				<input type="hidden" id="keyw" name="keyw" value="0" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" id="conf" value="�鿴" onclick="keyword();" />
			</form>
		</fieldset>
		<fieldset>
			<legend>
				ȫУ�ɼ�ͳ��
			</legend>
			<form name="Form1" action="GetGoal.jsp" method="post">
				&nbsp;&nbsp;&nbsp;
				<span>�ȼ���</span>
				<select name="deg1" id="deg1">
					<option value=1 selected="selected">
						����
					</option>
					<option value=3>
						�߼�
					</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span>������:</span>
				<input id="divide1" name="divide1" size=10 />
				<input type="hidden" id="keyw1" name="keyw1" value="0" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" id="conf" value="�鿴" onclick="keyword1();" />
			</form>
		</fieldset>
		<br />
		<br />
		<%
			String keyword1 = request.getParameter("keyw1");
			if ("1".equals(keyword1)) {
				String deg1 = request.getParameter("deg1");
				String divide1 = request.getParameter("divide1");
				if (divide1.equals(""))
					divide1 = "0";
				String queryS = "select avg(score_"
						+ deg1
						+ ") as avgScore, dept_name from student,department where score_" + deg1 + ">=" + divide1 +  " and student.dept_id=department.dept_id group by dept_name order by avg(score_"
						+ deg1 + ") desc";
				rs = con.executeQuery(queryS);
				int num = 0;
		%>
		<table border=1>
			<tr>
				<th>
					����
				</th>
				<th>
					ѧԺ
				</th>
				<th>
					ƽ����
				</th>
			</tr>
			<%
				while (rs.next()) {
						String dept_name = rs.getString("dept_name");
						if (!dept_name.equals("��")){
							num++;
							%>
							<tr>
								<th><%=num%></th>
								<th><%=dept_name%></th>
								<th><%=rs.getInt("avgScore")%></th>
							</tr>
							<%
								}
							}
					
				}
			%>
		</table>
		<%
			String keyword = request.getParameter("keyw");
			if ("1".equals(keyword)) {
				String dept = request.getParameter("admindept");
				String deg = request.getParameter("deg");
				String divide = request.getParameter("divide");
				if (divide.equals(""))
					divide = "-1";				
					//score_type=" + (-deg) + " and
				String queryS = "select avg(score_" + deg
						+ ") from student  where  score_" 
						+  deg + ">=" + divide + " and dept_id='"
						+ dept + "'";

				rs = con.executeQuery(queryS);
				rs.next();
				double avgScore = rs.getDouble(1);
				//===== score_type=" + deg+ " and
				queryS = "select s_name, s_class, s_id, score_" + deg
						+ " from student  where  score_" + deg + ">=" + divide + " and dept_id='"
						+ dept + "'" + " order by score_" + deg + " desc";
				rs = con.executeQuery(queryS);
				int totalStu = 0;
		%>
		<table border=1>
			<tr>
				<th>
					����
				</th>
				<th>
					����
				</th>
				<th>
					ѧ��
				</th>
				<th>
					�༶
				</th>
				<th>
					�ɼ�
				</th>
			</tr>
			<%
				while (rs.next()) {
						totalStu++;
			%>
			<tr>
				<th><%=totalStu%></th>
				<th><%=rs.getString("s_name")%></th>
				<th><%=rs.getString("s_id")%></th>
				<th><%=rs.getString("s_class")%></th>
				<th><%=rs.getString("score_" + deg)%></th>
			</tr>
			<%
				}
			%>
		</table>
		<span>���������</span><%=totalStu%><br />
		<span>ƽ������:</span>
		<%=avgScore%>

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
