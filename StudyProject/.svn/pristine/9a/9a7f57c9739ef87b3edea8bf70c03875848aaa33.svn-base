package dto;
/*
	DBConn.java
	- 데이터 베이스 연결 전용 클래스
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
public class DBConn {
	
	private static Connection conn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		
		if(conn == null){
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			
			String user = "scott";
			
			String pwd = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, user, pwd);
		}
		return conn;
	}
	
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException{
		
		if(conn == null){
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, user, pwd);
			
		}
		
		return conn;
		
	}
	
	public static void close() throws SQLException{
		
		if(conn != null){
			
			if(!conn.isClosed()){
				conn.close();
			}
			
			conn = null;
			
		}
		
	}

}
