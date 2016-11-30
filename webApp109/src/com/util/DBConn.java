package com.util;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.Connection;

public class DBConn
{
	// 매개변수
	private static Connection dbconn;

	// 메소드
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

	// 메소드 오버로딩
	public static Connection getConnection(String url, String user, String pwd)
	{
		try
		{
			if (dbconn == null)
			{
				Class.forName("oralce.jdbc.driver.OracleDriver");
				dbconn = DriverManager.getConnection(url, user, pwd);
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return dbconn;
	}

	// 기존에 계~~속 사용했던 DBConn.java 에서
	// getConnection() 메소드 추가!!
	// 일반 사용자의 계정으로는 접근이 불가능한 SYSDBA, SYSOFFER 로 접속이 불가능 하므로
	// 그런 형태의 옵션을 부여서해서 접속이 가능하게 끔 하려고 추가로 정의하는 메소드
	public static Connection getConnection(String url, String user, String pwd, String internal_logon)
			throws ClassNotFoundException, SQLException
	{
		if (dbconn == null)
		{
			Properties info = new Properties();

			info.put("user", user);
			info.put("pwd", pwd);
			info.put("internal_logo", internal_logon);

			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbconn = DriverManager.getConnection(url, info);
		}
		return dbconn;
	}

	// 연결종료 메소드
	public static void close() throws SQLException
	{
		if (dbconn != null)
		{
			if (!dbconn.isClosed())
				dbconn.close();

		}
		dbconn = null;
	}

}
