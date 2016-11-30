/*========================================
	MemberScoreDAO.java
	- 데이터베이스 액션 처리 전용 클래스
	  (TBL_MEMBERSCORE 테이블 전용 DAO)
=========================================*/

package class3.com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import class3.com.util.DBConn;

public class MemberScoreDAO {
	
	private Connection conn;
	
	// 데이터베이스 연결 전용 메소드
	public Connection Connection() throws ClassNotFoundException, SQLException{
		
		conn = DBConn.getConnection();
		
		return conn;
		
	}
	
	
	// 데이터 입력 담당 메소드
	public int add(MemberScoreDTO score) throws SQLException{
		
		int result = 0;
		
		String sql = String.format("INSERT INTO TBL_MEMBERSCORE(SID, KOR, ENG, MAT) "
				+ "VALUES(%s, %d, %d, %d)", score.getSid(), score.getKor(), score.getEng(), score.getMat());
		
		Statement stmt = conn.createStatement();
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
		
	}
	
	
	public ArrayList<MemberScoreDTO> lists() throws SQLException{
		
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		String sql ="SELECT SID, NAME, KOR ,ENG, MAT, (KOR+ENG+MAT) AS TOT, ((KOR+ENG+MAT)/3) AS AVG, RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		MemberScoreDTO score = null;
		
		while(rs.next()){
			
			score = new MemberScoreDTO();
			
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
		
		rs.close();
		stmt.close();
		
		return result;
		
	}
	
	/*
	 public ArrayList<MemberScoreDTO> lists() throws SQLException
	   {
	      // 전체 학생 데이터를 담을 ArrayList 자료구조 객체 생성
	      ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
	      
	      // sql 구문 준비
	      String sql = "SELECT SID, NAME, KOR, ENG, MAT"
	            + ", (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG"
	            + ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
	            + " FROM VIEW_MEMBERSCORE";
	      
	      // 작업객체 생성
	      Statement stmt = conn.createStatement();
	      
	      // 결과를 담을 ResultSet 객체 생성 및 sql 구문 전송
	      ResultSet rs = stmt.executeQuery(sql);
	      
	      // ResultSet에 담긴 결과를 담을 MemberScoreDTO 객체 선언
	      MemberScoreDTO score = null;
	      
	      // while 문을 통한 결과 MemberScoreDTO에 담기
	      while(rs.next())
	      {
	         // MemberScoreDTO 인스턴스 생성
	         score = new MemberScoreDTO();
	         score.setSid(rs.getString("SID"));
	         score.setName(rs.getString("NAME"));
	         score.setKor(rs.getInt("KOR"));
	         score.setEng(rs.getInt("ENG"));
	         score.setMat(rs.getInt("MAT"));
	         score.setTot(rs.getInt("TOT"));
	         score.setAvg(rs.getDouble("AVG"));
	         score.setRank(rs.getInt("RANK"));
	         
	         // MemberScoreDTO 객체를 ArrayList에 담기.
	         result.add(score);
	      }
	      
	      // ResultSet 종료
	      rs.close();
	      
	      // 작업객체 Statement 종료
	      stmt.close();
	      
	      
	      return result;
	      
	   } // end lists()
	   
	   */
	
	// 번호 검색 담당 메소드
	public MemberScoreDTO search(String sid) throws SQLException{
		
		MemberScoreDTO result = null;
		
		String sql = String.format("SELECT SID, NAME, KOR, ENG, MAT "
				+ "FROM VIEW_MEMBERSCORE WHERE SID=%s", sid);
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			result = new MemberScoreDTO();
			result.setName(rs.getString("NAME"));
			result.setKor(rs.getInt("KOR"));
			result.setEng(rs.getInt("ENG"));
			result.setMat(rs.getInt("MAT"));
			
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 성적 데이터 수정 담당 메소드
	public int modify(MemberScoreDTO score) throws SQLException{
		
		int result = 0;
		
		String sql = String.format("UPDATE TBL_MEMBERSCORE "
				+ "SET KOR=%d, ENG=%d, MAT=%d WHERE SID=%s"
				, score.getKor(), score.getEng(), score.getMat(), score.getSid());
		
		Statement stmt = conn.createStatement();
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
		
	}
	
	// 성적 데이터 삭제 담당 메소드
	public int remove(String sid) throws SQLException{
		
		int result = 0;
		
		String sql = String.format("DELETE FROM TBL_MEMBERSCORE "
				+ "WHERE SID=%s", sid);
		
		Statement stmt = conn.createStatement();
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
		
	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException{
		
		DBConn.close();
		
	}
	

}
