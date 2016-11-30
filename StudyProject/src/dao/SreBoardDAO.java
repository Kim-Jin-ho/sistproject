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
	
	
	// 회원번호 조회 메소드
	@Override
	public String getMid(String nickname) throws SQLException
	{
		String result = null;
		Connection conn = dataSource.getConnection();

		String sql = "SELECT MID FROM MEMBER WHERE NICKNAME = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, nickname);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result = rs.getString("MID");
		}

		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}


	// 마일리지 적립 쿼리문
	@Override
	public int insertSave(String mid) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO SRSAVE(SVID, SVLID, MID, SVMONEY, SVDATE) VALUES (SEQ_SRSAVE.NEXTVAL,'1',?,5,SYSDATE)";
		System.out.println(sql);
		
		PreparedStatement pstmt  = conn.prepareStatement(sql);
		pstmt.setString(1, mid);
		
		result = pstmt.executeUpdate();
		
		return result;
	}

	// 마일리지 조회 메소드
	@Override
	public String getSave(String nickname) throws SQLException
	{
		String result = ""; // 마일리지 담기 위한 변수
		
		Connection conn =dataSource.getConnection();
		
		String sql = "SELECT SUM(SVMONEY) AS SUM FROM SRSAVE WHERE MID = ?";

		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, nickname);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getString("SUM");
			if (result == null)
			{
				result = "0";
			}
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 게시글 수량 조회 메소드
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

	// 리플 불러오기
	@Override
	public ArrayList<SreBoard> reList(int srId) throws SQLException
	{
		ArrayList<SreBoard> result = new ArrayList<SreBoard>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT SCID, SRID, MID, SRCONTENT, SRWID, SRWDATE, SRSCORE " +
					 "FROM SRCOMMENT WHERE SRID=? ORDER BY SCID DESC";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, srId);
		
		ResultSet rs = pstmt.executeQuery();
		
		SreBoard dto = null;
		
		while (rs.next())
		{
			dto = new SreBoard();
			
			dto.setScid(rs.getString("SCID"));
			dto.setSrid(rs.getString("SRID"));
			dto.setMid(rs.getString("MID"));
			dto.setSrcontent(rs.getString("SRCONTENT"));
			dto.setSrwid(rs.getString("SRWID"));
			dto.setSrwdate(rs.getString("SRWDATE"));
			dto.setSrscore(rs.getString("SRSCORE"));
			
			result.add(dto);
		}
		
		return result;
	}
	
	// 리플 작성하기
	@Override
	public int reInsert(int srId, int mid, String srcontent, String nickname) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO SRCOMMENT(SCID, SRID, MID, SRCONTENT, SRWID, SRWDATE, SRSCORE) " +
					 "VALUES (SEQ_SRCOMMENT.NEXTVAL, ?, ?, ?, ?, SYSDATE, 0)";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, srId);
		pstmt.setInt(2, mid);
		pstmt.setString(3, srcontent);
		pstmt.setString(4, nickname);
		
		result = pstmt.executeUpdate();
		
		return result;
	}

	// 리플 수정하기
	@Override
	public int reUpdate(int scid, String updateSrcontent) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE SRCOMMENT SET SRCONTENT=?, SRWDATE=SYSDATE WHERE SCID=?";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, updateSrcontent);
		pstmt.setInt(2, scid);
		
		result = pstmt.executeUpdate();
		
		return result;
	}

	// 리플 삭제하기
	@Override
	public int reDelete(int scid) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM SRCOMMENT WHERE SCID = ?";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, scid);
		
		result = pstmt.executeUpdate();
		
		return result;
	}
	
	//
	
	
	// 추천 목록 갯수 불러오기
	@Override
	public int recommendCount() throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM RECMLIST";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		return result;
	}

	// 리플 추천하기	
	@Override
	public int repleRecommend(int scid) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT SCID, SRID, MID, SRCONTENT, SRWID, SRWDATE, SRSCORE " +
					 "FROM SRCOMMENT WHERE SCID=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, scid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("SRSCORE");
		}
		
		System.out.println("현재 추천 횟수는 " + result + " 개 입니다.");
		
		sql = "UPDATE SRCOMMENT SET SRSCORE = " + (result + 1) + " WHERE SCID=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, scid);
		
		result = pstmt.executeUpdate();
		
		sql = "SELECT SCID, SRID, MID, SRCONTENT, SRWID, SRWDATE, SRSCORE " +
			  "FROM SRCOMMENT WHERE SCID=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, scid);
		
		rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("SRSCORE");
		}
		
		System.out.println("최종 추천 횟수는 " + result + " 개 입니다.");
		
		return result;
	}

	// 추천 목록 불러오기
	@Override
	public String[] recommendList() throws SQLException
	{
		int num = recommendCount();
		String arr[] = new String[num];
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT SRRCLISTNAME FROM RECMLIST";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		num = 0;
		while (rs.next())
		{
			arr[num] = rs.getString("SRRCLISTNAME");
			num++;
		}
		
		return arr;
	}

	// 추천수 불러오기
	@Override
	public int recommend(int srId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT " +
		             "FROM RECM " +
				     "WHERE SRID=?";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, srId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		return result;
	}

	// 추천하기	
	@Override
	public int recommendInsert(String recommendList, int srId, int mid) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO RECM(RCMID, RCMLID, SRID, MID) " +
					 "VALUES(SEQ_RECM.NEXTVAL, ?, ?, ?)";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, recommendList);
		pstmt.setInt(2, srId);
		pstmt.setInt(3, mid);
		
		result = pstmt.executeUpdate();
		
		return result;
	}

	// 추천 여부 체크	
	@Override
	public int recommendCheck(int srId, int mid) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM RECM WHERE SRID=? AND MID=?";
		System.out.println("추천 여부를 체크합니다.");
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, srId);
		pstmt.setInt(2, mid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		return result;
	}

	// 추천 삭제하기
	@Override
	public int recommendDelete(int srId) throws SQLException
	{
		return 0;
	}

	// 신고수 불러오기
	@Override
	public int report(int srId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT " +
		             "FROM SRWARNING " +
				     "WHERE SRID=?";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, srId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		return result;
	}

	// 신고하기	
	@Override
	public int reportInsert(int srId, int mid) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO SRWARNING(WNID, SRID, MID) " +
					 "VALUES(SEQ_SRWARNING.NEXTVAL, ?, ?)";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, srId);
		pstmt.setInt(2, mid);
		
		result = pstmt.executeUpdate();
		
		return result;
	}

	// 신고 여부 체크
	@Override
	public int reportCheck(int srId, int mid) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM SRWARNING WHERE SRID=? AND MID=?";
		System.out.println("신고 여부를 체크합니다.");
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setInt(1, srId);
		pstmt.setInt(2, mid);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		return result;
	}

	// 신고 취소하기
	@Override
	public int reportDelete(int srId) throws SQLException
	{
		return 0;
	}

	// nickname 으로 mId 찾기
	@Override
	public int searchNum(String nickname) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT MID FROM MEMBER WHERE NICKNAME LIKE ?";
		
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, nickname);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("MID");
		}
		
		return result;
	}
}
