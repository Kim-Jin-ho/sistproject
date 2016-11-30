/*====================================
	DBConn.java
	- 데이터 베이스 연결 전용 클래스
====================================*/

package class3.com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection dbConn;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		if(dbConn == null)
		{
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			String user = "scott";
			String pwd = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbConn = DriverManager.getConnection(url, user, pwd);
			
		}
		
		return dbConn;
		
	}
	
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		if(dbConn == null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbConn = DriverManager.getConnection(url, user, pwd);
			
		}
		
		return dbConn;
	}
	
	public static void close() throws SQLException
	{
		if(dbConn != null)
		{
			if(!dbConn.isClosed())
			{
				dbConn.close();
			}
			
		}
		
		dbConn = null;
	}

}
