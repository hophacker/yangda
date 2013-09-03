package db;
import javax.servlet.http.Cookie;
import javax.servlet.ServletResponse;
public class userCookie {
	public static void setCooke(String name, String value){
		Cookie c = new Cookie(name, value);
		c.setMaxAge(7200);
		c.setPath("/");
		//ServletResponse response = new ServletResponse();
		
	}
}
