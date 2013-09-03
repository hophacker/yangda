package often;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class batFile {
	public static void changePattern(File file, int tab, String regex, String repStr, boolean isReplace, boolean isWrite)throws IOException{
		if (!file.isDirectory()){
			if (!file.toString().endsWith(".jsp")) return;
			String content = "";
			String readLine;
			
			BufferedReader bf = new BufferedReader(new FileReader(file));
			while(true){
				readLine = bf.readLine();
				if (readLine != null){
					content += readLine+"\n";
				}else
					break;
			}  
			bf.close();
			Matcher mat = Pattern.compile(regex, Pattern.DOTALL+Pattern.MULTILINE).matcher(content);
			StringBuffer sb = new StringBuffer();
			boolean result = mat.find();
			if(result) {
				if (isReplace)mat.appendReplacement(sb, repStr);
				System.out.print("         ");
			}else{
				System.out.print("Not Fount");
			}
			for (int j = 0; j < tab; j++) System.out.print("\t");
			System.out.println("path=" + file.getAbsolutePath());
			if (result && isWrite)
				System.out.println(mat.group());
			if (isReplace){
				mat.find();
				mat.appendTail(sb);		//调用appendTail()方法将最后一次匹配后的剩余字符串加到sb里；
				BufferedWriter bo = new BufferedWriter(new FileWriter(file));
				bo.write(sb.toString());
				bo.close();
			}
		}else{
			String[] filelist = file.list();
			for (int i = 0; i < filelist.length; i++)
				changePattern(new File(file + "/" + filelist[i]), tab+1, regex, repStr, isReplace, isWrite);
		}
			
	}
	public static void replacePattern(File file, int tab, String regex, String repStr, boolean isReplace, boolean isWrite)throws IOException{
		if (!file.isDirectory()){
			if (!file.toString().endsWith(".jsp")) return;
			String content = "";
			String readLine;
			
			BufferedReader bf = new BufferedReader(new FileReader(file));
			while(true){
				readLine = bf.readLine();
				if (readLine != null){
					content += readLine+"\n";
				}else
					break;
			}  
			bf.close();
			int t;
			if((t = content.indexOf(regex)) != -1){
				content = content.substring(0, t) + repStr + content.substring(t+regex.length(), content.length());
				System.out.print("         ");
			}else{
				System.out.print("Not Fount");
			}
			
			for (int j = 0; j < tab; j++) System.out.print("\t");
			System.out.println("path=" + file.getAbsolutePath());
			if (isReplace){
				BufferedWriter bo = new BufferedWriter(new FileWriter(file));
				bo.write(content);
				bo.close();
			}
		}else{
			String[] filelist = file.list();
			for (int i = 0; i < filelist.length; i++)
				replacePattern(new File(file + "/" + filelist[i]), tab+1, regex, repStr, isReplace, isWrite);
		}
			
	}
		
	public static void main(String[] args)throws IOException{
		//String regex = "^<%\n\tses[\\x00-\\xff\\u0000-\\uffff\n]*[(3600)]{1};\n%>$";
		//String regex="^<%=11%>$";
		//String regex = "pageEncoding=\"GBK\"";
		//String regex = "^<%%>$";
		String regex = "添加查看中级考卷";
		//String regex = "dxU2\"[)]*[.]+equals"; 
		String repStr = "添加下载中级试卷";
		File file = new File("H:/MyWorkspace/dangxiao/WebRoot/dept");
		//(file, tab, regex, repStr, isReplace, isWrite)
		replacePattern(file, 0, regex, repStr, true, false);
		//changePattern(file, 0, regex, repStr, true, false);
	}
}
