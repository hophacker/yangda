<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK" errorPage="error.jsp"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType = 0;
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (!ses.get("dxU2").equals(""))
		logType = 2;
	if (!ses.get("dxU3").equals(""))
		logType = 3;
	if (logType == 0) {
		out
		.write("<script>alert('�𾴵Ĺ���Ա,����δ��¼,���¼��');window.location.href='/Login.html'</script>");
		return;
	}
	session.setMaxInactiveInterval(7200);
%>

<%
	DBConn con = new DBConn();
	ResultSet rs;
	con.open();
	try {
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<script src="/common.js"></script>
		<script language="javascript">
		function checkOne(){
			if(trim(document.getElementById("sinque").value)=="")
		 	{
		  	alert("�ϴ���Ŀ����Ϊ��!");
				document.getElementById("sinque").focus();
				return false;
		 	}
		 	if (trim(document.getElementById("sela").value)=="" ||trim(document.getElementById("selb").value)==""||
		 			trim(document.getElementById("selc").value)==""|| trim(document.getElementById("seld").value)==""){
		 		alert("�ϴ�ѡ���Ϊ��!");
		 		return false;	
		 	}
		 	if(trim(document.getElementById("chos").value)=="")
		 	{
		  	alert("�ϴ���Ŀ��δѡ��!");
				document.getElementById("chos").focus();
				return false;
		 	} 	
		 	return true;
		}
		function check(){
			text = document.getElementById("quetext").value;			
			if(trim(text) == "" || text.indexOf("#Q", 0) == -1)
		 	{
		  	alert("�ϴ���Ŀ����Ϊ��!");
				document.getElementById("quetext").focus();
				return false;
		 	}
		 	
			pos1 = 0;
			pos = text.indexOf("#Q", 0);
			while(pos != -1){
				pos1 = text.indexOf("#", pos+2);
				if (pos1 == -1){
					alert("�ϴ���Ŀ��ʽ����: #Q��#��־��ƥ��!");
					return false;
				}
				if (pos1 == pos+2){
					alert("�ϴ���Ŀ��ʽ����: #Q�� #֮��û����Ŀ!");
					return false;
				}
				pos = pos1;
				for (i = 1; i <= 4; i++){
					pos = text.indexOf("#", pos+1);
					if (pos == -1) {
						alert("�ϴ���Ŀ��ʽ������Ŀѡ��㣡");
						return false;
					}
				}
				if (pos == text.length-1){
					alert("�ϴ���Ŀ��ʽ����#����û�д𰸣�");
					return false;
				}
					
				if (text.charAt(pos+1) != 'A' && text.charAt(pos+1) != 'B' && text.charAt(pos+1) != 'C' && text.charAt(pos+1) != 'D'){
					alert("�ϴ���Ŀ��ʽ����: #�������𰸴���,ӦΪABC��D!");
					return false;
				}
				pos = text.indexOf("#Q", pos+1);		
			}
		}
	</script>
		<link href="AddSelQue.css" rel="stylesheet" type="text/css" />
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
			<%
			if (logType == 3) {
			%>
			<div id="bod">
				<div id="bodin">
					<div id="header">
						���ѡ����
					</div>
					<div>
						<div>
							<br />
							<span class="m"> ��ӵ���ѡ���� </span>
							<form action="Question/AddSelQueOne.jsp" method="post"
								onsubmit="return checkOne();">
								<input type="radio" name="deg" id="deg" value="7" checked />
								<span class="h">����</span>

								<input type="radio" name="deg" id="deg" value="4" />
								<span class="h">������ϰ</span>
								<input type="radio" name="deg" id="deg" value="6" />
								<span class="h">�߼���ϰ</span>
								<input type="radio" name="deg" id="deg" value="1" />
								<span class="h">��������</span>
								<input type="radio" name="deg" id="deg" value="3" />
								<span class="h">�߼�����</span>
								<br />
								<span>��Ŀ</span>
								<br />
								<textarea name="sinque" cols="80" rows="3" id="sinque"></textarea>
								<br />
								<span>A:</span>
								<input type="text" id="sela" name="sela" value="" />
								<br />
								<span>B:</span>
								<input type="text" id="selb" name="selb" value="" />
								<br />
								<span>C:</span>
								<input type="text" id="selc" name="selc" value="" />
								<br />
								<span>D:</span>
								<input type="text" id="seld" name="seld" value="" />
								<br />
								<input type="radio" name="chos" id="chos" value="A" checked />
								A
								<input type="radio" name="chos" id="chos" value="B" />
								B
								<input type="radio" name="chos" id="chos" value="C" />
								C
								<input type="radio" name="chos" id="chos" value="D" />
								D
								<br />
								<input type="submit" id="conf1" value="ȷ�������ϴ�" />
							</form>
						</div>
						<br />

						<div>
							<form action="Question/AddSelQueMul.jsp" method="post"
								onsubmit="return check();">
								<span class="m"> �������ѡ���� </span>
								<br />

								<input type="radio" name="deg" id="deg" value="7" checked />
								<span class="h">����</span>
								<input type="radio" name="deg" id="deg" value="4" />
								<span class="h">������ϰ</span>
								<input type="radio" name="deg" id="deg" value="6" />
								<span class="h">�߼���ϰ</span>
								<input type="radio" name="deg" id="deg" value="1" />
								<span class="h">��������</span>
								<input type="radio" name="deg" id="deg" value="3" />
								<span class="h">�߼�����</span>
								<div>
									<div>
										<textarea tabindex="1" accesskey="1" name="quetext" cols="80"
											rows="25" id="quetext" title=""></textarea>
									</div>
									<div>
										<input type="submit" id="conf2" value="ȷ�������ϴ�" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%
			} else {
			%>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<h1 style="size:20px;color:#990000;" align="center">
				�Բ����������и�Ȩ��!
			</h1>
			<%
			}
			%>
		</div>
	</body>
</html>
<%
		} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
		con.close();
	}
%>
