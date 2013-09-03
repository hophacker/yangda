import java.io.IOException;
import java.util.Timer;

public class dxks {

	public static void main(String[] args) {
		Timer timer = new Timer();
		timer.schedule(new MyTask(), 5000, 10000);// 在1秒后执行此任务,每次间隔2秒,如果传递一个Data参数,就可以在某个固定的时间执行这个任务.
		
	}

	static class MyTask extends java.util.TimerTask {
		public void run() {
			try {
				java.io.InputStream inputStream;
	
				java.net.URL dxks = new java.net.URL("http://dxks.yzu.edu.cn/dept/welcome.jsp");
				
	
				java.net.HttpURLConnection connection = (java.net.HttpURLConnection) dxks.openConnection();
				System.out.println(connection.getContent().toString());
				
				
				
				
			} catch (Exception e) {
				try {
					//Runtime.getRuntime().exec("cmd /c start C:\\apache-tomcat-7.0.11\\bin\\shutdown.bat");
					Runtime.getRuntime().exec("cmd /c start C:\\apache-tomcat-7.0.11\\bin\\startup.bat");
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
		}
	}
}