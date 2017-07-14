package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.SreBoard;

public class SreBoardDAO implements SreBoardDMenu
{

	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public int getDataCount(String searchKey, String searchValue) throws SQLException
	{
		System.out.println(searchKey+"g2");
		System.out.println(searchValue);
		
		String searchKey1 = "WHERE ";
		searchKey1 += searchKey;
		int result = 0;
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try
		{
			searchValue = "%" + searchValue + "%"; // - 검색어 추가
			sql = "SELECT NVL(COUNT(*), 0) AS COUNT FROM VIEW_BOARD " + searchKey1 + " LIKE ?";
			System.out.println(sql);
			// -- searchKey 로 넘겨받을 수 있는 내용은
			// content, subject, name 만 가능한 상황
			// 『?』 로 처리할 수 없음

			pstmt = conn.prepareStatement(sql);
			// pstmt.setString(1, searchKey);
			pstmt.setString(1, searchValue);

			rs = pstmt.executeQuery();

			if (rs.next())
				result = rs.getInt("COUNT");
			rs.close();
			pstmt.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public ArrayList<SreBoard> list(int start, int end, int dataCount) throws SQLException
	{
		ArrayList<SreBoard> result = new ArrayList<SreBoard>();
		
		Connection conn = dataSource.getConnection();

		String sql = "SELECT AAA.* FROM(SELECT COUNT(*) OVER() AS TOTAL_COUNT, AA.* FROM(SELECT ROW_NUMBER() OVER(ORDER BY HNCOUNT DESC) AS RNUM, SRID,LOCATION, MEMBER, SOUND, SHOPNAME, SHOPNO, INWON, HNWDATE, DETAILCON, DAYHOURS, PRICE2, MINTIME, HNCOUNT, HNHIT, YESNO, WIFI, CONSENT FROM VIEW_BOARD) AA) AAA WHERE AAA.RNUM BETWEEN 1 AND 5";
		System.out.println(sql);

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		SreBoard board = null;

		while (rs.next())
		{
			board = new SreBoard();
			
			board.setrNum(rs.getInt("RNUM"));
			board.setSrId(rs.getInt("SRID"));
			board.setLocaTion(rs.getString("LOCATION"));
			board.setMemBer(rs.getString("MEMBER"));
			board.setSouNd(rs.getString("SOUND"));
			board.setShopName(rs.getString("SHOPNAME"));
			board.setShopNo(rs.getString("SHOPNO"));
			board.setInWon(rs.getString("INWON"));
			board.setHnwDate(rs.getString("HNWDATE"));
			board.setDetailCon(rs.getString("DETAILCON"));
			board.setDayHours(rs.getString("DAYHOURS"));
			board.setPricE2(rs.getString("PRICE2"));
			board.setMinTime(rs.getString("MINTIME"));
			board.setHnCount(rs.getInt("HNCOUNT"));
			board.setHnHit(rs.getInt("HNHIT"));
			board.setYesNo(rs.getString("YESNO"));
			board.setWiFi(rs.getString("WIFI"));
			board.setConSent(rs.getString("CONSENT"));

			result.add(board);
		}
		pstmt.close();
		rs.close();
		conn.close();

		return result;
	}
/*
	@Override
	public ArrayList<SreBoard> list() throws SQLException
	{
		ArrayList<SreBoard> result = new ArrayList<SreBoard>();

		Connection conn = dataSource.getConnection();

		String sql = "SELECT ROW_NUMBER() OVER(ORDER BY SRID DESC) AS SRID, LOCATION, MEMBER, SOUND, SHOPNAME, SHOPNO, INWON, HNWDATE, DETAILCON, DAYHOURS, PRICE2, MINTIME, HNCOUNT, HNHIT, YESNO, WIFI, CONSENT FROM VIEW_BOARD ORDER BY SRID ASC";
		System.out.println(sql);

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		SreBoard board = null;

		while (rs.next())
		{
			board = new SreBoard();

			board.setSrId(rs.getInt("RNUM"));
			board.setLocaTion(rs.getString("LOCATION"));
			board.setMemBer(rs.getString("MEMBER"));
			board.setSouNd(rs.getString("SOUND"));
			board.setShopName(rs.getString("SHOPNAME"));
			board.setShopNo(rs.getString("SHOPNO"));
			board.setInWon(rs.getString("INWON"));
			board.setHnwDate(rs.getString("HNWDATE"));
			board.setDetailCon(rs.getString("DETAILCON"));
			board.setDayHours(rs.getString("DAYHOURS"));
			board.setPricE2(rs.getString("PRICE2"));
			board.setMinTime(rs.getString("MINTIME"));
			board.setHnCount(rs.getInt("HNCOUNT"));
			board.setHnHit(rs.getInt("HNHIT"));
			board.setYesNo(rs.getString("YESNO"));
			board.setWiFi(rs.getString("WIFI"));
			board.setConSent(rs.getInt("CONSENT"));

			result.add(board);
		}
		pstmt.close();
		rs.close();
		conn.close();

		return result;
	}
*/
	@Override
	public ArrayList<SreBoard> lists(int start, int end, int dataCount, String searchKey, String searchValue) throws SQLException
	{
		ArrayList<SreBoard> result = new ArrayList<SreBoard>();
		System.out.println(searchValue);
		Connection conn = dataSource.getConnection();

		String sql = "SELECT AAA.* FROM (SELECT COUNT(*) OVER() AS TOTAL_COUNT, AA.*  FROM(SELECT ROWNUM AS RNUM, SRID,LOCATION, MEMBER, SOUND, SHOPNAME, SHOPNO, INWON, HNWDATE, DETAILCON, DAYHOURS, PRICE2, MINTIME, HNCOUNT, HNHIT, YESNO, WIFI, CONSENT FROM (SELECT SRID, LOCATION, MEMBER, SOUND, SHOPNAME, SHOPNO, INWON, HNWDATE, DETAILCON, DAYHOURS, PRICE2, MINTIME, HNCOUNT, HNHIT, YESNO, WIFI, CONSENT FROM VIEW_BOARD ORDER BY HNWDATE ASC)A ) AA ORDER BY RNUM ASC) AAA WHERE AAA.RNUM BETWEEN ? AND ? order by rnum desc";
		System.out.println(sql);

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);

		ResultSet rs = pstmt.executeQuery();
		SreBoard board = null;

		while (rs.next())
		{
			board = new SreBoard();

			board.setrNum(rs.getInt("RNUM"));
			board.setSrId(rs.getInt("SRID"));
			board.setLocaTion(rs.getString("LOCATION"));
			board.setMemBer(rs.getString("MEMBER"));
			board.setSouNd(rs.getString("SOUND"));
			board.setShopName(rs.getString("SHOPNAME"));
			board.setShopNo(rs.getString("SHOPNO"));
			board.setInWon(rs.getString("INWON"));
			board.setHnwDate(rs.getString("HNWDATE"));
			board.setDetailCon(rs.getString("DETAILCON"));
			board.setDayHours(rs.getString("DAYHOURS"));
			board.setPricE2(rs.getString("PRICE2"));
			board.setMinTime(rs.getString("MINTIME"));
			board.setHnCount(rs.getInt("HNCOUNT"));
			board.setHnHit(rs.getInt("HNHIT"));
			board.setYesNo(rs.getString("YESNO"));
			board.setWiFi(rs.getString("WIFI"));
			board.setConSent(rs.getString("CONSENT"));

			result.add(board);
		}
		pstmt.close();
		rs.close();
		conn.close();

		return result;
	}

	
	//검색
	@Override
	public ArrayList<SreBoard> lists2(int start, int end, int dataCount, String searchKey, String searchValue) throws SQLException
	{
		ArrayList<SreBoard> result = new ArrayList<SreBoard>();
		Connection conn = dataSource.getConnection();
		
		System.out.println(searchKey+searchValue);
		System.out.println(start+" dd "+end);
		String sql = "SELECT AAA.* FROM (SELECT COUNT(*) OVER() AS TOTAL_COUNT, AA.*  FROM(SELECT ROWNUM AS RNUM, SRID,LOCATION, MEMBER, SOUND, SHOPNAME, SHOPNO, INWON, HNWDATE, DETAILCON, DAYHOURS, PRICE2, MINTIME, HNCOUNT, HNHIT, YESNO, WIFI, CONSENT FROM (SELECT SRID, LOCATION, MEMBER, SOUND, SHOPNAME, SHOPNO, INWON, HNWDATE, DETAILCON, DAYHOURS, PRICE2, MINTIME, HNCOUNT, HNHIT, YESNO, WIFI, CONSENT FROM VIEW_BOARD WHERE " + searchKey + " = " + searchValue +" ORDER BY HNWDATE ASC)A ) AA ORDER BY RNUM ASC) AAA WHERE AAA.RNUM BETWEEN ? AND ? order by rnum desc";;
		
		System.out.println(sql);

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		
		System.out.println(sql);
		ResultSet rs = pstmt.executeQuery();
		SreBoard board = null;

		while (rs.next())
		{
			board = new SreBoard();
			System.out.println(rs.getInt("RNUM")+"GFJAFL");
			board.setrNum(rs.getInt("RNUM"));
			board.setSrId(rs.getInt("SRID"));
			board.setLocaTion(rs.getString("LOCATION"));
			board.setMemBer(rs.getString("MEMBER"));
			board.setSouNd(rs.getString("SOUND"));
			board.setShopName(rs.getString("SHOPNAME"));
			board.setShopNo(rs.getString("SHOPNO"));
			board.setInWon(rs.getString("INWON"));
			board.setHnwDate(rs.getString("HNWDATE"));
			board.setDetailCon(rs.getString("DETAILCON"));
			board.setDayHours(rs.getString("DAYHOURS"));
			board.setPricE2(rs.getString("PRICE2"));
			board.setMinTime(rs.getString("MINTIME"));
			board.setHnCount(rs.getInt("HNCOUNT"));
			board.setHnHit(rs.getInt("HNHIT"));
			board.setYesNo(rs.getString("YESNO"));
			board.setWiFi(rs.getString("WIFI"));
			board.setConSent(rs.getString("CONSENT"));

			result.add(board);
		}
		pstmt.close();
		rs.close();
		conn.close();

		return result;
	}
	
	// 조회수 증가
	@Override
	public int hitUp(int srId) throws SQLException 
	{
		Connection conn = dataSource.getConnection();
		int result = 0;
		String sql = "UPDATE SREBOARD SET HNHIT = HNHIT+1 WHERE SRID = ?";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, srId);
		
		result = pstmt.executeUpdate();
		
		return result;
	};
	

	//글선택 화면
	@Override
	public ArrayList<SreBoard> view(int srId) throws SQLException
	{
		ArrayList<SreBoard> result = new ArrayList<SreBoard>();
		Connection conn = dataSource.getConnection();

		String sql = "SELECT AAA.* FROM(SELECT COUNT(*) OVER() AS TOTAL_COUNT, AA.* FROM(SELECT ROW_NUMBER() OVER(ORDER BY HNWDATE DESC) AS RNUM, SRID, LOCATION, MEMBER, SOUND, SHOPNAME, SHOPNO, INWON, HNWDATE, DETAILCON, DAYHOURS, PRICE2, MINTIME, HNCOUNT, HNHIT, YESNO, WIFI, CONSENT, DONGKYUNG, BUKWI FROM VIEW_BOARD) AA) AAA WHERE AAA.SRID = ?";
		System.out.println(sql);

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, srId);
		
		ResultSet rs = pstmt.executeQuery();
		SreBoard board = null;

		while (rs.next())
		{
			board = new SreBoard();

			board.setrNum(rs.getInt("RNUM"));
			board.setSrId(rs.getInt("SRID"));
			board.setLocaTion(rs.getString("LOCATION"));
			board.setMemBer(rs.getString("MEMBER"));
			board.setSouNd(rs.getString("SOUND"));
			board.setShopName(rs.getString("SHOPNAME"));
			board.setShopNo(rs.getString("SHOPNO"));
			board.setInWon(rs.getString("INWON"));
			board.setHnwDate(rs.getString("HNWDATE"));
			board.setDetailCon(rs.getString("DETAILCON"));
			board.setDayHours(rs.getString("DAYHOURS"));
			board.setPricE2(rs.getString("PRICE2"));
			board.setMinTime(rs.getString("MINTIME"));
			board.setHnCount(rs.getInt("HNCOUNT"));
			board.setHnHit(rs.getInt("HNHIT"));
			board.setYesNo(rs.getString("YESNO"));
			board.setWiFi(rs.getString("WIFI"));
			board.setConSent(rs.getString("CONSENT"));
			board.setDongkyung(rs.getDouble("DONGKYUNG"));
			System.out.println(rs.getString("DONGKYUNG"));
			board.setBukwi(rs.getDouble("BUKWI"));
			
			result.add(board);
		}
		pstmt.close();
		rs.close();
		conn.close();

		return result;
	}
	
	
	
	@Override
	public int sreCreate(SreBoard sreboard) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO SREBOARD(SRID, LCID, MID, SNID, SHOPID, SHOPNO, INWON, HNWDATE, DETAILCON, PCLID, PRICE2, MTID, HNCOUNT, HNHIT, YESNOID, WIFIID, ORID) "
				+ "VALUES ((SELECT MAX(SRID)+1 FROM SREBOARD) , ?, ?, ?, ?, ?, ?, SYSDATE, ?, ?, ?, ?, '0', '0', ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		pstmt.setString(1, sreboard.getLocaTion());
		pstmt.setInt(2, sreboard.getSrId());
		pstmt.setString(3, sreboard.getSouNd());
		pstmt.setString(4, sreboard.getShopId());
		pstmt.setString(5, sreboard.getShopNo());
		pstmt.setString(6, sreboard.getInWon());
		pstmt.setString(7, sreboard.getDetailCon());
		pstmt.setString(8, sreboard.getDayHours());
		pstmt.setString(9, sreboard.getPricE2());
		pstmt.setString(10, sreboard.getMinTime());
		pstmt.setString(11, sreboard.getYesNo());
		pstmt.setString(12, sreboard.getWiFi());
		pstmt.setString(13, sreboard.getConSent());
		
		
		
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	

	// 닉네임 가지고 회원번호 개져오기	
	@Override
	public int memberId(String nickname) throws SQLException
	{
		System.out.println("닉네임 체크 : " + nickname);
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT MID FROM MEMBER WHERE NICKNAME = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, nickname);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = rs.getInt("MID");
		}
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public double bukWi(String shopId) throws SQLException
	{
		double result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT BUKWI FROM SHOP WHERE SHOPID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, shopId);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public double dongKyung(String shopId) throws SQLException
	{
		double result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DONGKYUNG FROM SHOP WHERE SHOPID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, shopId);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	

	@Override
	public int sreDelete(String srId) throws SQLException {
		
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM SREBOARD WHERE SRID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, srId);
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	
	}

	   @Override
	   public int sreUpdate(SreBoard sreboard) throws SQLException
	   {
	      int result = 0;
	      Connection conn = dataSource.getConnection();
	      
	      System.out.println("여기!!!! update DAO");
	      
	      
	      String sql = "UPDATE SREBOARD SET  SNID=?, INWON=?, HNWDATE=SYSDATE, DETAILCON=?, PCLID=?, PRICE2=?, MTID=?, YESNOID=?, WIFIID=?, ORID=? WHERE SRID = ?";
	      
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, sreboard.getSouNd());
	      pstmt.setString(2, sreboard.getInWon());
	      pstmt.setString(3, sreboard.getDetailCon());
	      pstmt.setString(4, sreboard.getDayHours());
	      pstmt.setString(5, sreboard.getPricE2());
	      pstmt.setString(6, sreboard.getMinTime());
	      pstmt.setString(7, sreboard.getYesNo());
	      pstmt.setString(8, sreboard.getWiFi());
	      pstmt.setString(9, sreboard.getConSent());
	      pstmt.setInt(10, sreboard.getSrId());
	      
	      
	      System.out.println( sreboard.getLocaTion());
	      System.out.println( sreboard.getSouNd());
	      System.out.println( sreboard.getShopId());
	      System.out.println( sreboard.getShopNo());
	      System.out.println(sreboard.getInWon());
	      System.out.println( sreboard.getDetailCon());
	      System.out.println( sreboard.getDayHours());
	      System.out.println( sreboard.getPricE2());
	      System.out.println( sreboard.getMinTime());
	      System.out.println( sreboard.getYesNo());
	      System.out.println( sreboard.getWiFi());
	      System.out.println( sreboard.getConSent());
	      System.out.println( sreboard.getSrId());
	      
	      
	      result = pstmt.executeUpdate();
	      pstmt.close();
	      conn.close();
	      
	      System.out.println(sql);
	      System.out.println("update DAO 끝");
	      return result;
	   }

	   
	   
	@Override
	public ArrayList<SreBoard> sreList(String srId) throws SQLException 
	{

		ArrayList<SreBoard> result = new ArrayList<SreBoard>();
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT LCID, SNID, SHOPID, SHOPNO, INWON, DETAILCON, PCLID, PRICE2, MTID, YESNOID, WIFIID, ORID FROM SREBOARD WHERE SRID = ?";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, srId);
		
		ResultSet rs = pstmt.executeQuery();
		SreBoard board = null;

		while (rs.next())
		{
			board = new SreBoard();
			
			board.setLocaTion(rs.getString("LCID"));
			board.setSouNd(rs.getString("SNID"));
			board.setShopId(rs.getString("SHOPID"));
			board.setShopNo(rs.getString("SHOPNO"));
			board.setInWon(rs.getString("INWON"));
			board.setDetailCon(rs.getString("DETAILCON"));
			board.setDayHours(rs.getString("PCLID"));
			board.setPricE2(rs.getString("PRICE2"));
			board.setMinTime(rs.getString("MTID"));
			board.setYesNo(rs.getString("YESNOID"));
			board.setWiFi(rs.getString("WIFIID"));
			board.setConSent(rs.getString("ORID"));

			result.add(board);
		}
		
		System.out.println(sql);
		
		pstmt.close();
		rs.close();
		conn.close();

		return result;
		
		
	
	
	
	
	
	}
	
	
	
	
	
	
}
