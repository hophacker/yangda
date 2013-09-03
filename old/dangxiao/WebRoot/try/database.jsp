<%@page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'database.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%@page import="oracle.jdbc.driver.OracleDriver"%>
	<%@page import="java.sql.*"%>
	<%
		try{	
			out.println("d1");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			out.println("d2");
			String url = "jdbc:oracle:thin:@localhost:1521:farm";
			Connection con = DriverManager.getConnection(url, "SYSTEM", "fengjie1314");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from sm_User");
			while(rs.next()){
				out.println(" "+rs.getString(1));
				out.println("      "+rs.getString(2)+ " " + rs.getString(3));
			}
			rs.close();
			stmt.close();
			
		}catch(Exception e){
			out.print(e);
		}
	%>
  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
