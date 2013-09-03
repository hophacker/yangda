package db;
import java.sql.*;
import java.util.Scanner;
public class ControlOracle {
	public static void main(String[] args){
		DBConn con = new DBConn();
		con.open();
		Scanner cin = new Scanner(System.in);
		String queryS = null;
		String chose = null;
		while(true){
			chose = cin.nextLine();
			try{
				if (chose.equals("u")){
					queryS = cin.nextLine();
					con.executeUpdate(queryS);
				}else if(chose.equals("q")){
					queryS = cin.nextLine();
					ResultSet rs = con.executeQuery(queryS);
					
					while(rs.next()){
						for (int i = 1;; i++){
							try{
								System.out.print(rs.getString(i)+"\t");
							}catch(Exception ex){
								break;
							}
						}
						System.out.println();
					}
				}else if(chose.equals("exit")){
					break;
				}
				System.out.println("OK");
			}catch(Exception e){
				System.out.println("Bad!!");
			}
		}
		con.close();
	}
}
