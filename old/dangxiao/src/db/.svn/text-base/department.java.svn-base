package db;

import java.sql.*;

public class department {
	public static String[] getNames(DBConn con){
		String queryS = "select dept_id, dept_name from department";
		String[] names = new String[50];
		ResultSet rs = con.executeQuery(queryS);
		try{
			while (rs.next()){
				names[rs.getInt("dept_id")] = rs.getString("dept_name");
			}
			return names;
		}
		catch(SQLException ex){
			ex.printStackTrace();
			return null;
		}
	}
}
