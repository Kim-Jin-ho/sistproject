package class3.com.test;

import java.sql.*;
import java.util.ArrayList;

import class3.com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;
	
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		
	}
	
	public int add(ScoreDTO score) throws SQLException
	{
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		// 쿼리문 준비
		String sql = String.format("INSERT INTO TBL_SCORE(SID,NAME,KOR,ENG,MAT)"
				+ " VALUES(SCORESEQ.NEXTVAL,'%s',%d,%d,%d)"
				, score.getName(), score.getKor(),score.getEng(),score.getMat());
		
		// 안나와서 테스트 했었음
		//System.out.println(sql);
		// 쿼리문 실행 및 결과값 담기
		result = stmt.executeUpdate(sql);
		
		return result;
	}
	
	
	// 학생수 카운트
	public int count() throws SQLException
	{
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		ResultSet rs =  stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		return result;
	}
	
	// 학생 조회 객체
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
			
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 작성
		String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) "
				+ " AS TOT, TRUNC((KOR+ENG+MAT)/3,1) AS AVG, "
				+ " RANK() OVER (ORDER BY (KOR+ENG+MAT)/3 DESC) AS RANK FROM TBL_SCORE";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO score = new ScoreDTO();
			
			score.setSid(rs.getString("SID"));
			score.setName(rs.getString("NAME"));
			score.setKor(rs.getInt("KOR"));
			score.setEng(rs.getInt("ENG"));
			score.setMat(rs.getInt("MAT"));
			score.setTot(rs.getInt("TOT"));
			score.setAvg(rs.getDouble("AVG"));
			score.setRank(rs.getInt("RANK"));
			
			result.add(score);
		}
		return result;
	}
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
}
