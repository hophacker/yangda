<%@page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="db.*,java.sql.*"%>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	String s_user;
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('尊敬的学员,您尚未登录,请登录！');window.location.href='/Login.html'</script>");	
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
		1:初级考试
		2:中级考试
		3:高级考试
		4:初级练习
		5:中级练习
		6:高级练习 
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
	//判断该同学是否有考试
	int left_Sec = 0, end_sec = 0;
	String queryS = null;
	if ((type==1 || type==3) && type != score_type){  //如果type==1 || type==3那么type必须等于 score_type
		returnS = "抱歉，没有你可以参加的考试！";
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
			returnS = "抱歉,考试时间已过！";
		}
	}
	if (end_sec > 0 && (type==4 || type==6)){
		returnS = "考试时不允许练习！谢谢！";
	}
	//记录考试，标记已考
	
	if (returnS != null){
	%>
	<body bgcolor="#CFE1ED">
		<h1 style="font-size:60px; position: relative; top:300px;" align=center><%=returnS%></h1>
		 <br/>
		<center>
      <input type="button" onClick="window.close();" value='退出' style="font-size:30px;position: relative; top:300px;"   />
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
		    if(total<0)     //自动交卷
			 {
					document.form1.submit();
			 }
			 if (total == 300){
			 	alert("考试还剩5分钟，请赶紧提交！");
			 }else 
			 if (total == 600){
			 	alert("考试还剩10分钟，请赶紧提交！");
			 }
			 var chour=parseInt(total/7200);
			 var cmin=parseInt(total%7200/60);
			 var csec=parseInt(total%7200%60%60);
			 var time="还剩：";
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
			return confirm("您确定提交考卷吗？");
		}
	window.onload=nextAd;
	</script>
<script language="javaScript">
document.oncontextmenu(){event.returnValue=false;}//屏蔽鼠标右键
document.onkeydown() 
{ 
   //屏蔽 Alt+ 方向键 ← 
   //屏蔽 Alt+ 方向键 → 
   alert(window.event.keyCode);
  if ((window.event.altKey)&& 
      ((window.event.keyCode==37)||   
       (window.event.keyCode==39)||
       (window.event.keyCode==9)))   
  { 
     alert("不准你使用ALT+方向键前进或后退网页！"); 
     event.returnValue=false; 
  }
     /* 注：这还不是真正地屏蔽 Alt+ 方向键， 
     因为 Alt+ 方向键弹出警告框时，按住 Alt 键不放， 
     用鼠标点掉警告框，这种屏蔽方法就失效了。以后若 
     有哪位高手有真正屏蔽 Alt 键的方法，请告知。*/

  if ((event.keyCode==116)||                 //屏蔽 F5 刷新键 
      (event.ctrlKey && event.keyCode==86) ||  //Ctrl + V 
      (event.ctrlKey && event.keyCode==67)) { //屏蔽 Ctrl+ C
     event.keyCode=0; 
     event.returnValue=false; 
     } 
		//8   退格键
    //78  Ctrl+N
    //37  Alt+ 方向键 ← 
    //39  Alt+ 方向键 →
    //116       F5 刷新键
    //82  Ctrl + R
    //121       shift+F10
    //115       屏蔽Alt+F4
    //屏蔽 shift 加鼠标左键新开一网页
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
	  if (event.keyCode==122){event.keyCode=0;event.returnValue=false;}  //屏蔽F11 
	  if (event.ctrlKey && event.keyCode==78) event.returnValue=false;   //屏蔽 Ctrl+n 
	  if (event.shiftKey && event.keyCode==121)event.returnValue=false;  //屏蔽 shift+F10 
	  if (window.event.srcElement.tagName == "A" && window.event.shiftKey)  
	      window.event.returnValue = false;             //屏蔽 shift 加鼠标左键新开一网页 
	  if ((window.event.altKey)&&(window.event.keyCode==115))             //屏蔽Alt+F4 
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
							logo = "初级党校考试";
							break;
						case 3 :
							logo = "高级党校考试";
							break;
						case 4 :
							logo = "初级党校培训";
							break;
						case 6 :
							logo = "高级党校培训";
							break;
					}
				%>
				<form action="ExamFinish.jsp" method="post" name="form1"
					onsubmit="return sureFinish();">
					<table width=760 align=center border=2>
						<tr>
							<th>
								欢迎参加<%=logo%>
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
											<b style="font-size: 14px"><%=num%>、</b><%=queJud[num - 1].que%>
											<span id="TCnt" style="font-size: 14px"></span>
										</td>
									</tr>
									<tr>
										<td
											style="font-size: 14px; height: 30px; padding-top: 8px; padding-left: 23px;"
											colspan=2 id="keySelWait1">
											<input type=radio name="<%=num%>" value='Y' id="<%=num%>"
												onclick="queClick(<%=num%>);" />
											对
											<input type=radio name="<%=num%>" value='N' id="<%=num%>"
												onclick="queClick(<%=num%>);" />
											错
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
											<b><%=num + totalJud%>、</b><%=queSel[num - 1].que%>
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
															A、<%=queSel[num - 1].selA%><BR> B、<%=queSel[num - 1].selB%><BR>
															C、<%=queSel[num - 1].selC%><BR> D、<%=queSel[num - 1].selD%>
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
											<b><%=num + totalJud + totalSel%>[解答]、</b><%=queAns[num - 1].que%>
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
								<input type="submit" id="ExamFinished" value="提交考卷">
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