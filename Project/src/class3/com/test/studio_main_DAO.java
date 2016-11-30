package class3.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class studio_main_DAO implements Istudio_main_DAO
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
		
		String sql = "SELECT SBJCT, IMG FROM MAINADVT_VIEW WHERE CMPNY_CTGY_ID = '2'";
		
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
				  + " WHERE CMPNY_CTGY_ID = '2'"
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
				  + " FROM MAINCLICK1_VIEW"
				  + " WHERE ADDR1 LIKE ?"
				  + "  AND ADDR1 LIKE ?"
				  + "  AND STRT IS NULL"
				  + "  AND PROD_CD = '2'"
				  + "  AND PRC = (SELECT MAX(PRC) FROM DTL_PROD_TBL WHERE PROD_TP_CD = '4')";
		
		
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
	
	

}
