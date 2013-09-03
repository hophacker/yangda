<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK"
	errorPage="error.jsp"%>
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
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<script src="/common.js"></script>
		<script language="javascript">
		function checkOneJud(){
			if(trim(document.getElementById("sinque").value)=="")
		 	{
		  	alert("上传题目不能为空!");
				document.getElementById("sinque").focus();
				return false;
		 	}
		 	if(trim(document.getElementById("chos").value)=="")
		 	{
		  	alert("上传题目答案未选择!");
				document.getElementById("chos").focus();
				return false;
		 	}
		 	return true;
		}
		function checkJud(){
			text = document.getElementById("quetext").value;
			if(trim(text) == "" || text.indexOf("#Q", 0) == -1)
		 	{
		  	alert("上传题目不能为空!");
				document.getElementById("quetext").focus();
				return false;
		 	}
			pos1 = 0;
			pos = text.indexOf("#Q", 0);
			while(pos != -1){
				pos1 = text.indexOf("#", pos+2);
				if (pos1 == -1){
					alert("上传题目格式错误: #Q与#标志不匹配!");
					return false;
				}
				if (pos1 == pos+2){
					alert("上传题目格式错误: #Q与 #之间没有题目!");
					return false;
				}
				if (pos1 == text.length-1){
					alert("上传题目格式错误: #后面没有答案!");
				}
				if (text.charAt(pos1+1) != 'Y' && text.charAt(pos1+1) != 'N'){
					alert("上传题目格式错误: #后面后面答案错误,应为Y或N!");
					return false;
				}
				pos = text.indexOf("#Q", pos+1);		
			}
		}
	</script>
		<link href="AddJudQue.css" rel="stylesheet" type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<link href="AddJudQue.css" rel="stylesheet" type="text/css" />
		<link href="Head.css" rel="stylesheet" type="text/css" />
	</head>
	<body>

		<div id="outer">
			<!--                     网页头部                   -->
			<div class="titlepic">
				<p>
					党校在线考试平台
				</p>
			</div>
			<div class="menucontainer">
				<div class="menu">
					<ul>
						<li>
							<a>用户设定</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="AddAdmin.jsp">添加管理员</a>
											</li>
											<li>
												<a href="DelAdmin.jsp">删除管理员</a>
											</li>
											<li>
												<a href="SeaAdmin.jsp">查看管理员</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>学员管理</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="SeaStudent.jsp">考试分配</a>
											</li>
											<li>
												<a href="chgStudent.jsp">查看修改</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>试题维护</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="AddSelQue.jsp">添加选择题</a>
											</li>
											<li>
												<a href="SeaSelQue.jsp">查询选择题</a>
											</li>
											<li>
												<a href="AddJudQue.jsp">添加判断题</a>
											</li>
											<li>
												<a href="SeaJudQue.jsp">查询判断题</a>
											</li>
											<li>
												<a href="AddAnsQue.jsp">添加解答题</a>
											</li>
											<li>
												<a href="SeaAnsQue.jsp">查看解答题</a>
											</li>
											<li>
												<a href="AddSeaMid.jsp">添加下载中级试卷</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li>
							<a>考试管理</a>
							<table>
								<tr>
									<td>
										<ul>
											<li>
												<a href="SetTime.jsp">考试设定</a>
											</li>
											<li>
												<a href="SeaTestSet.jsp">考试查看</a>
											</li>
											<li>
												<a href="testCheck.jsp">试卷批阅</a>
											</li>
											<li>
												<a href="GetGoal.jsp">成绩统计</a>
											</li>
										</ul>
									</td>
								</tr>
							</table>
						</li>
						<li></li>
						<li>
							<a href="ChgPwd.jsp">修改密码</a>
						</li>
						<li>
							<a href="deptChg.jsp">学院更改</a>
						</li>
						<li>
							<a href="infoBroad.jsp">信息发布</a>
						</li>
						<li>
							<a href="safeExit.jsp">安全退出</a>
						</li>
					</ul>
				</div>
			</div>
			<br />
			<br />
			<%if (logType==3){%>
			<div id="bod">
				<div id="bodin">
					<div id="header">
						添加判断题
					</div>
					<div>
						<div>
							<br />
							<span class="m">添加单个判断题</span>
							<form action="Question/AddJudQueOne.jsp"
								onsubmit="return checkOneJud();" method="post">
								<input type="radio" name="deg" id="deg" value="7" checked />
								<span class="h">备用</span>
								<input type="radio" name="deg" id="deg" value="4" />
								<span class="h">初级练习</span>
								<input type="radio" name="deg" id="deg" value="6" />
								<span class="h">高级练习</span>
								<input type="radio" name="deg" id="deg" value="1" />
								<span class="h">初级考试</span>
								<input type="radio" name="deg" id="deg" value="3" />
								<span class="h">高级考试</span>



								<div>
									<span>题目</span>
								</div>
								<textarea name="sinque" cols="80" rows="3" id="sinque" value=""></textarea>
								<br />
								<input type="radio" name="chos" id="chos" value="Y" />
								<span class="h">对</span>
								<input type="radio" name="chos" id="chos" value="N" />
								<span class="h">错</span>
								<br />
								<div>
									<input type="submit" name="conf1" id="conf1" value="确认单个上传" />
								</div>
							</form>
						</div>
						<div>
							<br />
							<br />
							<form action="Question/AddJudQueMul.jsp"
								onsubmit="return checkJud();" method="post">
								<span class="m">批量添加</span>
								<div>

									<input type="radio" name="deg" id="deg" value="7" checked />
									<span class="h">备用</span>
									<input type="radio" name="deg" id="deg" value="4" />
									<span class="h">初级练习</span>
									<input type="radio" name="deg" id="deg" value="6" />
									<span class="h">高级练习</span>
									<input type="radio" name="deg" id="deg" value="1" />
									<span class="h">初级考试</span>
									<input type="radio" name="deg" id="deg" value="3" />
									<span class="h">高级考试</span>
								</div>
								<div>
									<div>
										<textarea tabindex="1" accesskey="1" name="quetext" cols="80"
											rows="25" id="quetext" title="" value=""></textarea>
									</div>
									<div>
										<input type="submit" name="conf2" id="conf2" value="确认批量上传" />
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<%}else{
			%>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<h1 style="size:20px;color:#990000;" align="center">
				对不起，您不具有该权限!
			</h1>
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
