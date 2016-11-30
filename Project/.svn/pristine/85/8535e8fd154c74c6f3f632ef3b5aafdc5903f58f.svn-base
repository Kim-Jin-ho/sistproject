package class3.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;



public class QnaDAO implements IQnaDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	// 회원 QNA 리스트 출력 메소드
	@Override
	public ArrayList<Qna> userQnaList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException
	{
		ArrayList<Qna> result = new ArrayList<Qna>();
		
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
		Qna qna = null;
		
		while (rs.next())
		{
			qna = new Qna();
			
			qna.setRnum(rs.getString("RNUM"));
			qna.setSbjct(rs.getString("SBJCT"));
			qna.setName(rs.getString("NAME"));
			qna.setDt(rs.getString("DT"));
			qna.setCnt(rs.getString("CNT"));
			qna.setCd(rs.getString("CD"));
			
			result.add(qna);
		}
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}

	
	// 특정 QNA 글 내용 출력 메소드
	@Override
	public Qna userQnaArticle(String cd) throws SQLException
	{
		Qna result = null;
		
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
			result = new Qna();
			
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
	public int userQnaCreate(Qna qna) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO QUSR_TBL(USR_QNA_CD, USR_ID, SBJCT, CTNT)"
				+ " VALUES(QUSR_SEQ.NEXTVAL, 'JHS', ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, qna.getSbjct());
		pstmt.setString(2, qna.getCtnt());
		
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
	public int userQnaDelete(String cd) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM QUSR_TBL WHERE USR_QNA_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}


	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	@Override
	public Qna userQnaUpdateSend(String cd) throws SQLException
	{
		Qna result = null;
		
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
			result = new Qna();
			
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
	public int userQnaUpdate(Qna qna) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE QUSR_TBL SET SBJCT = ?, CTNT=? WHERE USR_QNA_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, qna.getSbjct());
		pstmt.setString(2, qna.getCtnt());
		pstmt.setString(3, qna.getCd());
		
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
	public Qna userQnaComment(String cd) throws SQLException
	{
		Qna result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT QA.ADMIN_CD AS ADMIN, QA.CTNT AS CTNT, QA.DT AS DT, QA.USR_ADMIN_CMT_CD AS CD"
				+ " FROM QAU_CMT_TBL QA, QUSR_TBL QU"
				+ " WHERE QA.USR_QNA_CD = QU.USR_QNA_CD"
				+ " AND QU.USR_QNA_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new Qna();
			
			result.setAdmin(rs.getString("ADMIN"));
			result.setCtnt(rs.getString("CTNT"));
			result.setDt(rs.getString("DT"));
			result.setCd(rs.getString("CD"));
			
		}
		conn.close();
		pstmt.close();
		rs.close();
		
		return result;
	}
	
	
	// 관리자 코멘트 입력
	public int addCmt(Qna qna) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO QAU_CMT_TBL(USR_ADMIN_CMT_CD, USR_QNA_CD, ADMIN_CD, CTNT, DT) "
				+ "VALUES (QAU_CMT_TBL_SEQ.NEXTVAL, ?, 'admin', ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, qna.getCd());
		pstmt.setString(2, qna.getCtnt());
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}
	
	
	@Override
	public int delCmt(String cd) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM QAU_CMT_TBL WHERE USR_ADMIN_CMT_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	
	
	
	
	// 회원 QNA 리스트 출력 메소드
	@Override
	public ArrayList<Qna> cmpnyQnaList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException
	{
		ArrayList<Qna> result = new ArrayList<Qna>();
		
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
		Qna qna = null;
		
		while (rs.next())
		{
			qna = new Qna();
			
			qna.setRnum(rs.getString("RNUM"));
			qna.setSbjct(rs.getString("SBJCT"));
			qna.setName(rs.getString("NAME"));
			qna.setDt(rs.getString("DT"));
			qna.setCnt(rs.getString("CNT"));
			qna.setCd(rs.getString("CD"));
			
			result.add(qna);
		}
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}

	
	// 특정 QNA 글 내용 출력 메소드
	@Override
	public Qna cmpnyQnaArticle(String cd) throws SQLException
	{
		Qna result = null;
		
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
			result = new Qna();
			
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
	public int cmpnyQnaCreate(Qna dto) throws SQLException
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
	public int updateCount2(String cd) throws SQLException
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
	public Qna cmpnyQnaUpdateSend(String cd) throws SQLException
	{
		Qna result = null;
		
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
			result = new Qna();
			
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
	public int cmpnyQnaUpdate(Qna dto) throws SQLException
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
	public int maxNum2(String searchKey, String searchValue) throws SQLException
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
	public Qna cmpnyQnaComment(String cd) throws SQLException
	{
		Qna result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT QA.ADMIN_CD AS ADMIN, QA.CTNT AS CTNT, QA.DT AS DT, QA.QNA_ADMIN_CMPNY_CD AS CD"
				+ " FROM QAC_CMT_TBL QA, QCMPNY_TBL QC"
				+ " WHERE QA.CMPNY_QNA_CD = QC.CMPNY_QNA_CD"
				+ " AND QC.CMPNY_QNA_CD = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			result = new Qna();
			
			result.setAdmin(rs.getString("ADMIN"));
			result.setCtnt(rs.getString("CTNT"));
			result.setDt(rs.getString("DT"));
			result.setCd(rs.getString("CD"));
			
		}
		conn.close();
		pstmt.close();
		rs.close();
		
		return result;
	}
	
	
	// 관리자 코멘트 입력
	public int addCmt2(Qna qna) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO QAC_CMT_TBL(QNA_ADMIN_CMPNY_CD, CMPNY_QNA_CD, ADMIN_CD, CTNT, DT) "
				+ "VALUES (QAC_CMT_TBL_SEQ.NEXTVAL, ?, 'admin', ?, SYSDATE)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, qna.getCd());
		pstmt.setString(2, qna.getCtnt());
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}
	
	//관리자 코멘트 삭제
	@Override
	public int delCmt2(String cd) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM QAC_CMT_TBL WHERE QNA_ADMIN_CMPNY_CD=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cd);
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}
	
	
}
