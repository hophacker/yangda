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
	<!--                     ��ҳͷ��                   -->
	    <div class="titlepic">
			<p>
				&nbsp;
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
											<a href="seaAdmin.jsp">�鿴����Ա</a>
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
					
					<li>
						<a href="ChgPwd.jsp">�޸�����</a>
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

		<!--                 ��ҳ����          -->
		<div id="outer">
			<form name="Form" action="seaAnsQue.jsp" method="post" >
				<div>
					<div>
					<div id="dept">
								<span>Ժϵ��</span>
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
					         <span>�ȼ���</span>
					         <select name="deg" id="deg">
					             <option value=1 selected="selected">����</option>
					             <option value=2>�߼�</option>
                             </select>
					    </div>
					    <input type="hidden" id="keyw" name="keyw"value="0"/>
	                    <input type="submit" id="conf" value="����" onclick="keyw();"/> 
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
						out.print("<div>�ɼ�����:</div>");
						out.print("<table><tr><th>����</th><th>�༶</th><th>�ɼ�</th></tr>");
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
				        out.print("<div>�μӿ���������"+totalstudent+"����������"+passed+"�����ʣ�"+totalscore/(passed*1.0)+"</div>");
					    
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
