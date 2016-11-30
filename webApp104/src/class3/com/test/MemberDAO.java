package class3.com.test;

import java.sql.*;
import java.util.ArrayList;

import class3.com.util.DBConn;

public class MemberDAO
{	
	private Connection conn;
	
	// 데이터베이스 연결
	public Connection Connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		
		return conn;
	}
	
	// 인원수 확인 메소드
	public int count() throws SQLException
	{
		int result = 0; 
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			result = rs.getInt("COUNT"); 
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	// 멤버 추가
	public int add(MemberVO member) throws SQLException
	{
		int result = 0;
		
		//쿼리문 작성
		String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL) "
				+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", member.getName(),member.getTel());
		Statement stmt = conn.createStatement();
		
		// 쿼리문 실행
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		return result;
	}
	
	// 멤버 조회
	public ArrayList<MemberVO> lists() throws SQLException
	{
		ArrayList<MemberVO> result = new ArrayList<MemberVO>();
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		Statement stmt = conn.createStatement();
		
		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		// 쿼리문 실행 후 반환값 전달
		while (rs.next())
		{
			MemberVO member = new MemberVO();
			
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			
			result.add(member);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 멤버 번호 검색
	public MemberVO search(String sid) throws SQLException
	{
		MemberVO result = null;
		// 쿼리문 준비
		String sql = String.format("SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID = %s", sid);
		
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result = new MemberVO();
			result.setName(rs.getString("NAME"));
			result.setTel(rs.getString("TEL"));
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	
	// 멤버 수정
	public int modify(MemberVO member) throws SQLException
	{
		int result = 0;
		// 쿼리문 준비
		String sql = String.format("UPDATE TBL_MEMBER SET NAME = '%s'"
				+ " ,TEL = '%s' WHERE SID = %s", member.getName(),member.getTel(),member.getSid());
		Statement stmt = conn.createStatement();
		// 쿼리문 실행
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		return result;
	}
	
	// 멤버 삭제
	public int remove(String sid) throws SQLException
	{
		int result = 0;
		// 쿼리문 준비
		String sql = String.format("DELETE FROM TBL_MEMBER WHERE SID = %s", sid);
		Statement stmt = conn.createStatement();
		
		// 쿼리문 실행
		result = stmt.executeUpdate(sql);
		
		return result;
	}
	
	// 삭제를 진행하기 위해 해당 sid에 점수가 있는지 확인 하기 위한 메소드
	public int delete(String sid) throws SQLException
	{
		
		int result = 0;
		
		// 쿼리문 준비
		String sql = String.format("SELECT COUNT(*) AS COUNT "
				                 + "FROM TBL_MEMBERSCORE WHERE SID=%s", sid);
		
		Statement stmt = conn.createStatement();
		
		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		// 반환값 담기
		while(rs.next()){
			
			result = rs.getInt("COUNT"); 
		}
		rs.close();
		stmt.close();
		
		return result;
	}	
		
	// DB 연결종료
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
