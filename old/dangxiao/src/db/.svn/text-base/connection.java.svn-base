package db;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class connection {
	static{
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	static String url="jdbc:oracle:thin:@58.192.140.17:1521:oral"; //oral为数据库的SID
	static String user="system";
	static String password="system";
	static int round = 400;
	static int head = 0;
	static Connection[] con = new Connection[round];
	private static Connection ImConn(){
		try{
			con[head] = DriverManager.getConnection(url,user,password);
			return con[head];
		}catch(SQLException ex){
			ex.printStackTrace();
			return null;
		}
	}
	public static Connection get(int i){
		head = (head+1) % round;
		if (con[head] == null){
			return con[head] = ImConn();
		}
		try{
			if (!con[head].isClosed()){
				try{
					con[head].isValid(4);//时间控制
					con[head].close();
					return con[head] = ImConn();
				}catch(Exception ex){
					System.out.println("con[head] isNotClosed and can't close it! @connectino.java");
					return con[head] = ImConn();
				}
			}else{
				return con[head] = ImConn();
			}
		}catch(Exception ex){
			ex.printStackTrace();
			return con[head] = ImConn();
		}
	}
}
