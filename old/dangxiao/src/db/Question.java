package db;
import java.sql.*;
import java.util.*;
public class Question {
	public static String addMulSel(String text, String deg)throws SQLException{
		
		int pos = 0, pos1 = 0;
		String que = null, ans1 = null, ans2 = null, ans3 = null, ans4 = null;
		char sel = 'A';
		pos = text.indexOf("#Q", 0);
		DBConn con = null;
		CallableStatement cs = null;
		try{
			con = new DBConn(); con.open();
			con.setAutoCommit(false);
			cs = con.prepareCall("{call add_sel(?, ?, ?, ?, ?, ?, ?)}");
			while(pos != -1){
				pos1 = text.indexOf("#", pos+2);
				que = text.substring(pos+2, pos1);
				
				pos = pos1;
				pos1 = text.indexOf("#", pos+1);
				ans1 = text.substring(pos+1, pos1);
				
				pos = pos1;
				pos1 = text.indexOf("#", pos+1);
				ans2 = text.substring(pos+1, pos1);
				
				pos = pos1;
				pos1 = text.indexOf("#", pos+1);
				ans3 = text.substring(pos+1, pos1);

				pos = pos1;
				pos1 = text.indexOf("#", pos+1);
				ans4 = text.substring(pos+1, pos1);
				
				sel = text.charAt(pos1+1);
				pos = text.indexOf("#Q", pos1+1);
				
				cs.setString(1, chTr.toOracle(que.trim()));
				cs.setString(2, chTr.toOracle(ans1.trim()));
				cs.setString(3, chTr.toOracle(ans2.trim()));
				cs.setString(4, chTr.toOracle(ans3.trim()));
				cs.setString(5, chTr.toOracle(ans4.trim()));
				cs.setString(6, chTr.toOracle(""+sel));
				cs.setString(7, deg.trim());
				cs.execute();
			}	
			con.commit();
		}catch(Exception ex){
			ex.printStackTrace();
			return "添加这批选择题失败";
		}
		finally{
			cs.close();
			con.close();
		}
		return "添加这批选择题成功";
	}
	public static String addOneSel(String ques, String selA, String selB, String selC, String selD, String ans, String deg)throws SQLException{
		DBConn con = null;
		CallableStatement cs = null;
		try{
			con = new DBConn(); con.open();
			cs = con.prepareCall("{call add_sel(?, ?, ?, ?, ?, ?, ?)}");
			cs.setString(1, chTr.toOracle(ques.trim()));
			cs.setString(2, chTr.toOracle(selA.trim()));
			cs.setString(3, chTr.toOracle(selB.trim()));
			cs.setString(4, chTr.toOracle(selC.trim()));
			cs.setString(5, chTr.toOracle(selD.trim()));
			cs.setString(6, chTr.toOracle(ans.trim()));
			cs.setString(7, deg.trim());
			cs.execute();
		}catch(Exception ex){
			ex.printStackTrace();
			return "添加这条选择题失败";
		}
		finally{
			cs.close();
			con.close();
		}
		return "添加这条选择题成功";
	}
	public static String addMulJud(String text, String deg)throws SQLException{
		int pos = 0, pos1 = 0;
		String que = null;
		char jud = 'W';
		pos = text.indexOf("#Q", 0);
		DBConn con = null;
		CallableStatement cs = null;
		try{
			con = new DBConn(); con.open();
			con.setAutoCommit(false);
			cs = con.prepareCall("{call add_jud(?, ?, ?)}");
			while(pos != -1){
				pos1 = text.indexOf("#", pos+2);
				que = text.substring(pos+2, pos1);
				
				jud = text.charAt(pos1+1);
				pos = text.indexOf("#Q", pos1+1); 
				cs.setString(1, chTr.toOracle(que.trim()));
				cs.setString(2, chTr.toOracle(""+jud));
				cs.setString(3, deg.trim());
				cs.execute();
			}	
			con.commit();
		}catch(Exception ex){
			ex.printStackTrace();
			return "添加这批选择题失败";
		}
		finally{
			cs.close();
			con.close();
		}
		return "添加这批选择题成功";
	}
	public static String addOneJud(String ques, String chos, String deg)throws SQLException{
		DBConn con = null;
		CallableStatement cs = null;
		try{
			con = new DBConn(); con.open();
			cs = con.prepareCall("{call add_jud(?, ?, ?)}"); 
			cs.setString(1, chTr.toOracle(ques.trim()));
			cs.setString(2, chTr.toOracle(""+chos));
			cs.setString(3, deg.trim());
			cs.execute();
		}	catch(Exception ex){
			ex.printStackTrace();
			return "添加这条选择题失败";
		}
		finally{
			cs.close();
			con.close();
		}
		return "添加这条选择题成功";
	}public static String addOneAns(String ques, String ans, String deg)throws SQLException{
		DBConn con = null;
		CallableStatement cs = null;
		try{
			con = new DBConn(); con.open();
			cs = con.prepareCall("{call add_ans(?, ?, ?)}"); 
			cs.setString(1, chTr.toOracle(ques.trim()));
			cs.setString(2, chTr.toOracle(ans.trim()));
			cs.setString(3, deg.trim());
			cs.execute();
		}	catch(Exception ex){
			ex.printStackTrace();
			return "添加这条解答题失败";
		}
		finally{
			cs.close();
			con.close();
		}
		return "添加这条解答题成功";
	}
	public static int[] getRanNum(ArrayList<Integer> qList, int n){
		int[] ids = new int[n];  
		int size = qList.size();
		boolean[] used = new boolean[size];
		for (int i = 0; i < size; i++) used[i] = false;
		Random random = new Random();
		int total = 0;
		int num;
		while(total < n){
			num = random.nextInt(size);
			while(used[num])
				num = random.nextInt(size);
			ids[total++] = qList.get(num);
			used[num] = true;
		}
		return ids;
	}
	public static QueSel[] getSelect(int type, DBConn con){
		ResultSet rs = null;
		ArrayList<Integer> qList = new ArrayList<Integer>();
		String cla;
		int n=0;
		if (type == 1 || type == 4) cla = "priSelNum";
		else if (type == 3 || type == 6) cla = "advSelNum"; else return null;
		//get all id
		try{
			for (int i = 0; i < 3; i++){
				rs = con.executeQuery("select num from numClass where cla='" + cla + "'");
				rs.next();
				n = rs.getInt(1);
				if (n != 0) break;
			}
			rs = con.executeQuery("select q_id from question where q_type = 'x' and q_deg='" + type + "'");
			while(rs.next())
				qList.add(new Integer(rs.getInt(1)));
			if (n > qList.size()) n = qList.size();
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}		
		//get n random id
		int[] ids = getRanNum(qList, n);
		QueSel[] queSel = new QueSel[n];
		CallableStatement cs = null;
		String que = null;
		String selA = null;
		String selB = null;
		String selC = null;
		String selD = null;
		char ans = '?';
		try{
			cs = con.prepareCall("{call get_sel(?, ?, ?, ?, ?, ?, ?)}");
			for (int i = 0; i < n; i++){
				cs.setInt(1, ids[i]);
				cs.registerOutParameter(2, Types.VARCHAR);
				cs.registerOutParameter(3, Types.VARCHAR);
				cs.registerOutParameter(4, Types.VARCHAR);
				cs.registerOutParameter(5, Types.VARCHAR);
				cs.registerOutParameter(6, Types.VARCHAR);
				cs.registerOutParameter(7, Types.VARCHAR);
				cs.execute();
				que  = cs.getString(2);
				selA = cs.getString(3);
				selB = cs.getString(4);
				selC = cs.getString(5);
				selD = cs.getString(6);
				ans = cs.getString(7).charAt(0);
				queSel[i] = new QueSel(ids[i], que, selA, selB, selC, selD, ans);	
			}
			cs.close();
		}	catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		return queSel;
	}
	public static QueAns[] getAns(int type, DBConn con){
		ResultSet rs = null;
		ArrayList<Integer> qList = new ArrayList<Integer>();
		int n=0;
		try{
			for (int i = 0; i < 3; i++){
				rs = con.executeQuery("select num from numClass where cla='ansNum'");
				rs.next();
				n = rs.getInt(1);
				if (n != 0) break;
			}
			String queryS = "select q_id from question where q_type = 'j' and q_deg='" + type + "'";
			rs = con.executeQuery(queryS);
			while(rs.next())
				qList.add(new Integer(rs.getInt(1)));
			if (n > qList.size()) n = qList.size();
		}catch(Exception ex){
			ex.printStackTrace();
		}		
		//get n random id
		int[] ids = getRanNum(qList, n);
		QueAns[] queAns = new QueAns[n];
		CallableStatement cs = null;
		String que = null;
		try{
			cs = con.prepareCall("{call get_ans(?, ?)}");
			for (int i = 0; i < n; i++){
				cs.setInt(1, ids[i]);
				cs.registerOutParameter(2, Types.VARCHAR);
				cs.execute();
				que  = cs.getString(2);
				queAns[i] = new QueAns(ids[i], que);	
			}
			cs.close();
		}	catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		return queAns;
	}
	public static QueJud[] getJudge(int type, DBConn con){
		ArrayList<Integer> qList = new ArrayList<Integer>();
		//get all id
		String cla;
		int n=0;
		if (type == 1 || type == 4) cla = "priJudNum";
		else if (type == 3 || type == 6) cla = "advJudNum"; else return null;
		try{
			ResultSet rs = con.executeQuery("select num from numClass where cla='" + cla + "'");
			rs.next();
			n = rs.getInt(1);
			rs = con.executeQuery("select q_id from question where q_type = 'p' and q_deg='" + type + "'");
			while(rs.next())
				qList.add(new Integer(rs.getInt(1)));
			if (n > qList.size()) n = qList.size();
		}catch(Exception ex){
			ex.printStackTrace();
		}		
		//get n random id
		int[] ids = getRanNum(qList, n);
		QueJud[] queJud = new QueJud[n];
		CallableStatement cs = null;
		String que = null;
		char ans = '?';
		try{
			cs = con.prepareCall("{call get_jud(?, ?, ?)}");
			for (int i = 0; i < n; i++){
				cs.setInt(1, ids[i]);
				cs.registerOutParameter(2, Types.VARCHAR);
				cs.registerOutParameter(3, Types.CHAR);
				cs.execute();
				que  = cs.getString(2);
				ans = cs.getString(3).charAt(0);
				queJud[i] = new QueJud(ids[i], que, ans);	
			}
			cs.close();
		}	catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
		return queJud;
	}
}
