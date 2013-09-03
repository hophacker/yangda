package db;

import java.text.ParsePosition;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class time {
	public static long getLeftSeconds(String begin, long validSec){
		try{
			Calendar now = Calendar.getInstance();
			Calendar testBegin = Calendar.getInstance();
			String pattern = "yyyy-MM-dd HH:mm";
	        // Parse a sample date starting at position 0.
	        testBegin.setTime(new SimpleDateFormat(pattern).parse(begin.trim(), new ParsePosition(0)));
	        
	        if (now.before(testBegin))
	        	return 0;
	        else{
	        	long seconds = (now.getTimeInMillis()-testBegin.getTimeInMillis())/1000;
	        	return validSec-seconds;
	        }
	        
		}catch(Exception ex){
			return 0;
		}
	}
	public static long getLeftTime(String[] begin, int validHour){
		long maxTime = 0;
		long time = 0;
		for (int i = 0; i < begin.length; i++){
			time = getLeftSeconds(begin[i], validHour*60*60);
			if (time > maxTime) maxTime = time;
		}
		return maxTime;
	}
	public static int nowSecond(){
		return (int)(Calendar.getInstance().getTimeInMillis()/1000);
	}
	public static int leftSecond(String endTime){
		if (endTime.equals("")) return -1;//��һ�ν��뿼��
		int endSec = Integer.parseInt(endTime);
		int nowSec = (int)(Calendar.getInstance().getTimeInMillis()/1000);
		if (endSec-nowSec == -1) return -2;
		return endSec-nowSec;//ʣ��ʱ��
	}
	public static int getLeftTimeByDeptId(int type, int dept_id, DBConn con){
		//1,3����   4,6��ϰ
		String queS = "select * from test_time where dept_id=" + dept_id;
		String queS1 = "select num from numClass where cla='validTime'";
		try{
			ResultSet rs = con.executeQuery(queS);
			rs.next();
	    	String[] test_begin = new String[3];
	    	
	    	int test_inter = 0;
	    	if (type == 1 || type == 4){
    			test_inter = Integer.parseInt(rs.getString("pri_inter").trim());
	    		for (int i = 1; i <= 3; i++){
	    			test_begin[i-1] = rs.getString("pri_begin_" + i);
	    		}
	    	}else 
	    	if (type == 3 || type == 6){
    			test_inter = Integer.parseInt(rs.getString("adv_inter").trim());
	    		for (int i = 1; i <= 3; i++){
	    			test_begin[i-1] = rs.getString("adv_begin_" + i);
	    		}
	    	}else
	    		return 0;//������������?�Ի�����ϰ
	    	if (type ==4 || type == 6)
	    		return test_inter * 60;//������ϰ��ֱ�ӷ���ʱ��
	    	
	    	rs = con.executeQuery(queS1);
	    	rs.next();
	    	int validTime = rs.getInt(1);
	    	if ((int)time.getLeftTime(test_begin, validTime) > 0)
	    		return test_inter * 60;
	    	else 
	    		return 0;
		}catch (Exception ex){
			ex.printStackTrace();
			return 0;
		}	
	}
}
