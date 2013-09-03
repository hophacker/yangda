<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="GBK" errorPage="error.jsp"%>
<%@page import="db.*,java.sql.*"%>
<%
	int logType=0;
	request.setCharacterEncoding("GBK");
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
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<script language="javascript">
	        function selectAll() {
		if (document.getElementById("1") == null) {
			alert("题目为空！");
			return;
		}
		num = 1;
		isCheck = document.getElementById("1").checked;
		while (document.getElementById("" + num) != null) {
			document.getElementById("" + num).checked = !isCheck;
			num++;
		}
	}
	        function check() {
		if (document.getElementById("1") == null) {
			alert("题目为空！");
			return false;
		} else {
			num = 1;
			isCheck = document.getElementById("1").checked;
			while (document.getElementById("" + num) != null) {
				if (document.getElementById("" + num).checked == true)
					return true;
				num++;
			}
			alert("您尚未选中题目！");
			return false;
		}
	}
	        function keyWord() {
		document.getElementById("keyw").value = "" + 1;
		Form.submit();
	}
        </script>
		<link href="SeaSelQue.css" rel="stylesheet" type="text/css" />
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

		<!--                 网页正文          -->
			<%
				request.setCharacterEncoding("GBK");
				String queryS = "select q_text, q_choose, q_id, q_A, q_B, q_C, q_D from question where q_type='x'";
				String keyword = request.getParameter("keyw");
				if ("1".equals(keyword)){
					String deg = request.getParameter("deg");
					if (!deg.equals("0")) queryS += ("and q_deg='" + deg + "'");
					String seaKey = request.getParameter("seaKey");
					if (!seaKey.trim().equals(""))
							queryS += " and q_text like '%" + seaKey
									+ "%' order by q_id desc";
					else
							queryS += "order by q_id desc";
				}	
			%>
            <br />
			<br />

            <div id="bod">
             <div id="bodin">
			<div id="header">
				查询删除选择题
			</div>
			<br/>
			<form name="Form" action="SeaSelQue.jsp" method="post">
				<input type="text" id="seaKey" name="seaKey" value="" />
				<input type="hidden" id="keyw" name="keyw" value="0" />
				<input type="radio" name="deg" id="deg" value="0" checked /><span class="h">全部</span>
				<input type="radio" name="deg" id="deg" value="7" /><span class="h">备用</span>
				<input type="radio" name="deg" id="deg" value="4"  /><span class="h">初级练习</span>
				<input type="radio" name="deg" id="deg" value="6" /><span class="h">高级练习</span>
				<input type="radio" name="deg" id="deg" value="1"  /><span class="h">初级考试</span>
				<input type="radio" name="deg" id="deg" value="3" /><span class="h">高级考试</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" id="conf" value="关键词搜索" onclick="keyWord();" />
			</form>
			<br/>
			<form action="delSelQue.jsp" method="post" onsubmit="return check();">
				<div>
					<div>
						<input type="submit" id="del" value="删除选中题目" />
						<input type="button" id="selAll" value="全选" onclick="selectAll();" />
					</div>
					<ul>
					
					<% 
	      		 rs = con.executeQuery(queryS);
	      		 int num = 0;
	      		 int q_id = 0;
	      %>

						<% 
      		String choose = "";
      		 while(rs.next()){
      		 		q_id = rs.getInt(3);
      		 		out.print("<li>");
      		 		num++;
      		 		out.print("<input type=\"checkbox\" name=" + num + " id=" + num + " value='" + q_id + "'/>");
      		 		out.print("" + num + "." + chTr.fromOracle(rs.getString(1)) + "<br>");
      		 		out.print("<ul>");
      		 		choose = chTr.fromOracle(rs.getString(2));
      		 		for (int i = 4; i <= 7; i++){
      		 			out.print("<li>");
      		 			String ch = "" + (char)('A'+(i-4));
	      		 		if (ch.equals(choose)) out.print("<font color='red'>");
	      		 		out.print(ch+".");
	      		 		out.print(chTr.fromOracle(rs.getString(i)));
	      		 		if (ch.equals(choose)) out.print("</font>");
	      		 		out.print("</li>");
      		 		}
      		 		out.print("</ul>");
      		 		out.print("</li>");
      		 }
      		 out.print("<input type='hidden' name='total' id='total' value='" + num + "'/>");
      		 
	       %>
					</ul>
				</div>
			</form>
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
