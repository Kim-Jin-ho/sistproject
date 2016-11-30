package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class SaveDao implements ISaveDao
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public String getSave(String nickName) throws SQLException
	{
		String result = "";

		Connection conn = dataSource.getConnection();

		String sql = "SELECT SUM(SVMONEY) AS SUM FROM SRSAVE WHERE MID = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, nickName);

		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getString("SUM");
		}
		
		pstmt.close();
		conn.close();
		rs.close();

		return result;
	}
	
}
