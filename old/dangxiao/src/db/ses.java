package db;
import javax.servlet.http.HttpSession;
public class ses {
	private static HttpSession session = null;
	public static void setSession(HttpSession ses){
		session  = ses;
	}
	public static String get(String attribute){
		if (session.getAttribute(attribute) == null) 
			return "";
		else return  session.getAttribute(attribute).toString();
	}
}
