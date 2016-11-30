package class3.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class wedding_select_DAO implements Iwedding_select_DAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	
	
	
	
	// 상품평 글, 날짜, 평점, 아이디------------------------------------------
	// 완료
	@Override
	public ArrayList<wedding_select_DTO> prodList(String cd) throws SQLException
	{
		ArrayList<wedding_select_DTO> prodCmtResult = new ArrayList<wedding_select_DTO>();
		Connection conn = dataSource.getConnection();
		wedding_select_DTO dto = null;
		
		String sql = "SELECT P.PROD_CD AS PROD_CD, U.NAME AS NAME, PC.CTNT AS CTNT, PC.SCR AS SCR, PC.DT AS DT " +
				"FROM PROD_TBL P, PROD_CMT_TBL PC, USR_TBL U " +
				"WHERE P.PROD_CD = PC.PROD_CD " +
				"AND U.USR_ID = PC.USR_ID " +
				"AND P.STRT IS NULL " +
				"AND P.PROD_CD = ? " +
				"ORDER BY 5";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		
		while(rs.next())
		{
			dto = new wedding_select_DTO();

			dto.setProd_cd(rs.getString("PROD_CD"));
			dto.setName(rs.getString("NAME"));
			dto.setCtnt(rs.getString("CTNT"));
			dto.setScr(rs.getString("SCR"));
			dto.setDt(rs.getString("DT"));
			
			prodCmtResult.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return prodCmtResult;
	}
	// ------------------------------------------상품평 글, 날짜, 평점, 아이디

	// 상품평 댓글 / 글, 날짜 , 아이디 ---------------------------------------
	@Override
	public ArrayList<wedding_select_DTO> prodRvwList() throws SQLException
	{
		ArrayList<wedding_select_DTO> prodRvwCmtResult = new ArrayList<wedding_select_DTO>();
		Connection conn = dataSource.getConnection();
		wedding_select_DTO dto = null;
		
		String sql = "SELECT CTNT, DT, USR_ID"
				  + " FROM RVW_CMT_VIEW WHERE"
				  + " CMPNY_ID = '1111111111'"
				  + "  AND PROD_CD = '1'"
				  + "  AND PROD_CMT_CD = '1'";
		
		//System.out.println(sql);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_select_DTO();
			
			dto.setRvwProdCtnt(rs.getString("CTNT"));
			dto.setRvwProdDt(rs.getString("DT"));
			dto.setRvwProdUsrId(rs.getString("USR_ID"));
			
			prodRvwCmtResult.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return prodRvwCmtResult;
	}
	// ---------------------------------------상품평 댓글 / 글, 날짜 , 아이디 
	
	// 상담하기 내역 / 글, 날짜, 아이디-------------------------------------------
	@Override
	public ArrayList<wedding_select_DTO> advList(String cd) throws SQLException
	{
		ArrayList<wedding_select_DTO> advCmtResult = new ArrayList<wedding_select_DTO>();
		Connection conn = dataSource.getConnection();
		wedding_select_DTO dto = null;
		
		String sql = "SELECT P.PROD_CD AS PROD_CD, U.NAME AS NAME, A.CTNT AS CTNT, A.DT AS DT " +
				"FROM PROD_TBL P, ADV_TBL A, USR_TBL U " +
				"WHERE P.PROD_CD = A.PROD_CD " +
				"AND U.USR_ID = A.USR_ID " +
				"AND P.STRT IS NULL " +
				"AND P.PROD_CD = ?" +
				"ORDER BY 4";
		
		//System.out.println(sql);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_select_DTO();

			dto.setProd_cd(rs.getString("PROD_CD"));
			dto.setName(rs.getString("NAME"));
			dto.setCtnt(rs.getString("CTNT"));
			dto.setDt(rs.getString("DT"));
			
			advCmtResult.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return advCmtResult;
	}
	// -------------------------------------------상담하기 내역 / 글, 날짜, 아이디
	
	
	// 상담하기 댓글 / 글, 날짜, 아이디 ------------------------------------------
	@Override
	public ArrayList<wedding_select_DTO> advRvwList() throws SQLException
	{
		ArrayList<wedding_select_DTO> advCmtRvwResult = new ArrayList<wedding_select_DTO>();
		wedding_select_DTO dto = null;
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT USR_ID, CTNT, DT"
				  + " FROM ADV_CMT_VIEW"
				  + " WHERE CMPNY_ID = '1111111111'"
				  + "  AND PROD_CD = '1'"
				  + "  AND ADV_CD = '1'";
		
		//System.out.println(sql);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_select_DTO();
			
			dto.setRvwAdvUsrId(rs.getString("USR_ID"));
			dto.setRvwAdvCtnt(rs.getString("CTNT"));
			dto.setRvwAdvDt(rs.getString("DT"));
			
			advCmtRvwResult.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return advCmtRvwResult;
	}
	// ------------------------------------------ 상담하기 댓글 / 글, 날짜, 아이디
	
	
	// 상세정보 이름, 홈피, 주소 ----------------------------------------------
	@Override
	public wedding_select_DTO list(String cd) throws SQLException
	{
		wedding_select_DTO dto = null;
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT C.NAME AS NAME, C.HMPG AS HMPG, C.ADDR1||' '||ADDR2 AS ADDR, P.PROD_CD " +
					"FROM CMPNY_TBL C, PROD_TBL P " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND PROD_CD = ?";
		
		//System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_select_DTO();
			
			dto.setCmpnyName(rs.getString("NAME"));
			dto.setHmpg(rs.getString("HMPG"));
			dto.setAddr1(rs.getString("ADDR"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return dto;
	}
	// ----------------------------------------------상세정보 이름, 홈피, 주소 

	// 찜한 상태인지 확인하기---------------------------------------------------- 수정!!!!!!!!!!!!!!!!!!!!!!!!!!
	@Override
	public String selList(String cd, String id) throws SQLException
	{
		String selResult = null;
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT USR_ID"
				  + " FROM SEL_VIEW"
				  + " WHERE CMPNY_CTGY_ID = '1'"
				  + "  AND PROD_CD = ?"
				  + "  AND USR_ID = ?";
		
		System.out.println(sql);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		pstmt.setString(2, id);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			selResult = rs.getString("USR_ID");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return selResult;
	}
	// ----------------------------------------------------찜한 상태인지 확인하기
	
	
	
	
	
	// 상품평 인설트-----------------------------------------------------------------
	public int prodInsert(String cd, String userId, String ctnt, String scr) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO PROD_CMT_TBL(PROD_CMT_CD, PROD_CD, USR_ID, RST_CD, CTNT, SCR) " +
					"VALUES (PROD_CMT_TBL_SEQ.NEXTVAL, ?, ?, 1, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		pstmt.setString(2, userId);
		pstmt.setString(3, ctnt);
		pstmt.setString(4, scr);
		
		result = pstmt.executeUpdate();
		System.out.println(result + "행이 정상적으로 입력되었습니다.");
		
		return result;
	}
	//-----------------------------------------------------------------------------
	
	
	// 상담하기 인설트-----------------------------------------------------------------
	public int advInsert(String cd, String userId, String ctnt) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = null;

		String sql = "INSERT INTO ADV_TBL(ADV_CD, USR_ID, PROD_CD, RST_CD, CTNT) " +
				     "VALUES (ADV_TBL_SEQ.NEXTVAL, ?, ?, '1', ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userId);
		pstmt.setString(2, cd);
		pstmt.setString(3, ctnt);
		
		
		result = pstmt.executeUpdate();
		System.out.println(result + "행이 정상적으로 입력되었습니다.");
		
		return result;
	}
	
	
	
	// 상세정보 상세상품 이미지들들들들
	@Override
	public ArrayList<wedding_select_DTO> imgList(String cd) throws SQLException
	{
		ArrayList<wedding_select_DTO> result = new ArrayList<wedding_select_DTO>();
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT C.CMPNY_ID AS CMPNY_ID, C.NAME AS NAME, C.ADDR1||' '||C.ADDR2 AS ADDR, P.PROD_CD, DP.PTH AS PTH " +
					"FROM CMPNY_TBL C, PROD_TBL P, PROD_TP_TBL PT, DTL_PROD_TBL DP " +
					"WHERE C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.PROD_CD = PT.PROD_CD " +
					"AND PT.PROD_TP_CD = DP.PROD_TP_CD " +
					"AND P.PROD_CD = ?";
		
		//System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		ResultSet rs = pstmt.executeQuery();
		
		wedding_select_DTO dto = null;
		while(rs.next())
		{
			dto = new wedding_select_DTO();
			
			dto.setPth(rs.getString("PTH"));
			
			result.add(dto);
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	// ----------------------------------------------상세정보 이미지 이미지 이미지
	
	//상품평 점수 출력------------------------------------------------------------
	@Override
	public String[] srcScore(String cd) throws SQLException
	{
		String[] result = new String[2];
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT TRUNC(AVG(PC.SCR), 1) AS AVG, COUNT(PC.SCR) AS COUNT " +
					"FROM PROD_TBL P, PROD_CMT_TBL PC, USR_TBL U " +
					"WHERE P.PROD_CD = PC.PROD_CD " +
					"AND U.USR_ID = PC.USR_ID " +
					"AND P.STRT IS NULL " +
					"AND P.PROD_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		ResultSet rs = pstmt.executeQuery();

		
		while(rs.next())
		{
			result[0] = rs.getString("AVG");
			result[1] = rs.getString("COUNT");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	//상품평 점수 출력------------------------------------------------------------
}





















