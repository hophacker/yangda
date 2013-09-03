package often;
import java.io.*;
public class transChar {
	public static void main(String[] args)throws IOException{
		InputStreamReader in = new InputStreamReader(System.in);
		OutputStreamWriter out = new OutputStreamWriter(System.out);
		int readI;
		char readC;
		String retS = "";
		while((readI = in.read())!=-1){
			readC = (char)readI;
			switch (readC){			
			case '"':{retS += "\\\""; break;}
			case '\r':{break;}//retS += "\\r"; 
			case '\t':{retS += "\\t"; break;}
			case '\n':{retS += "\\n"; break;}
			case '\\':{retS += "\\"; break;}
			default:{retS += readC; break;}
			}
		}
		out.write(retS);
		out.close();
	}
	public static String score(String s){
		if (s.equals("-1")) return "未考";
		else return s;
	}
}
