package class3.com.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class UserDAO implements IUserDAO
{
	private DataSource dataSource;

	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 회원 예약 리스트 출력 메소드
		@Override
		public ArrayList<UserDTO> userReservationList(String UserId) throws SQLException
		{
			ArrayList<UserDTO> result = new ArrayList<UserDTO>();
			
			Connection conn = dataSource.getConnection();
			
			String sql = "SELECT ROWNUM, U.NAME AS NAME, P.IMG AS IMG, E.PRC AS PRC, R.DAY AS DAY, R.RSVTN_CD AS CD"
					+ " FROM USR_TBL U, EST_TBL E, RSVTN_TBL R, PROD_TBL P"
					+ " WHERE U.USR_ID = R.USR_ID"
					+ " AND R.PROD_CD = P.PROD_CD"
					+ " AND U.USR_ID = E.USR_ID"
					+ " AND P.PROD_CD = E.PROD_CD"
					+ " AND U.USR_ID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			
			ResultSet rs = pstmt.executeQuery();
			UserDTO dto = null;
			
			while (rs.next())
			{
				dto = new UserDTO();
				
				dto.setRnum(rs.getString("ROWNUM"));
				dto.setName(rs.getString("NAME"));
				dto.setImg(rs.getString("IMG"));
				dto.setPrc(rs.getInt("PRC"));
				dto.setDt(rs.getString("DAY"));
				dto.setCd(rs.getString("CD"));
				
				result.add(dto);
			}
			conn.close();
			rs.close();
			pstmt.close();
			
			return result;
		}
		
	
	// 회원 예약 삭제 메소드
	@Override
	public int userReservationDelete(String cd) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM RSVTN_TBL WHERE RSVTN_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}

	
	// 회원 상담 리스트 출력 메소드
	@Override
	public ArrayList<UserDTO> userAdviceList(String UserId) throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT ROWNUM, P.IMG AS IMG, P.NAME AS NAME, A.CTNT AS CTNT, A.DT AS DT , R.CTNT AS RESULT"
				+ " FROM USR_TBL U, ADV_TBL A, PROD_TBL P, RST_TBL R"
				+ " WHERE U.USR_ID = A.USR_ID"
				+ " AND A.PROD_CD = P.PROD_CD"
				+ " AND A.RST_CD = R.RST_CD "
				+ " AND U.USR_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, UserId);
		
		
		ResultSet rs = pstmt.executeQuery();
		UserDTO dto = null;
		
		while (rs.next())
		{
			dto = new UserDTO();
			
			dto.setRnum(rs.getString("ROWNUM"));
			dto.setImg(rs.getString("IMG"));
			dto.setName(rs.getString("NAME"));
			dto.setCtnt(rs.getString("CTNT"));
			dto.setDt(rs.getString("DT"));
			dto.setResult(rs.getString("RESULT"));
			result.add(dto);
		}
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}

	
	// 회원 찜 리스트 출력 메소드
	@Override
	public ArrayList<UserDTO> userSelectList(String UserId) throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT ROWNUM, P.IMG AS IMG, P.NAME AS NAME, S.DT AS DT, S.SEL_CD AS CD"
				+ " FROM USR_TBL U, SEL_TBL S, PROD_TBL P"
				+ " WHERE U.USR_ID = S.USR_ID"
				+ " AND S.PROD_CD = P.PROD_CD"
				+ " AND U.USR_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, UserId);
		
		ResultSet rs = pstmt.executeQuery();
		UserDTO dto = null;
		
		while (rs.next())
		{
			dto = new UserDTO();
			
			dto.setRnum(rs.getString("ROWNUM"));
			dto.setImg(rs.getString("IMG"));
			dto.setName(rs.getString("NAME"));
			dto.setDt(rs.getString("DT"));
			dto.setCd(rs.getString("CD"));
			result.add(dto);
		}
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}
	

	// 회원 찜 리스트 삭제 메소드
	@Override
	public int userSelectDelete(String cd) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM SEL_TBL WHERE SEL_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// 회원 상품평 리스트 출력 메소드
	@Override
	public ArrayList<UserDTO> userCommentList(String UserId) throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT ROWNUM, P.IMG AS IMG, U.NAME AS NAME, PC.CTNT AS CTNT, PC.DT AS DT"
				+ " FROM USR_TBL U, PROD_CMT_TBL PC, PROD_TBL P"
				+ " WHERE U.USR_ID = PC.USR_ID"
				+ " AND PC.PROD_CD = P.PROD_CD"
				+ " AND U.USR_ID=? ";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, UserId);
		
		
		ResultSet rs = pstmt.executeQuery();
		UserDTO dto = null;
		
		while (rs.next())
		{
			dto = new UserDTO();
			
			dto.setRnum(rs.getString("ROWNUM"));
			dto.setImg(rs.getString("IMG"));
			dto.setName(rs.getString("NAME"));
			dto.setCtnt(rs.getString("CTNT"));
			dto.setDt(rs.getString("DT"));
			
			result.add(dto);
		}
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}


	// 회원 QNA 리스트 출력 메소드
	@Override
	public ArrayList<UserDTO> userQnaList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException
	{
		ArrayList<UserDTO> result = new ArrayList<UserDTO>();
		
		Connection conn = dataSource.getConnection();
		
	
		searchValue = "%"+searchValue+"%";
		
		String sql = "SELECT * FROM(SELECT ROW_NUMBER() OVER (ORDER BY Q.USR_QNA_CD DESC)AS RNUM"
				+ ", Q.SBJCT AS SBJCT, Q.CTNT AS CTNT, U.NAME AS NAME, Q.DT AS DT"
				+ ", Q.CNT AS CNT, Q.USR_QNA_CD AS CD"
				+ " FROM QUSR_TBL Q, USR_TBL U WHERE Q.USR_ID = U.USR_ID AND " + searchKey + " LIKE ?)"
				+ " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		UserDTO dto = null;
		
		while (rs.next())
		{
			dto = new UserDTO();
			
			dto.setRnum(rs.getString("RNUM"));
			dto.setSbjct(rs.getString("SBJCT"));
			dto.setName(rs.getString("NAME"));
			dto.setDt(rs.getString("DT"));
			dto.setCnt(rs.getString("CNT"));
			dto.setCd(rs.getString("CD"));
			
			result.add(dto);
		}
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}

	
	// 특정 QNA 글 내용 출력 메소드
	@Override
	public UserDTO userQnaArticle(String cd) throws SQLException
	{
		UserDTO result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT ROWNUM, Q.SBJCT AS SBJCT, Q.CTNT AS CTNT, U.NAME AS NAME"
				+ ", Q.DT AS DT, Q.CNT AS CNT, Q.USR_QNA_CD AS CD"
				+ " FROM QUSR_TBL Q, USR_TBL U"
				+ " WHERE Q.USR_ID = U.USR_ID"
				+ " AND Q.USR_QNA_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new UserDTO();
			
			result.setRnum(rs.getString("ROWNUM"));
			result.setSbjct(rs.getString("SBJCT"));
			result.setCtnt(rs.getString("CTNT"));
			result.setName(rs.getString("NAME"));
			result.setDt(rs.getString("DT"));
			result.setCnt(rs.getString("CNT"));
			result.setCd(rs.getString("CD"));
			
		}
		conn.close();
		pstmt.close();
		rs.close();
		
		return result;
	}


	// QNA 생성 메소드
	@Override
	public int userQnaCreate(UserDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO QUSR_TBL(USR_QNA_CD, USR_ID, SBJCT, CTNT)"
				+ " VALUES(QUSR_SEQ.NEXTVAL, 'JHS', ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getSbjct());
		pstmt.setString(2, dto.getCtnt());
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 글 클릭시 조회수 +1 해주는 메소드
	@Override
	public int updateCount(String cd) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE QUSR_TBL SET CNT = NVL(CNT, 0)+1 WHERE USR_QNA_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 삭제 메소드
	@Override
	public int userQnaDelete(String cd, String UserId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM QUSR_TBL WHERE USR_QNA_CD=? AND USR_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		pstmt.setString(2, UserId);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	@Override
	public UserDTO userQnaUpdateSend(String cd) throws SQLException
	{
		UserDTO result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT Q.SBJCT AS SBJCT, Q.CTNT AS CTNT, Q.USR_QNA_CD AS CD"
				+ " FROM QUSR_TBL Q, USR_TBL U"
				+ " WHERE Q.USR_ID = U.USR_ID"
				+ " AND Q.USR_QNA_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new UserDTO();
			
			result.setSbjct(rs.getString("SBJCT"));
			result.setCtnt(rs.getString("CTNT"));
			result.setCd(rs.getString("CD"));
		}
		conn.close();
		pstmt.close();
		rs.close();
		
		return result;
	}


	// QNA 수정시 변경된 사항을 등록하는 메소드
	@Override
	public int userQnaUpdate(UserDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE QUSR_TBL SET SBJCT = ?, CTNT=? WHERE USR_QNA_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getSbjct());
		pstmt.setString(2, dto.getCtnt());
		pstmt.setString(3, dto.getCd());
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 모든 갯수를 출력하는 메소드
	@Override
	public int maxNum(String searchKey, String searchValue) throws SQLException
	{
		int result = 0;
		
		searchValue = "%" + searchValue + "%";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NVL(COUNT(*),0) AS MAX"
				+ " FROM QUSR_TBL Q, USR_TBL U WHERE Q.USR_ID = U.USR_ID AND " + searchKey + " LIKE ?";
		
		System.out.println(searchKey);
		System.out.println(searchValue);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getInt("MAX");
		
		
		conn.close();
		pstmt.close();
		rs.close();
		
		return result;
	}


	// QNA 특정글에 달린 댓글 출력 메소드
	@Override
	public UserDTO userQnaComment(String cd) throws SQLException
	{
		UserDTO result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT QA.ADMIN_CD AS ADMIN, QA.CTNT AS CTNT, QA.DT AS DT"
				+ " FROM QAU_CMT_TBL QA, QUSR_TBL QU"
				+ " WHERE QA.USR_QNA_CD = QU.USR_QNA_CD"
				+ " AND QU.USR_QNA_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new UserDTO();
			
			result.setAdmin(rs.getString("ADMIN"));
			result.setCtnt(rs.getString("CTNT"));
			result.setDt(rs.getString("DT"));
			
		}
		conn.close();
		pstmt.close();
		rs.close();
		
		return result;
	}
	

	@Override
	public String userWar1(String UserId) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT W1.CTNT AS CTNT FROM USR_TBL U, USR_WAR1_TBL W1 WHERE U.USR_ID = W1.USR_ID AND U.USR_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, UserId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getString("CTNT");
		}
		
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}

	@Override
	public String userWar2(String UserId) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT W2.CTNT AS CTNT FROM USR_TBL U, USR_WAR2_TBL W2 WHERE U.USR_ID = W2.USR_ID AND U.USR_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, UserId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getString("CTNT");
		}
		
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}

	@Override
	public String userWar3(String UserId) throws SQLException
	{
		String result = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT W3.CTNT AS CTNT FROM USR_TBL U, USR_WAR3_TBL W3 WHERE U.USR_ID = W3.USR_ID AND U.USR_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, UserId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getString("CTNT");
		}
		
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	
}
