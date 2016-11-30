package class3.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class wedding_main_DAO implements Iweeding_main_DAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	//---main 웨/스/드/메 각각의 광고 뿌려주기
	@Override
	public ArrayList<wedding_main_DTO> mainAdvt() throws SQLException
	{	
		ArrayList<wedding_main_DTO> advtResult = new ArrayList<wedding_main_DTO>();
		
		Connection conn = dataSource.getConnection();
		
		wedding_main_DTO dto = null;
		
		String sql = "SELECT SBJCT, IMG FROM MAINADVT_VIEW WHERE CMPNY_CTGY_ID = '1'";
		
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_main_DTO();
			
			dto.setSbjct(rs.getString("SBJCT"));
			dto.setImg(rs.getString("IMG"));
			
			advtResult.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return advtResult;		
	}
	// main 웨/스/드/메 각각의 광고 뿌려주기------------------------------------------
	
	// main 웨/스/드/메 각각 클릭시 ajax 로 해당 지역 뿌려주기-------------------------
	@Override
	public ArrayList<wedding_main_DTO> mainadvtajax(String addr11, String addr12) throws SQLException
	{	
		addr11 = "%" + addr11 + "%";
		addr12 = "%" + addr12 + "%";
		ArrayList<wedding_main_DTO> advtajaxResult = new ArrayList<wedding_main_DTO>();
		
		Connection conn = dataSource.getConnection();
		
		wedding_main_DTO dto = null;
		
		String sql = "SELECT SBJCT, IMG"
				  + " FROM AJAXMAINADVT_VIEW"
				  + " WHERE CMPNY_CTGY_ID = '1'"
				  + "   AND ADDR1 LIKE ?"
				  + "   AND ADDR1 LIKE ?";
		
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, addr11);
		pstmt.setString(2, addr12);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_main_DTO();
			
			dto.setSbjct(rs.getString("SBJCT"));
			dto.setImg(rs.getString("IMG"));
			
			advtajaxResult.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return advtajaxResult;
	}
	// -----------------------main 웨/스/드/메 각각 클릭시 ajax 로 해당 지역 뿌려주기
	
	
	



	// main 지도 클릭시 일반상품이미지, 이름, 가격--------------------------------------------
	@Override
	public ArrayList<wedding_main_DTO> mainMap(String addr11, String addr12) throws SQLException
	{	
		addr11 = "%" + addr11 + "%"; 
		addr12 = "%" + addr12 + "%";
		
		ArrayList<wedding_main_DTO> mainResult = new ArrayList<wedding_main_DTO>();
		
		Connection conn = dataSource.getConnection();
		
		wedding_main_DTO dto = null;
		
		String sql = "SELECT ADDR1, ADDR2, NAME, IMG, PRC"
				  + " FROM MAINCLICK_VIEW"
				  + " WHERE ADDR1 LIKE ?"
				  + "   AND ADDR1 LIKE ?"
				  + "   AND STRT IS NULL"
				  + "   AND PROD_CD = (SELECT MIN(PROD_CD) FROM PROD_TBL)"
				  + "   AND PROD_TP_CD = 1"
				  + "   AND PRC = (SELECT MAX(PRC) FROM DTL_PROD_TBL WHERE PROD_TP_CD = 1)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, addr11);
		pstmt.setString(2, addr12);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_main_DTO();
			
			dto.setAddr1(rs.getString("ADDR1"));
			dto.setAddr2(rs.getString("ADDR2"));
			dto.setName(rs.getString("NAME"));
			dto.setImg(rs.getString("IMG"));
			dto.setPrc(rs.getString("PRC"));
			
			mainResult.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return mainResult;
	}

	
	
	///////////////////////////이준환///////////////////////////////////////
	@Override
	public ArrayList<wedding_main_DTO> weddingSerchProduct(String regionMain, String regionSub) throws SQLException
	{
		ArrayList<wedding_main_DTO> result = new ArrayList<wedding_main_DTO>();
		
		regionMain = "%" + regionMain + "%"; 
		regionSub = "%" + regionSub + "%";
		
		Connection conn = dataSource.getConnection();
		
		wedding_main_DTO dto = null;
		
		String sql = "SELECT T.CATEGORY, T.CMPNY_ID, T.NAME, T.ADDR, T.IMG, MIN(T.PRC) AS MIN, MAX(T.PRC) AS MAX " +
					"FROM " + 
					"( " +
					"SELECT C.CMPNY_CTGY_ID AS CATEGORY, C.CMPNY_ID, C.NAME AS NAME, C.ADDR1||C.ADDR2 AS ADDR, P.IMG, DP.PRC " +
					"FROM CMPNY_CTGY_TBL CC, CMPNY_TBL C, PROD_TBL P, PROD_TP_TBL PT, DTL_PROD_TBL DP " +
					"WHERE CC.CMPNY_CTGY_ID = C.CMPNY_CTGY_ID " +
					"AND C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.STRT IS NULL " +
					"AND P.PROD_CD = PT.PROD_CD " +
					"AND PT.PROD_TP_CD = DP.PROD_TP_CD " +
					")T " +
					"WHERE ADDR LIKE ? " +
					"AND ADDR LIKE ? " +
					"AND CATEGORY = '1' " +
					"GROUP BY T.CATEGORY, T.CMPNY_ID, T.NAME, T.ADDR, T.IMG " +
					"ORDER BY 2 ";		
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, regionMain);
		pstmt.setString(2, regionSub);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_main_DTO();
			
			dto.setCategory(rs.getString("CATEGORY"));
			dto.setCmpny_id(rs.getString("CMPNY_ID"));
			dto.setName(rs.getString("NAME"));
			dto.setAddr(rs.getString("ADDR"));
			dto.setImg(rs.getString("IMG"));
			dto.setMin(rs.getString("MIN"));
			dto.setMax(rs.getString("MAX"));
			System.out.println(rs.getString("NAME"));
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	
	
	@Override
	public ArrayList<wedding_main_DTO> weddingSerchProduct(String regionMain) throws SQLException
	{
		ArrayList<wedding_main_DTO> result = new ArrayList<wedding_main_DTO>();
		
		regionMain = "%" + regionMain + "%"; 
		
		
		Connection conn = dataSource.getConnection();
		
		wedding_main_DTO dto = null;
		
		String sql = "SELECT T.CATEGORY, T.CMPNY_ID, T.NAME, T.ADDR, T.IMG, MIN(T.PRC) AS MIN, MAX(T.PRC) AS MAX " +
					"FROM " + 
					"( " +
					"SELECT C.CMPNY_CTGY_ID AS CATEGORY, C.CMPNY_ID, C.NAME AS NAME, C.ADDR1||C.ADDR2 AS ADDR, P.IMG, DP.PRC " +
					"FROM CMPNY_CTGY_TBL CC, CMPNY_TBL C, PROD_TBL P, PROD_TP_TBL PT, DTL_PROD_TBL DP " +
					"WHERE CC.CMPNY_CTGY_ID = C.CMPNY_CTGY_ID " +
					"AND C.CMPNY_ID = P.CMPNY_ID " +
					"AND P.STRT IS NULL " +
					"AND P.PROD_CD = PT.PROD_CD " +
					"AND PT.PROD_TP_CD = DP.PROD_TP_CD " +
					")T " +
					"WHERE ADDR LIKE ? " +
					"AND CATEGORY = '1' " +
					"GROUP BY T.CATEGORY, T.CMPNY_ID, T.NAME, T.ADDR, T.IMG " +
					"ORDER BY 2 ";		
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, regionMain);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_main_DTO();
			
			dto.setCategory(rs.getString("CATEGORY"));
			dto.setCmpny_id(rs.getString("CMPNY_ID"));
			dto.setName(rs.getString("NAME"));
			dto.setAddr(rs.getString("ADDR"));
			dto.setImg(rs.getString("IMG"));
			dto.setMin(rs.getString("MIN"));
			dto.setMax(rs.getString("MAX"));
			System.out.println(rs.getString("NAME"));
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	////////////////////////////////////////////////////////////////////////
	// --------------------------------------------main 지도 클릭시 일반상품이미지, 이름, 가격
	
	/*
	// 수정하기전 보기 지우기
	@Override
	public ArrayList<wedding_main_DTO> mainList(String addr11, String addr12, String prodName
		     , String sbjct, String img, String pth) throws SQLException
	{	
		addr11 = "%" + addr11 + "%"; 
		addr12 = "%" + addr12 + "%";
		
		ArrayList<wedding_main_DTO> result = new ArrayList<wedding_main_DTO>();
		
		wedding_main_DTO dto = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT ADDR1, PRODNAME, SBJCT, IMG, PTH"
				  + " FROM MAIN_VIEW"
				  + " WHERE ADDR1 LIKE ?"
				  + "   AND ADDR1 LIKE ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, addr11);
		pstmt.setString(2, addr12);
		
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			dto = new wedding_main_DTO();
			
			dto.setAddr1(rs.getString("ADDR1"));
			dto.setProdName(rs.getString("PRODNAME"));
			dto.setSbjct(rs.getString("SBJCT"));
			dto.setImg(rs.getString("IMG"));
			dto.setPth(rs.getString("PTH"));
			
			result.add(dto);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
		
		
	}
*/
	
	
}



















