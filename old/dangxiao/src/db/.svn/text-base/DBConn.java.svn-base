package db;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
public class DBConn {
	//public DataSource pool;
	public ResultSet rs = null;
	public Statement stmt = null;
	public boolean autoCommit = true;
//	static{
//		Context env = null;
//		try{
//			env = (Context)new InitialContext().lookup("java:comp/env");
//			pool = (DataSource)env.lookup("jdbc/DBPool");
//			if (pool == null){
//				System.err.println("'DBPool' is an unknown DataSource!");
//			}
//		}catch(NamingException ne){
//			ne.printStackTrace();
//		}
//	}
	
//	public static DataSource getPool(){
//	return pool;
//}
	public Connection conn = null;
	/*
	 * <Resource
			name="jdbc/DBPool"
			auth="Container"
			type="javax.sql.DataSource"
			driverClassName="oracle.jdbc.driver.OracleDriver"
			
			url="jdbc:oracle:thin:@58.192.141.200:1521:oral"
			
			username="system"
			password="system"
			maxActive="10000"
			maxIdle="1000"
			maxWait="9000"
			minIdle="100"
			timeBetweenEvictionRunsMillis="1000"
			minEvictableIdleTimeMillis="10000"
		/>
	 */
	public void open(){
		try{
			for (int i = 0; i < 5; i++){
				conn = connection.get(i);
				if (conn != null) break;
			}
			stmt = conn.createStatement();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	public  ResultSet executeQuery(String sql){
		try{
			rs = (ResultSet)stmt.executeQuery(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return rs;
	}
	public void close(){
		try{
			if (!stmt.isClosed())
				stmt.close();
			if (!conn.isClosed())
				conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	public int executeUpdate(String sql){
		int result= 0;
		try{
			result = stmt.executeUpdate(sql);
			if (autoCommit) conn.commit();
		}catch(SQLException ex){
			ex.printStackTrace();
			return -1;
		}
		return result;
	}
	public String getRank(String dept, int score, String type){
		try{
			if (score == -1) return "没有排名";
			String queryS = "select count(*) from student where " + 
				"dept_id='" + dept+ "' and score_"+type + "  > " + score;
			ResultSet rs = executeQuery(queryS);
			rs.next();
			return ""+rs.getInt(1)+1;
		}catch(Exception ex){
			ex.printStackTrace();
			return "没有排名";
		}
	}
	public void deleteStudent(String s_user){
		executeUpdate("delete from score where s_user ='" + s_user + "'");
		executeUpdate("delete from ansQue where s_user ='" + s_user + "'");
		executeUpdate("delete from student where s_user ='" + s_user + "'");
	}
	public void commit(){
		try{
			conn.commit();
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
	public void rollback(){
		try{
			conn.rollback();
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
	public void setAutoCommit(boolean b){
		try{
			conn.setAutoCommit(b);
		}
		catch (Exception e){
			e.printStackTrace();
		}
	}
	public CallableStatement prepareCall(String s){
		try{
			return conn.prepareCall(s);
		}
		catch (Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
}

