package often;

import java.io.*;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.MatchResult;  
import java.util.regex.Matcher;  
import java.util.regex.Pattern;  
/*
 文学院
							
								
								{"文学院",
								"社会发展学院",
								"马克思主义学院",			
								"法学院",				
								"教育科学院",					
								"新闻与传媒学院",				
								"外国语学院",					
								"数学科学学院",					
								"物理科学与技术学院",						
								"化学化工学院",						
								"体育学院",						
								"机械工程学院",						
								"信息工程学院",						
								"建筑科学与工程学院",							
								"水利科学与工程学院",						
								"能源与动力工程学院",					
								"环境科学与工程学院",	
								"农学院",											
								"园艺与植物保护学院",							
								"动物科学与技术学院",						
								"兽医学院",	
								"生物科学与技术学院",									
								"医学院",						
								"商学院",						
								"旅游烹饪学院",						
								"艺术学院",							
								"广陵学院"}
							
 */


public class AutoGet {
	static String[] dept = {"", 
		"文学院",
		"社会发展学院",
		"马克思主义学院",			
		"法学院",				
		"教育科学院",					
		"新闻与传媒学院",				
		"外国语学院",					
		"数学科学学院",					
		"物理科学与技术学院",						
		"化学化工学院",						
		"体育学院",						
		"机械工程学院",						
		"信息工程学院",						
		"建筑科学与工程学院",							
		"水利科学与工程学院",						
		"能源与动力工程学院",					
		"环境科学与工程学院",	
		"农学院",											
		"园艺与植物保护学院",							
		"动物科学与技术学院",						
		"兽医学院",	
		"生物科学与技术学院",									
		"医学院",						
		"商学院",						
		"旅游烹饪学院",						
		"艺术学院",							
		"广陵学院"};
	static PrintStream o = System.out;
	public static void ddd(){ 
		for (int j = 1; j < dept.length; j++){
			String i;
			if (j < 10) i = "0"+j;
			else i = ""+j;
			o.print("<tr><td>"+dept[j] +"</td>"+
			"<td><input readonly='readonly' size=16 type=\"text\" name=\""+i+"1\" id=\""+i+"1\" value=\"<%=time["+j+']'+ "[1]%>\" /></td>"+
			"<td><input readonly='readonly' size=16 type=\"text\" name=\""+i+"2\" id=\""+i+"2\" value=\"<%=time["+j+']'+ "[2]%>\" /></td>"+
			"<td><input readonly='readonly' size=16 type=\"text\" name=\""+i+"3\" id=\""+i+"3\" value=\"<%=time["+j+']'+ "[3]%>\" /></td>"+
			"<td><input readonly='readonly' size=16 type=\"text\" name=\""+i+"4\" id=\""+i+"4\" value=\"<%=time["+j+']'+ "[4]%>\" /></td>"+
			"<td><input readonly='readonly' size=16 type=\"text\" name=\""+i+"5\" id=\""+i+"5\" value=\"<%=time["+j+']'+ "[5]%>\" /></td>"+
			"<td><input readonly='readonly' size=16 type=\"text\" name=\""+i+"6\" id=\""+i+"6\" value=\"<%=time["+j+']'+ "[6]%>\" /></td>"+
			"</tr>\n");
		}
	}
	public static void autoTime(){
		String pattern = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        // Parse a sample date starting at position 0.
        Calendar testTime = Calendar.getInstance();
        String text = "2011-8-3 22:18:00";
        testTime.setTime(sdf.parse(text, new ParsePosition(0)));
        Calendar testTime1 = Calendar.getInstance();
        String text1 = "2011-8-3 22:19:00";
        testTime1.setTime(sdf.parse(text1, new ParsePosition(0)));
        long f = testTime.getTimeInMillis()-testTime1.getTimeInMillis();
        int inter = testTime.compareTo(testTime1);
        Date now = Calendar.getInstance().getTime();
		int year=now.getYear() + 1900; 
		int month=now.getMonth()+1; 
		int day=now.getDate(); 
		int hour=now.getHours(); 
		int minute=now.getMinutes(); 
		int second=now.getSeconds();
	}
	public static void deptGet(){
		boolean[][] pos = new boolean[24][30];
		for (int i = 1; i <= 23; i++)
			for (int j = 1; j <= 29; j++)
				pos[i][j] = true;
		pos[20][6] = pos[20][7] = pos[20][8] = pos[20][9] = false;
		pos[22][6] = pos[22][7] = pos[22][8] = pos[22][9] = false;
		pos[23][6] = pos[23][7] = pos[23][8] = pos[23][9] = false;
		pos[22][16] = pos[22][17] = pos[22][18] = pos[22][19] = false;
		pos[23][16] = pos[23][17] = pos[23][18] = pos[23][19] = false;
		int num = 0;
		for (int i = 3; i <= 23; i++)
			for (int j = 1; j <= 29; j++) if (pos[i][j]){
				
				System.out.println("mobile["+num+"]=\""+i+" 排"+j+" 座\";");
				num++;
			}
	}
	
	public static void main(String[] args)throws IOException{
	
	}
}
