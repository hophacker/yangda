<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java"  pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('�𾴵�ѧԱ,����δ��¼,���¼��');window.location.href='/Login.html'</script>");	
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
		     <!--         ��ҳͷ��     -->
		<div class="header">
			<div class="titlepic">
				<p>
                 ��У���߿���ƽ̨
				</p>
			</div>
		</div>
		<div class="menucontainer">
			<div class="menu">
				<ul>
					<li>
						<a href="PerInfo.jsp" id="SetTime" name="SetTime">��������</a>
					</li>
					<li>
						<a href="ChgPwd.jsp" id="ChgPwd" name="ChgPwd">�޸�����</a>
					</li>
					<li>
						<a href="Exam.jsp" id="SetTime" name="SetTime">�μӿ���</a>
					</li>
					<li>
						<a href="GetGoal.jsp" id="ChgPwd" name="ChgPwd">�ɼ���ѯ</a>
					</li>
					<li>
						<a href="adminInfo.jsp" id="adminInfo" name="adminInfo">����Ա֪ͨ</a>
					</li>
					<li>
						<a href="safeExit.jsp">��ȫ�˳�</a>
					</li>
				</ul>
			</div>
		</div>
		<!--        ��ҳ����    -->
      
		<div id="bod">
		   <div id="bodin">
			<div id="header">
				������ѯ
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
						out.print("����״̬:");
						out.print("<font color=red>");
						switch (score_type) {
							case 0 :
								out.print("���û�вμӹ�����");
								break;
							case 1 :
								out.print("�г������Դ���");
								break;
							case -1 :
								out.print("����μӹ���������");
								break;
							case 2 :
								out.print("���м����Դ���");
								break;
							case -2 :
								out.print("����μӹ��м�����");
								break;
							case 3 :
								out.print("�и߼����Դ���");
								break;
							case -3 :
								out.print("����μӹ��߼�����");
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
							rank_1 = "δ��Ȩ�鿴";
							rank_2 = "δ��Ȩ�鿴";
							rank_3 = "δ��Ȩ�鿴";
							rank_ans = "δ��Ȩ�鿴";
						}
						
			%>
            <br/>
			<fieldset>
				<legend>
					��ʽ���Գɼ�:
				</legend>
				<table border=1>
					<tr align="center">
						<th width="74">�ȼ�</th>
						<th width="28">����</th>
						<th width="64">Ժϵ����</th>
					</tr>
					<tr align="center">
						<td>����</td>
						<td><%=score_1%></td>
						<td><%=rank_1%></td>
					</tr>
					<tr align="center">
						<td>�м�</td>
						<td><%=score_2%></td>
						<td><%=rank_2%></td>
					</tr>
					<tr align="center">
						<td>�߼�(�͹�)</td>
						<td><%=score_3%></td>
						<td><%=rank_3%></td>
					</tr>
					<tr align="center">
						<td>�߼�(����)</td>
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
					��ϰ�ɼ�ͳ��
				</legend>
				<table border=1>
					<tr>
						<th>
							���Է���
						</th>
						<th>
							����ʱ��
						</th>
						<th>
							��������
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
									case 1: s_type = "����"; break;
									case 2: s_type = "�м�"; break;
									case 3: s_type = "�߼�"; break;
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
				<font color=red>�ܹ���ϰ����:<%=testTimes%>��</font>
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