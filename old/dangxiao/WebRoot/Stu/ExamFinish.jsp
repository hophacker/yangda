<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="java.sql.*,db.*,java.util.Date" %>
<%
	request.setCharacterEncoding("GBK");
	ses.setSession(session);
	if (ses.get("dxU1").equals("")){
		out.write("<script>alert('尊敬的学员,您尚未登录,请登录！');window.location.href='/Login.html'</script>");	
		return;
	}
	session.setMaxInactiveInterval(7200);
%>
<%
	DBConn con = new DBConn();
	ResultSet rs;
	String queryS = null;
	con.open();try{
%>
<%
	//score_type:允许参加的考试类型 
	//type:本次考试的类型
	String s_user = request.getParameter("s_user");
	con.setAutoCommit(false);
	int score_type = Integer.parseInt(request.getParameter("score_type"));
	int type = Integer.parseInt(request.getParameter("type"));
	//new--------------------------------------------------------------------------------------------------
	queryS = "select score_type, dept_id, end_sec from student where s_user = '" + s_user + "'";
	rs = con.executeQuery(queryS); rs.next();
	int end_Sec = rs.getInt("end_sec");
	int dept_id = rs.getInt("dept_id");
	//-----------------------session--------------------------------
	//type：本次考试类型
	//score_type：可参加考试类型
	//leftSec:考试剩余时间
	int leftSec;
	if (end_Sec != -1){
		leftSec = time.leftSecond(""+end_Sec) + 600; //+600  考试提交延迟10分钟
		if (leftSec > 0 && score_type < 0)
			score_type = -score_type;
	}
	else leftSec = time.getLeftTimeByDeptId(score_type, dept_id, con);
	//如果有endSecond说明已经进入考试，并且提前将score_type置负值，故求反
	//-----------------------session--------------------------------
	//----------------------------------------------d
	//if the time is exceed from start.
	if (type <= 3 && (score_type <= 0 || leftSec <= 0)) 
		out.print("<script>history.back();alert('您已经不能提交！');</script>");
	
	int total1 = Integer.parseInt(request.getParameter("total1"));
	int total2 = Integer.parseInt(request.getParameter("total2"));
	int total3 = Integer.parseInt(request.getParameter("total3"));
	String rightAns = BASE.decode(request.getParameter("testId"));
	
	int score = 0;
	String yourAns;
	String q_id = null;
	int selWei = Num.getNum("selWei", con);
	int judWei = Num.getNum("judWei", con);
	String retStr = "\\n错误答案:\\n";
	//计算判断题分值
	for (int i = 1; i <= total1; i++){
		yourAns = request.getParameter(""+i);
		if (yourAns ==null) yourAns = " 未选";
		if (rightAns.charAt(i-1) == yourAns.charAt(0)) score += judWei;
		else retStr+= "" + i + ". " + yourAns+"-->" + rightAns.charAt(i-1) + "\\n";
	}
	//计算选择题分值
	for (int i = total1+1; i <= total2; i++){
		yourAns = request.getParameter(""+i);
		if (yourAns ==null) yourAns = " 未选";
		if (rightAns.charAt(i-1) == yourAns.charAt(0)) score += selWei;
		else retStr+= "" + i + ". " + yourAns+"-->" + rightAns.charAt(i-1) + "\\n";
	}
	retStr = "您本次测试客观题得分为：" + score + retStr;
	//
	if (type <= 3){
		queryS = "update student set score_"+score_type+" = " + score+  ", score_type="+ (-score_type) + ", score_ans=-1, end_sec=-1 where s_user='" + s_user + "'";
		con.executeUpdate(queryS);
		session.setAttribute("score_type", "-"+score_type);
		if (type == 3){
			con.executeUpdate("delete from ansQue where s_user='" + s_user + "'");
			for (int i = total2+1; i <= total3; i++){
				yourAns = request.getParameter(""+i);
				q_id = request.getParameter("que" + i);
				queryS = "insert into ansQue (s_user, q_id, q_ans, q_score) values('" + s_user + "'," + q_id + ",'" + yourAns + "'," + -1 + ")";
				con.executeUpdate(queryS);
			}			
		}
	}else{
			Date today = new Date();
			int year = today.getYear() +1900;
			int month = today.getMonth() + 1;
			int day = today.getDate();
			String todayS = ""+year+'-'+month+'-'+day;
			rs = con.executeQuery("select * from score where s_user='" + s_user + "' and s_time='" + todayS + "'");
			if (!rs.next())
				con.executeUpdate("insert into score values('" + s_user +  "','" + todayS +  "','" + score+"','" + (type-3) + "')");
			out.print("<script language='javascript'>history.back();alert('" + retStr + "');</script>");
		}
	 
		
	//window.open('Exam/result.jsp','','menubar=0,scrollbars=1,resizable=1,width=300,height=400,left=100,top=0')
	//ody   onload= "window.opener.reload();window.opener.focus(); "> 
 %>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<script type="text/javascript">
	document.oncontextmenu(){event.returnValue=false;}//屏蔽鼠标右键
	document.onkeydown() 
	{ 
   //屏蔽 Alt+ 方向键 ← 
	   //屏蔽 Alt+ 方向键 → 
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
	    //37  Alt+ 方向键 ← 可以
	    //39  Alt+ 方向键 →
	    //116       F5 刷新键
	    //82  Ctrl + R
	    //121       shift+F10
	    //115       屏蔽Alt+F4
	    //屏蔽 shift 加鼠标左键新开一网页
	    if (window.event.keyCode==8
           ||event.keyCode==78
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
 <body bgcolor="#CFE1ED">
		<h1 style="font-size:60px; position: relative; top:300px;" align=center>提交成功！感谢参加考试！</h1>
		 <br/>
		<center>
      <input type="button" onClick="window.close();" value='退出考试' style="font-size:30px;position: relative; top:300px;"   />
	  </center>
  </body>
</html>
<%
	
		con.commit();
	}catch(Exception ex){
		ex.printStackTrace();
		con.conn.rollback();//回滚JDBC事务
		out.print("<script language='javascript'>history.back();alert(非常抱歉，数据库交互出现错误，请重新提交！);</script>");
	}finally{
		con.close();
	}
%>

