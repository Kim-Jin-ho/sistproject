package class3.com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class CmpnyDAO implements ICmpnyDAO
{
	private DataSource dataSource;

	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	

	// 회원 QNA 리스트 출력 메소드
	@Override
	public ArrayList<CmpnyDTO> cmpnyQnaList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException
	{
		ArrayList<CmpnyDTO> result = new ArrayList<CmpnyDTO>();
		
		Connection conn = dataSource.getConnection();
		
		searchValue = "%"+searchValue+"%";
		
		String sql = "SELECT * FROM(SELECT ROW_NUMBER() OVER (ORDER BY Q.CMPNY_QNA_CD DESC)AS RNUM"
				+ ", Q.SBJCT AS SBJCT, Q.CTNT AS CTNT, C.NAME AS NAME, Q.DT AS DT"
				+ ", Q.CNT AS CNT, Q.CMPNY_QNA_CD AS CD"
				+ " FROM QCMPNY_TBL Q, CMPNY_TBL C WHERE Q.CMPNY_ID = C.CMPNY_ID AND " + searchKey + " LIKE ?)"
				+ " WHERE RNUM>=? AND RNUM<=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, start);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		CmpnyDTO dto = null;
		
		while (rs.next())
		{
			dto = new CmpnyDTO();
			
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
	public CmpnyDTO cmpnyQnaArticle(String cd) throws SQLException
	{
		CmpnyDTO result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT ROWNUM, Q.SBJCT AS SBJCT, Q.CTNT AS CTNT, C.NAME AS NAME"
				+ ", Q.DT AS DT, Q.CNT AS CNT, Q.CMPNY_QNA_CD AS CD"
				+ " FROM QCMPNY_TBL Q, CMPNY_TBL C"
				+ " WHERE Q.CMPNY_ID = C.CMPNY_ID"
				+ " AND Q.CMPNY_QNA_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new CmpnyDTO();
			
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
	public int cmpnyQnaCreate(CmpnyDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO QCMPNY_TBL(CMPNY_QNA_CD, CMPNY_ID, SBJCT, CTNT)"
				+ " VALUES(QCMPNY_TBL_SEQ.NEXTVAL, '1111111111', ?, ?)";
		
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
		
		String sql = "UPDATE QCMPNY_TBL SET CNT = NVL(CNT, 0)+1 WHERE CMPNY_QNA_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 삭제 메소드
	@Override
	public int cmpnyQnaDelete(String cd) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM QCMPNY_TBL WHERE CMPNY_QNA_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	@Override
	public CmpnyDTO cmpnyQnaUpdateSend(String cd) throws SQLException
	{
		CmpnyDTO result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT Q.SBJCT AS SBJCT, Q.CTNT AS CTNT, Q.CMPNY_QNA_CD AS CD"
				+ " FROM QCMPNY_TBL Q, CMPNY_TBL C"
				+ " WHERE Q.CMPNY_ID = C.CMPNY_ID"
				+ " AND Q.CMPNY_QNA_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new CmpnyDTO();
			
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
	public int cmpnyQnaUpdate(CmpnyDTO dto) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE QCMPNY_TBL SET SBJCT = ?, CTNT=? WHERE CMPNY_QNA_CD = ?";
		
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
				+ " FROM QCMPNY_TBL Q, CMPNY_TBL C WHERE Q.CMPNY_ID = C.CMPNY_ID AND " + searchKey + " LIKE ?";
		
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
	public CmpnyDTO cmpnyQnaComment(String cd) throws SQLException
	{
		CmpnyDTO result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT QA.ADMIN_CD AS ADMIN, QA.CTNT AS CTNT, QA.DT AS DT"
				+ " FROM QAC_CMT_TBL QA, QCMPNY_TBL QC"
				+ " WHERE QA.CMPNY_QNA_CD = QC.CMPNY_QNA_CD"
				+ " AND QC.CMPNY_QNA_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new CmpnyDTO();
			
			result.setAdmin(rs.getString("ADMIN"));
			result.setCtnt(rs.getString("CTNT"));
			result.setDt(rs.getString("DT"));
			
		}
		conn.close();
		pstmt.close();
		rs.close();
		
		return result;
	}
	
	
	
}
