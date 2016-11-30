package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MainDAO implements IMainSaveDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public String getSave(String nickname) throws SQLException
	{
		String result = ""; // 마일리지 담기 위한 변수
		
		Connection conn =dataSource.getConnection();
		
		String sql = "SELECT SUM(SVMONEY) AS SUM FROM SRSAVE WHERE MID = ?";

		System.out.println(sql);
		System.out.println(nickname);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, nickname);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getString("SUM");
			if (result == null)
			{
				result = "0";
			}
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public String getMid(String nickname) throws SQLException
	{
		String result = null;
		Connection conn = dataSource.getConnection();

		String sql = "SELECT MID FROM MEMBER WHERE NICKNAME = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, nickname);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result = rs.getString("MID");
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}
	
}
