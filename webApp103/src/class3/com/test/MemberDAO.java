/*====================================
		MemberDAO.java
====================================*/
package class3.com.test;

import java.sql.*;
import java.util.ArrayList;

import class3.com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력용 메소드 정의
	public int add(MemberVO member) throws SQLException
	{
		int result = 0;
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		// 쿼리문 준비
		String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				+ "VALUES(MEMBERSEQ.NEXTVAL,'%s','%s');", member.getName(), member.getTel());
		
		// 쿼리문 실행 및 결과값 담기
		result = stmt.executeUpdate(sql);
		
		// 값 반환 시키기
		return result;
	}
	
	public ArrayList<MemberVO> lists() throws SQLException
	{
		ArrayList<MemberVO> result = new ArrayList<MemberVO>();
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		// 쿼리문 실행
		ResultSet rs = stmt.executeQuery(sql);
		
		// 반환되는 값 set 시키기
		while(rs.next())
		{
			MemberVO member = new MemberVO();
			
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			
			result.add(member);
		}
		rs.close();
		// 결과값 반환
		return result; 
	}
	
	//인원수 확인용 메소드
	public int count() throws SQLException
	{
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 작성
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		
		// 쿼리문 실행 및 결과 값 담기
		ResultSet rs = stmt.executeQuery(sql);
		
		// 결과값 반환된 것 result 에 담기
		while (rs.next())
		{
			result = rs.getInt("COUNT");		//rs.getInt(1);
		}
		rs.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드 정의
	public void close() throws SQLException
	{
		DBConn.close();
	}
}
