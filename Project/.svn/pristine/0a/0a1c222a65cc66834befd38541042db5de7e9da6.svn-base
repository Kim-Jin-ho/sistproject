package class3.com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MembershipReviewsDAO implements IMembershipReviewsDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	public ArrayList<MembershipReviewsDTO> list(String saNum) throws SQLException
	{
		ArrayList<MembershipReviewsDTO> result = new ArrayList<MembershipReviewsDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT LIST, NAME, SCR, GCTNT, DT, CTNT, RCTNT, CMPNY_ID, RST_CD, PROD_CMT_CD FROM CMPNY_PROD_CMT_VIEW WHERE CMPNY_ID = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		MembershipReviewsDTO dto = null;
		
		while(rs.next())
		{
			dto = new MembershipReviewsDTO();
			dto.setList(rs.getString("LIST"));
			dto.setName(rs.getString("NAME"));
			dto.setGctnt(rs.getString("GCTNT"));
			dto.setDt(rs.getString("DT"));
			dto.setCtnt(rs.getString("CTNT"));
			dto.setRctnt(rs.getString("RCTNT"));
			dto.setRst_cd(rs.getString("RST_CD"));
			dto.setProd_cmt_cd(rs.getString("PROD_CMT_CD"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	public int updateSelect(String text, String cd) throws SQLException
	{
		
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE PROD_CMT_TBL SET RST_CD = ? WHERE PROD_CMT_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, text);
		pstmt.setString(2, cd);
		
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		
		return result;
	}
}
