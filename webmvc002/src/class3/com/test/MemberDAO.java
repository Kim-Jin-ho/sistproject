/*========================================
    MemberDAO.java
    - 데이터 베이스 액션 처리 전용 객체
========================================*/

package class3.com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import class3.com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결
	public void connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터베이스 연결 해제
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 데이터 입력
	public int insertQuery(MemberDTO dto) throws SQLException
	{
		int result = 0;
				
		String sql = String.format("INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL) "
				+ "VALUES('%s', CRYPTPACK.ENCRYPT('%s', '%s'), '%s', '%s', '%s')"
				, dto.getId(), dto.getPw(), dto.getId(), dto.getName(), dto.getTel(), dto.getEmail());
		
		System.out.println(sql);
		
		Statement stmt = conn.createStatement();
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();	
		
		return result;
	}
	
	// 리스트 출력
	// ※ 반환 자료형
	//  - 한 명 분의 한 항목을 반환하는 경우 → String
	//  - 한 명 분의 여러 항목을 반환하는 경우 → MemberDTO
	//  - 여러 명 분의 여러 항목을 반환하는 경우 → 컬렉션 (ArrayList<MemberDTO>)
	public ArrayList<MemberDTO> list() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT ID, NAME, TEL, EMAIL FROM TBL_MEMBERLIST ORDER BY ID";
		System.out.println(sql);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		MemberDTO dto = null;
		
		while (rs.next())
		{
			dto = new MemberDTO();
			dto.setId(rs.getString("ID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setEmail(rs.getString("EMAIL"));
			
			result.add(dto);
		}
		
		stmt.close();
		rs.close();
		
		return result;
	}
	
}
