import java.io.IOException;
import java.util.Timer;

public class dxks {

	public static void main(String[] args) {
		Timer timer = new Timer();
		timer.schedule(new MyTask(), 5000, 10000);// ��1���ִ�д�����,ÿ�μ��2��,�������һ��Data����,�Ϳ�����ĳ���̶���ʱ��ִ���������.
		
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