<%@page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	String s_user;
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('�𾴵�ѧԱ,����δ��¼,���¼��');window.location.href='/Login.html'</script>");	
		return;
	}s_user = ses.get("dxU1");
	session.setMaxInactiveInterval(10800);
%>
<%
	DBConn con = new DBConn();
	ResultSet rs;
	con.open();try{
%>
<!--
	type:
		1:��������
		2:�м�����
		3:�߼�����
		4:������ϰ
		5:�м���ϰ
		6:�߼���ϰ 
 -->
<%
	
	String endSecond = ses.get("endSecond");
	int type = Integer.parseInt(request.getParameter("type"));
	int score_type;
	if (!ses.get("score_type").equals(""))
		score_type = Integer.parseInt(ses.get("score_type"));
	else 
		score_type = 0;
	String returnS = null;
	//�жϸ�ͬѧ�Ƿ��п���
	int left_Sec = 0, end_sec = 0;
	String queryS = null;
	if ((type==1 || type==3) && type != score_type){  //���type==1 || type==3��ôtype������� score_type
		returnS = "��Ǹ��û������ԲμӵĿ��ԣ�";
	}else{
		queryS = "select end_sec from student where s_user = '" + s_user + "'";
		rs = con.executeQuery(queryS); rs.next();
		end_sec = rs.getInt("end_sec");
		int dept_id = Integer.parseInt(ses.get("dept_id"));
		session.setAttribute("dept_id", ""+dept_id);
		
		if (end_sec != -1)
			left_Sec = time.leftSecond(""+end_sec);
		else
			left_Sec = time.getLeftTimeByDeptId(type, dept_id, con);
		
		
		if (left_Sec <= 0) {
			returnS = "��Ǹ,����ʱ���ѹ���";
		}
	}
	if (end_sec > 0 && (type==4 || type==6)){
		returnS = "����ʱ��������ϰ��лл��";
	}
	//��¼���ԣ�����ѿ�
	
	if (returnS != null){
	%>
	<body bgcolor="#CFE1ED">
		<h1 style="font-size:60px; position: relative; top:300px;" align=center><%=returnS%></h1>
		 <br/>
		<center>
      <input type="button" onClick="window.close();" value='�˳�' style="font-size:30px;position: relative; top:300px;"   />
	  </center>
  </body>
	<%
	return;
	}
	if ((type == 1 || type == 3)){
		if (end_sec == -1)
			end_sec = (time.nowSecond()+left_Sec);
		queryS = "update student set score_"+score_type+"=0, end_sec=" + end_sec + ", score_type="+ (-score_type) + ", score_ans=-1 where s_user='" + s_user + "'";
		con.executeUpdate(queryS);
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="test.css" rel="stylesheet" type="text/css" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
		<script language="javaScript">
		 var   total=<%=left_Sec%>;
		function showtime ()							
		{
		    if(total<0)     //�Զ�����
			 {
					document.form1.submit();
			 }
			 if (total == 300){
			 	alert("���Ի�ʣ5���ӣ���Ͻ��ύ��");
			 }else 
			 if (total == 600){
			 	alert("���Ի�ʣ10���ӣ���Ͻ��ύ��");
			 }
			 var chour=parseInt(total/7200);
			 var cmin=parseInt(total%7200/60);
			 var csec=parseInt(total%7200%60%60);
			 var time="��ʣ��";
			 if(chour==0)
			 time+="00:";
			 else if(chour>0&&chour<10)
			 time+="0"+chour+":";
			 else
			 time+=""+chour+":";
			 
			  if(cmin==0)
			 time+="00:";
			 else if(cmin>0&&cmin<10)
			 time+="0"+cmin+":";
			 else
			 time+=""+cmin+":";
			  if(csec==0)
			 time+="00";
			 else if(csec>0&&csec<10)
			 time+="0"+csec;
			 else
			 time+=""+csec;	
			 document.clock.thetime.value = time;
			 total--;
			timerID = setTimeout("showtime()",1000);								
		}
		function queClick(num){
			document.getElementById("b"+num).style.color = "green";
		}
		function Jump(num){
			var t = "t"+num;
			document.getElementById(t).focus();
		}
		function sureFinish(){
			return confirm("��ȷ���ύ������");
		}
	window.onload=nextAd;
	</script>
<script language="javaScript">
document.oncontextmenu(){event.returnValue=false;}//��������Ҽ�
document.onkeydown() 
{ 
   //���� Alt+ ����� �� 
   //���� Alt+ ����� �� 
   alert(window.event.keyCode);
  if ((window.event.altKey)&& 
      ((window.event.keyCode==37)||   
       (window.event.keyCode==39)||
       (window.event.keyCode==9)))   
  { 
     alert("��׼��ʹ��ALT+�����ǰ���������ҳ��"); 
     event.returnValue=false; 
  }
     /* ע���⻹�������������� Alt+ ������� 
     ��Ϊ Alt+ ��������������ʱ����ס Alt �����ţ� 
     �������������������η�����ʧЧ�ˡ��Ժ��� 
     ����λ�������������� Alt ���ķ��������֪��*/

  if ((event.keyCode==116)||                 //���� F5 ˢ�¼� 
      (event.ctrlKey && event.keyCode==86) ||  //Ctrl + V 
      (event.ctrlKey && event.keyCode==67)) { //���� Ctrl+ C
     event.keyCode=0; 
     event.returnValue=false; 
     } 
		//8   �˸��
    //78  Ctrl+N
    //37  Alt+ ����� �� 
    //39  Alt+ ����� ��
    //116       F5 ˢ�¼�
    //82  Ctrl + R
    //121       shift+F10
    //115       ����Alt+F4
    //���� shift ���������¿�һ��ҳ
    if (window.event.keyCode==8
           ||event.keyCode==78
           ||event.keyCode==37
           ||event.keyCode==39
           ||event.keyCode==116
           ||event.keyCode==82
           ||event.keyCode==121
           ||event.keyCode==115
           ||(window.event.srcElement.tagName == "A" && window.event.shiftKey))
           {
                  event.keyCode=0; 
                  window.event.returnvalue=false;
           }
	  if (event.keyCode==122){event.keyCode=0;event.returnValue=false;}  //����F11 
	  if (event.ctrlKey && event.keyCode==78) event.returnValue=false;   //���� Ctrl+n 
	  if (event.shiftKey && event.keyCode==121)event.returnValue=false;  //���� shift+F10 
	  if (window.event.srcElement.tagName == "A" && window.event.shiftKey)  
	      window.event.returnValue = false;             //���� shift ���������¿�һ��ҳ 
	  if ((window.event.altKey)&&(window.event.keyCode==115))             //����Alt+F4 
	  { 
	      window.showModelessDialog("about:blank","","dialogWidth:1px;dialogheight:1px"); 
	      return false; 
	  } 
	} 
</script>
	</head>

	<body onLoad="showtime();">
		<div id="outer">
			<div id="bodyleft">
				<%
					QueJud[] queJud = Question.getJudge(type, con);
					QueSel[] queSel = Question.getSelect(type, con);
					QueAns[] queAns = Question.getAns(type, con);
					int totalJud = (queJud == null ? 0 : queJud.length);
					int totalSel = (queSel == null ? 0 : queSel.length);
					int totalAns = (queAns == null ? 0 : queAns.length);
					String ans="";
					for (int i = 0; i < totalJud; i++)
						ans += queJud[i].ans;
					for (int i = 0; i < totalSel; i++)
						ans += queSel[i].ans;
					ans = BASE.encode(ans);
					String logo = "";
					switch (type) {
						case 1 :
							logo = "������У����";
							break;
						case 3 :
							logo = "�߼���У����";
							break;
						case 4 :
							logo = "������У��ѵ";
							break;
						case 6 :
							logo = "�߼���У��ѵ";
							break;
					}
				%>
				<form action="ExamFinish.jsp" method="post" name="form1"
					onsubmit="return sureFinish();">
					<table width=760 align=center border=2>
						<tr>
							<th>
								��ӭ�μ�<%=logo%>
							</th>
						</tr>
						<%
							for (int num = 1; num <= totalJud; num++) {
						%>
						<tr align="left">
							<td>
								<table width="100%" id="t<%=num%>" name="t<%=num%>"
									bgColor=<%=(num % 2 == 1 ? "#F&FBFF" : "#ffffff")%> border="0"
									cellspacing="0" cellpadding="0">
									<tr>
										<td class=14bpx valign=top height=88>
											<b style="font-size: 14px"><%=num%>��</b><%=queJud[num - 1].que%>
											<span id="TCnt" style="font-size: 14px"></span>
										</td>
									</tr>
									<tr>
										<td
											style="font-size: 14px; height: 30px; padding-top: 8px; padding-left: 23px;"
											colspan=2 id="keySelWait1">
											<input type=radio name="<%=num%>" value='Y' id="<%=num%>"
												onclick="queClick(<%=num%>);" />
											��
											<input type=radio name="<%=num%>" value='N' id="<%=num%>"
												onclick="queClick(<%=num%>);" />
											��
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<%
							}
						%>
						<%
							for (int num = 1; num <= totalSel; num++) {
						%>
						<tr align="left">
							<td>
								<table width="100%" id="t<%=totalJud + num%>" name="t<%=totalJud + num%>"
									bgColor=<%=((num + totalJud) % 2 == 1 ? "#F&FBFF" : "#ffffff")%>
									border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class=14bpx valign=top height=88>
											<b><%=num + totalJud%>��</b><%=queSel[num - 1].que%>
											<table width="100%" border="0">
												<tr>
													<td width="3%">
														&nbsp;&nbsp;&nbsp;&nbsp;
													</td>
													<td width="3%" id="keySel80">
														<table width="100%" border="0">
															<tr>
																<td height="25">
																	<input type=radio name="<%=totalJud + num%>" value='A'
																		id="<%=totalJud + num%>"
																		onclick="queClick(<%=totalJud + num%>);" />
																</td>
															</tr>
															<tr>
																<td height="25">
																	<input type=radio name="<%=totalJud + num%>" value='B'
																		id="<%=totalJud + num%>"
																		onclick="queClick(<%=totalJud + num%>);" />
																</td>
															</tr>
															<tr>
																<td height="25">
																	<input type=radio name="<%=totalJud + num%>" value='C'
																		id="<%=totalJud + num%>"
																		onclick="queClick(<%=totalJud + num%>);" />
																</td>
															</tr>
															<tr>
																<td height="25">
																	<input type=radio name="<%=totalJud + num%>" value='D'
																		id="<%=totalJud + num%>"
																		onclick="queClick(<%=totalJud + num%>);" />
																</td>
															</tr>
														</table>
													</td>
													<td width="94%">
														<span id="TCnt" style="font-size: 14px; line-height: 190%">
															A��<%=queSel[num - 1].selA%><BR> B��<%=queSel[num - 1].selB%><BR>
															C��<%=queSel[num - 1].selC%><BR> D��<%=queSel[num - 1].selD%>
														</span>
													</td>
												</tr>
											</table>
										</td>
										<td width="1" id="TImg">
										</td>
									</tr>
									<tr>
										<td
											style="font-size: 14px; height: 30px; padding-top: 8px; display: none"
											colspan=2 id="keySelWait80"></td>
									</tr>
								</table>
							</td>
						</tr>
						<%
							}
						%>
						<%
							for (int num = 1; num <= totalAns; num++) {
							int ansNum = totalJud + totalSel + num;
						%>
						<tr align="left">
							<td>
								<input type=hidden id ="que<%=ansNum%>" name="que<%=ansNum%>" value="<%=queAns[num-1].id%>" />
								<table width="100%" id="t<%=ansNum%>" name="t<%=ansNum%>"
									bgColor=<%=((ansNum) % 2 == 1
						? "#F&FBFF"
						: "#ffffff")%>
									border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class=14bpx valign=top height=88>
											<b><%=num + totalJud + totalSel%>[���]��</b><%=queAns[num - 1].que%>
											<textarea cols="120" rows="6" name="<%=ansNum%>"
												value="" id="<%=ansNum%>"
												onclick="queClick(<%=ansNum%>);"></textarea>
										</td>
										<td width="1" id="TImg">
										</td>
									</tr>
									<tr>
										<td
											style="font-size: 14px; height: 30px; padding-top: 8px; display: none"
											colspan=2 id="keySelWait80"></td>
									</tr>
								</table>
							</td>
						</tr>
						<%
							}
						%>
						<tr align="center">
							<td>
								<input type="submit" id="ExamFinished" value="�ύ����">
							</td>
						</tr>
					</table>
					<input type="hidden" id="type" name="type" value="<%=type%>" />
					<input type="hidden" id="score_type" name="score_type" value="<%=score_type%>" />
					<input type="hidden" id="total1" name="total1" value="<%=totalJud%>" />
					<input type="hidden" id="total2" name="total2" value="<%=totalJud + totalSel%>" />
					<input type="hidden" id="total3" name="total3" value="<%=totalSel + totalJud + totalAns%>" />
					<input type="hidden" id="testId" name="testId" value="<%=ans%>" />
					<input type="hidden" id="s_user" name="s_user" value="<%=s_user%>" />
				</form>
			</div>
			<div id="bodyright">
				<div>
					<br />
					<br />
					<form name=clock>
						<input name=thetime
							style="font-size: 20pt; color: #F03; font-weight: bold; border: 0; background-color: #09F"
							size=14>
					</form>
				</div>
				<%
					String n = "";
					for (int num = 1; num <= (totalSel + totalJud + totalAns); num++) {
						if (num % 5 == 1)
							out.print("<div>");
						if (num < 10)
							n = "00" + num;
						else if (num < 100)
							n = "0" + num;
						else
							n = "" + num;
				%>
				<input type="button" value="<%=n%>" id="<%="b" + num%>" 
					name="<%="b" + num%>" onClick="return Jump(<%=num%>);" style="height=20px;width=30px;"  />
				<%
					if (num % 5 == 0 || num == totalSel + totalJud)
							out.print("</div>");
					}
				%>
			</div>
		</div>
		<script language="javascript">
			function changePos()
			{
				bodyright.style.top = document.body.scrollTop;
			}
			function start() {
				bodyright.visibility = "visible";
				interval = setInterval('changePos()', 10);
			}
			start();
		</script>
	</body>
</html>
<%
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		con.close();
	}
%>