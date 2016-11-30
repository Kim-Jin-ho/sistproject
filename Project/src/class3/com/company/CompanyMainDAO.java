package class3.com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class CompanyMainDAO implements ICompanyMainDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 경고 누적 출력
	@Override
	public int warCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT WAR FROM CMPNY_MAIN_WAR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("WAR"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 전체 공지 5줄
	@Override
	public ArrayList<CompanyMainDTO> noticeList() throws SQLException
	{
		ArrayList<CompanyMainDTO> result = new ArrayList<CompanyMainDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT SBJCT FROM CMPNY_MAIN_NTC_VIEW";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		CompanyMainDTO dto = null;
		
		while(rs.next())
		{
			dto = new CompanyMainDTO();
			dto.setSbjct(rs.getString("SBJCT"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 금일 예약처리 출력
	@Override
	public int rsvtnCount(String saNum) throws SQLException
	{ 
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM CMPNY_MAIN_RSVTN_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 금일 상담처리 출력
	@Override
	public int advCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM CMPNY_MAIN_ADV_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 금일 상품평 처리
	@Override
	public int reviewCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM CMPNY_MAIN_REVIEW_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 일반 상품 대표 이미지
	@Override
	public String normalImg(String saNum) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT C.CMPNY_ID, IMG " +
					"FROM CMPNY_TBL C, PROD_TBL P " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND STRT IS NULL AND C.CMPNY_ID = ? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getString("IMG");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int normalHitCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(C.CMPNY_ID) AS COUNT " +
					"FROM CMPNY_TBL C, PROD_TBL P, VW_TBL V " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = V.PROD_CD " +
					"AND STRT IS NULL " +
					"AND (DT >= SYSDATE AND DT < SYSDATE + 1) " +
					"AND C.CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int normalRsvtnCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(C.CMPNY_ID) AS COUNT " +
					"FROM CMPNY_TBL C, PROD_TBL P, RSVTN_TBL R " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = R.PROD_CD " +
					"AND STRT IS NULL " +
					"AND (DAY >= SYSDATE AND DAY < SYSDATE + 1) " +
					"AND C.CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int normalAdvCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(C.CMPNY_ID) AS COUNT " +
					"FROM CMPNY_TBL C, PROD_TBL P, ADV_TBL A " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = A.PROD_CD " +
					"AND STRT IS NULL " +
					"AND (DT >= SYSDATE AND DT < SYSDATE + 1) " +
					"AND C.CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int normalReviewCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(CMPNY_ID) AS COUNT " +
					"FROM " +
					"( " +
					"SELECT C.CMPNY_ID, P.STRT, PC.DT, PC.SCR " +
					"FROM CMPNY_TBL C, PROD_TBL P, PROD_CMT_TBL PC " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = PC.PROD_CD " +
					") " +
					"WHERE STRT IS NULL " +
					"AND (DT >= SYSDATE AND DT < SYSDATE + 1) " +
					"AND CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	 
	@Override
	public int normalScore(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NVL(TRUNC(AVG(SCR), 1), 0) AS AVG " +
				"FROM " +
				"( " +
				"SELECT C.CMPNY_ID, P.STRT, PC.DT, PC.SCR " +
				"FROM CMPNY_TBL C, PROD_TBL P, PROD_CMT_TBL PC " +
				"WHERE C.CMPNY_ID = P.CMPNY_ID " +
				"AND P.PROD_CD = PC.PROD_CD " +
				") " +
				"WHERE STRT IS NULL " +
				"AND (DT >= SYSDATE AND DT < SYSDATE + 1) " +
				"AND CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("AVG"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	
	
	
	
	// 일반 상품 대표 이미지
	@Override
	public String discountImg(String saNum) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT C.CMPNY_ID, IMG FROM CMPNY_TBL C, PROD_TBL P " +
		             "WHERE C.CMPNY_ID = P.CMPNY_ID AND STRT IS NULL AND C.CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getString("IMG");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	@Override
	public int discountHitCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(C.CMPNY_ID) AS COUNT " +
					"FROM CMPNY_TBL C, PROD_TBL P, VW_TBL V " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = V.PROD_CD " +
					"AND STRT IS NOT NULL " +
					"AND (DT >= SYSDATE AND DT < SYSDATE + 1) " +
					"AND C.CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int discountRsvtnCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(C.CMPNY_ID) AS COUNT " +
					"FROM CMPNY_TBL C, PROD_TBL P, RSVTN_TBL R " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = R.PROD_CD " +
					"AND STRT IS NOT NULL " +
					"AND (DAY >= SYSDATE AND DAY < SYSDATE + 1) " +
					"AND C.CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int discountAdvCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(C.CMPNY_ID) AS COUNT " +
					"FROM CMPNY_TBL C, PROD_TBL P, ADV_TBL A " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = A.PROD_CD " +
					"AND STRT IS NOT NULL " +
					"AND (DT >= SYSDATE AND DT < SYSDATE + 1) " +
					"AND C.CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int discountReviewCount(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(CMPNY_ID) AS COUNT " +
					"FROM " +
					"( " +
					"SELECT C.CMPNY_ID, P.STRT, PC.DT, PC.SCR " +
					"FROM CMPNY_TBL C, PROD_TBL P, PROD_CMT_TBL PC " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = PC.PROD_CD " +
					") " +
					"WHERE STRT IS NOT NULL " +
					"AND (DT >= SYSDATE AND DT < SYSDATE + 1) " +
					"AND CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("COUNT"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public int discountScore(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NVL(TRUNC(AVG(SCR), 1), 0) AS AVG " +
				"FROM ( SELECT C.CMPNY_ID, P.STRT, PC.DT, PC.SCR  " +
				"FROM CMPNY_TBL C, PROD_TBL P, PROD_CMT_TBL PC " +
				"WHERE C.CMPNY_ID = P.CMPNY_ID " +
				"AND P.PROD_CD = PC.PROD_CD " +
				") WHERE STRT IS NOT NULL " +
				"AND (DT >= SYSDATE AND DT < SYSDATE + 1) " +
				"AND CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = Integer.parseInt(rs.getString("AVG"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public String advtImg(String saNum) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT C.CMPNY_ID, A.IMG IMG " +
					"FROM CMPNY_TBL C, PROD_TBL P, ADVT_REQ_TBL A " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = A.PROD_CD " +
					"AND C.CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getString("IMG");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
}
