/*=====================
      DBConn.java
 ====================*/

package class3.com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;



public class DBConn
{
	private static Connection dbconn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if (dbconn == null)
		{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			
			String user = "scott";
			
			String pwd = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbconn = DriverManager.getConnection(url, user, pwd);
		}
		return dbconn;
	}
	
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		if (dbconn==null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbconn = DriverManager.getConnection(url, user, pwd);
		}		
		return dbconn;		
	}
	
	// 기존에 계~~~~~~~속 사용했던 DBConn.java 에서
	// getConnection() 메소드 추가~!!!
	public static Connection getConnection(String url, String user, String pwd, String internal_logon) throws ClassNotFoundException, SQLException
	{
		if (dbconn==null)
		{
			Properties info = new Properties();
			info.put("user", user);
			info.put("pwd", pwd);
			info.put("internal_logon", internal_logon);
			
			Class.forName("orecle.jdbc.driver.OracleDriver");
			dbconn = DriverManager.getConnection(url, info);
		}
		return dbconn;
	}
	
	
	
	public static void close() throws SQLException
	{
		if (dbconn != null)
		{
			if (!dbconn.isClosed())
			{
				dbconn.close();
			}
		}
		dbconn = null;
	}
}
