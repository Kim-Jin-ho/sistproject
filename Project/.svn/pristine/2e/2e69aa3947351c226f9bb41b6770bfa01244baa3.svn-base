package class3.com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MembershipConsultingDAO implements IMembershipConsultingDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	public ArrayList<MembershipConsultingDTO> list(String saNum) throws SQLException
	{
		ArrayList<MembershipConsultingDTO> result = new ArrayList<MembershipConsultingDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NAME, LIST, GCTNT, DT, CTNT, RCTNT, ADV_CD FROM CMPNY_ADV_VIEW WHERE CMPNY_ID = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		MembershipConsultingDTO dto = null;
		
		while(rs.next())
		{
			dto = new MembershipConsultingDTO();
			dto.setList(rs.getString("LIST"));
			dto.setName(rs.getString("NAME"));
			dto.setGctnt(rs.getString("GCTNT"));
			dto.setDt(rs.getString("DT"));
			dto.setCtnt(rs.getString("CTNT"));
			dto.setRctnt(rs.getString("RCTNT"));
			dto.setAdv_cd(rs.getString("ADV_CD"));
			
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
		
		String sql = "UPDATE ADV_TBL SET RST_CD = ? WHERE ADV_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, text);
		pstmt.setString(2, cd);
		
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		
		return result;
	}
}
