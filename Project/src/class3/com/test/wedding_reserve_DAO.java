package class3.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class wedding_reserve_DAO implements Iwedding_reserve_DAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public wedding_reserve_DTO reserveList() throws SQLException
	{
		wedding_reserve_DTO  result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT USR_ID, NAME, TEL, EMAIL, CTNT"
				  + " FROM USR_VIEW"
				  + " WHERE CMPNY_CTGY_ID = '1'"
				  + "  AND CMPNY_ID = '1111111111'"
				  + "  AND PROD_CD = '1'"
				  + "  AND USR_ID = 'KHT'";
		
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = new wedding_reserve_DTO();
			
			result.setUsrId(rs.getString("USR_ID"));
			result.setUsrName(rs.getString("NAME"));
			result.setUsrTel(rs.getString("TEL"));
			result.setUsrEmail(rs.getString("EMAIL"));
			result.setGndr(rs.getString("CTNT"));
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
}















