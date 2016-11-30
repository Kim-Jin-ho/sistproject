package class3.com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class MembershipReservationsDAO implements IReservationsManagementDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 예약 리스트
	@Override
	public ArrayList<MembershipReservationsDTO> resList(String saNum) throws SQLException
	{		
		ArrayList<MembershipReservationsDTO> result = new ArrayList<MembershipReservationsDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT LIST, NAME, GCTNT, TEL, DAY, VST, INQY, RCTNT, RSVTN_CD FROM CMPNY_RSVTN_VIEW WHERE CMPNY_ID = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		MembershipReservationsDTO dto = null;
		
		while(rs.next())
		{
			dto = new MembershipReservationsDTO();
			dto.setList(rs.getString("LIST"));
			dto.setName(rs.getString("NAME"));
			dto.setGctnt(rs.getString("GCTNT"));
			dto.setTel(rs.getString("TEL"));
			dto.setDay(rs.getString("DAY"));
			dto.setVst(rs.getString("VST"));
			dto.setInqy(rs.getString("INQY"));
			dto.setRctnt(rs.getString("RCTNT"));
			dto.setRsvtn_cd(rs.getString("RSVTN_CD"));
			
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	
	
	// 견적사항 팝업 내용
	@Override
	public MembershipReservationsDTO estimate(String name, String tel) throws SQLException
	{
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NAME, TEL, INQY, PRC FROM CMPNY_EST_VIEW WHERE NAME = ? AND TEL = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, tel);
		
		ResultSet rs = pstmt.executeQuery();
		MembershipReservationsDTO dto = null;
		
		while(rs.next())
		{
			dto = new MembershipReservationsDTO();
			
			dto.setName(rs.getString("NAME"));
			dto.setInqy(rs.getString("INQY"));
			dto.setPrc(rs.getString("PRC"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}

	// 결과 수정
	@Override
	public int updateSelect(String text, String name) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE RSVTN_TBL SET RST_CD = ? WHERE RSVTN_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, text);
		pstmt.setString(2, name);
		
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		
		return result;
	}
	
	
	

}
