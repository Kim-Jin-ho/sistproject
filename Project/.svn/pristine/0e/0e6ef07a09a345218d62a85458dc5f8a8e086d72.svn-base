package class3.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class NoticeDAO implements INoticeDAO
{
	private DataSource dataSource;

	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 회원 QNA 리스트 출력 메소드
	@Override
	public ArrayList<NoticeDTO> noticeList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException
	{
		ArrayList<NoticeDTO> result = new ArrayList<NoticeDTO>();
		
		Connection conn = dataSource.getConnection();
		
	
		searchValue = "%"+searchValue+"%";
		
		String sql = "SELECT * FROM(SELECT ROW_NUMBER() OVER (ORDER BY N.NTC_CD DESC)AS RNUM"
				+ ", N.SBJCT AS SBJCT, N.CTNT AS CTNT, N.DT AS DT"
				+ ", N.CNT AS CNT, N.NTC_CD AS CD"
				+ " FROM NTC_TBL N, ADMIN_TBL A WHERE N.ADMIN_CD = A.ADMIN_CD AND " + searchKey + " LIKE ?)"
				+ " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		NoticeDTO dto = null;
		
		while (rs.next())
		{
			dto = new NoticeDTO();
			
			dto.setRnum(rs.getString("RNUM"));
			dto.setSbjct(rs.getString("SBJCT"));
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
	public NoticeDTO noticeArticle(String cd) throws SQLException
	{
		NoticeDTO result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT ROWNUM, SBJCT, CTNT"
				+ ", DT, CNT, NTC_CD AS CD"
				+ " FROM NTC_TBL"
				+ " WHERE NTC_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new NoticeDTO();
			
			result.setRnum(rs.getString("ROWNUM"));
			result.setSbjct(rs.getString("SBJCT"));
			result.setCtnt(rs.getString("CTNT"));
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
	public int noticeCreate(NoticeDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO NTC_TBL(NTC_CD, ADMIN_CD, SBJCT, CTNT)"
				+ " VALUES(NTC_TBL_SEQ.NEXTVAL, 'admin', ?, ?)";
		
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
		
		String sql = "UPDATE NTC_TBL SET CNT = NVL(CNT, 0)+1 WHERE NTC_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 삭제 메소드
	@Override
	public int noticeDelete(String cd) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM NTC_TBL WHERE NTC_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	@Override
	public NoticeDTO noticeUpdateSend(String cd) throws SQLException
	{
		NoticeDTO result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT N.SBJCT AS SBJCT, N.CTNT AS CTNT, N.NTC_CD AS CD"
				+ " FROM NTC_TBL N, ADMIN_TBL A"
				+ " WHERE N.ADMIN_CD = A.ADMIN_CD"
				+ " AND N.NTC_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new NoticeDTO();
			
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
	public int noticeUpdate(NoticeDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE NTC_TBL SET SBJCT = ?, CTNT=? WHERE NTC_CD = ?";
		
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
				+ " FROM NTC_TBL N, ADMIN_TBL A WHERE N.ADMIN_CD = A.ADMIN_CD AND " + searchKey + " LIKE ?";
		
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


	
	
	
}
