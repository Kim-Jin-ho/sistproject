/*======================================================
			EmployeeDAO.java
	- 직원 정보, 직위 정보, 부서 정보, 지역 정보의
	  입력 / 출력 / 삭제 기능 
=======================================================*/
package class3.com.test;

import java.sql.*;
import java.util.ArrayList;

import class3.com.util.DBConn;

public class EmployeeDAO
{
	// Connection 객체
	private Connection conn;
	
	// DB 연결
	public void connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// DB 연결 해제
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 출력 액션 ----------------------------------------------------------------------------------
	
	// 지역 정보 출력
	public ArrayList<EmployeeDTO> regionList() throws SQLException
	{
		ArrayList<EmployeeDTO> result = new ArrayList<EmployeeDTO>();
		
		// select 쿼리(regionview)
		String sql = "SELECT REGIONID, REGIONNAME, DELCHECK FROM REGIONVIEW";
		
		// 확인용
		System.out.println(sql);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		EmployeeDTO dto = null;
		
		while (rs.next())
		{
			dto = new EmployeeDTO();
			dto.setRegionId(rs.getString("REGIONID"));
			dto.setRegionName(rs.getString("REGIONNAME"));
			dto.setDelCheck(rs.getInt("DELCHECK"));				//-- 삭제 가능 여부 확인
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 직위 정보 출력
	public ArrayList<EmployeeDTO> positionList() throws SQLException
	{
		ArrayList<EmployeeDTO> result = new ArrayList<EmployeeDTO>();
		// select 쿼리(positionview)
		String sql  = "SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW";
		
		// 확인용
		System.out.println(sql);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		EmployeeDTO dto = null;
		
		while (rs.next())
		{
			dto = new EmployeeDTO();
			dto.setPositionId(rs.getString("POSITIONID"));
			dto.setPositionName(rs.getString("POSITIONNAME"));
			dto.setMinBasicPay(rs.getInt("MINBASICPAY"));
			dto.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 부서 정보 출력
	public ArrayList<EmployeeDTO> departmentList() throws SQLException
	{
		ArrayList<EmployeeDTO> result = new ArrayList<EmployeeDTO>();
		
		// select 쿼리(departmentview)
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK FROM DEPARTMENTVIEW";
		
		// 확인용 
		System.out.println(sql);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		EmployeeDTO dto = null;
		
		while (rs.next())
		{
			dto = new EmployeeDTO();
			
			dto.setDepartmentId(rs.getString("DEPARTMENTID"));
			dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			dto.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	public ArrayList<EmployeeDTO> employeeList() throws SQLException
	{
		ArrayList<EmployeeDTO> result = new ArrayList<EmployeeDTO>();
		
		// select 쿼리문 (employeeview)
		String sql = "SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY"
				   + ", LUNAR, LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME"
				   + ", POSITIONID, POSITIONNAME, REGIONID, REGIONNAME, BASICPAY, EXTRAPAY"
				   + ", PAY FROM EMPLOYEEVIEW";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		EmployeeDTO dto = null;
		
		while (rs.next())
		{
			dto = new EmployeeDTO();
			
			dto.setEmployeeId(rs.getString("EMPLOYEEID"));
			dto.setName(rs.getString("NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setBirthday(rs.getString("BIRTHDAY"));
			dto.setLunar(rs.getInt("LUNAR"));
			dto.setLunarName(rs.getString("LUNARNAME"));
			dto.setTelephone(rs.getString("TELEPHONE"));
			dto.setDepartmentId(rs.getString("DEPARTMENTID"));
			dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			dto.setPositionId(rs.getString("POSITIONID"));
			dto.setPositionName(rs.getString("POSITIONNAME"));
			dto.setRegionId(rs.getString("REGIONID"));
			dto.setRegionName(rs.getString("REGIONNAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setExtraPay(rs.getInt("EXTRAPAY"));
			dto.setPay(rs.getInt("PAY"));
			
			result.add(dto);
		}
		
		return result;
	}
	//---------------------------------------------------------------------------------- 출력 액션 
	
	// 입력액션 ----------------------------------------------------------------------------------
	// 지역 정보 입력
	public int regionInsert(EmployeeDTO dto) throws SQLException
	{
		int result = 0;
		
		// insert 쿼리문 구성
		String sql = "INSERT INTO TBL_REGION(REGIONID, REGIONNAME)VALUES(REGIONSEQ.NEXTVAL,?)";
		// 쿼리문 실행
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getRegionName());
		
		// 결과 반환
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 직위 정보 입력
	public int positionInsert(EmployeeDTO dto) throws SQLException
	{
		int result = 0;
		// insert 쿼리문 구성
		String sql = "INSERT INTO TBL_POSITION(POSITIONID,POSITIONNAME,MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL,?,?)";
		
		// 쿼리문 실행
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getPositionName());
		pstmt.setInt(2, dto.getMinBasicPay());
		
		// 결과 반환
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 부서 정보 입력
	public int departmentInsert(EmployeeDTO dto)
	{
		int result = 0;
		
		try
		{
			// insert 쿼리문 구성
			String sql = "INSERT INTO TBL_DEPARTMENT(DEPARTMENTID,DEPARTMENTNAME) VALUES(DEPARTMENTSEQ.NEXTVAL,?)";
			
			// 쿼리문 실행
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getDepartmentName());
			
			// 결과 반환
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}
	
	// 직원 정보 입력
	public int employeeInsert(EmployeeDTO dto)
	{
		int result = 0;
		
		try
		{
			// insert 쿼리문 구성
			String sql = "INSERT INTO TBL_EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY"
					+ ", LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY )"
					+ " VALUES(EMPLOYEESEQ.NEXTVAL, ?, ?, "
					+ " TO_DATE(?,'YYYY-MM-DD')"
					+ ", ?, ?, ?,?,?, ?, ? )";
			// 쿼리문 실행
			PreparedStatement pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSsn());
			pstmt.setString(3, dto.getBirthday());
			pstmt.setInt(4, dto.getLunar());
			pstmt.setString(5, dto.getTelephone());
			pstmt.setString(6, dto.getDepartmentId());
			pstmt.setString(7, dto.getPositionId());
			pstmt.setString(8, dto.getRegionId());
			pstmt.setInt(9, dto.getBasicPay());
			pstmt.setInt(10, dto.getExtraPay());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
	}
	//---------------------------------------------------------------------------------- 입력 액션
	
	// 최저 기본급 
	public int minBasicPay(String jikwi_id) throws SQLException
	{
		int result = 0;
		
		String sql= String.format("SELECT MINBASICPAY FROM TBL_POSITION WHERE POSITIONID= %s", jikwi_id);
		
		Statement stmt = conn.createStatement();
		System.out.println(sql);
		
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next())
		{
			result = rs.getInt("MINBASICPAY");
		}
		return result;
	}
	
	//삭제 액션 ----------------------------------------------------------------------------------
	
	// 지역 정보 삭제
	public int regionDelete(String id) throws SQLException
	{
		int result = 0;
		
		//delete 쿼리문 작성
		String sql = "DELETE FROM TBL_REGION WHERE REGIONID = ?";
		
		// 쿼리문 실행
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		System.out.println(sql);
		// 결과값 반환
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		
		return result;
	}
	
	// 직위 정보 삭제
	public int positionDelete(String id) throws SQLException
	{
		int result = 0;
		
		// deletd 쿼리문 작성
		String sql = String.format("DELETE FROM TBL_POSITION WHERE POSITIONID = %s", id);
		System.out.println(sql);
		// 쿼리문 실행
		Statement stmt= conn.createStatement();
		
		// 결과값 반환
		result = stmt.executeUpdate(sql);
		
		return result;		
	}
	
	// 부서 정보 삭제
	public int departmentDelete(String id) throws SQLException
	{
		int result = 0;
		// delete 쿼리문 작성
		String sql = String.format("DELETE FROM TBL_DEPARTMENT WHERE DEPARTMENTID = %s", id);
		System.out.println(sql);
		// 쿼리문 실행
		Statement stmt = conn.createStatement();
		
		// 결과값 반환
		result = stmt.executeUpdate(sql);
		return result;
	}
	
	// 직원 정보 삭제
	public int empolyeeDelete(String id) throws SQLException
	{
		int result = 0;
		// delete 쿼리문 작성
		String sql = String.format("DELETE FROM TBL_EMPLOYEE WHERE EMPLOYEEID= %s", id);
		System.out.println(sql);
		// 쿼리문 실행
		Statement stmt = conn.createStatement();
		
		// 결과값 반환
		result = stmt.executeUpdate(sql);
		
		return result;
	}
	//---------------------------------------------------------------------------------- 삭제 액션
	
	// 수정 액션 ----------------------------------------------------------------------------------
	// 지역 정보 수정
	public int regionUpdate(EmployeeDTO dto)
	{
		int result = 0;
		
		try
		{
			// update 쿼리문 구성
			String sql = "UPDATE TBL_REGION SET REGIONNAME=? WHERE REGIONID= ?";
			
			// 쿼리문 실행
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getRegionName());
			pstmt.setString(2, dto.getRegionId());
			
			// 확인
			System.out.println(sql);
			
			// 결과값 반환
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;		
	}
	// 직위 정보 수정
	public int positionUpdate(EmployeeDTO dto) throws SQLException
	{
		int result = 0;
		// update 쿼리문 구성
		String sql = String.format("UPDATE TBL_POSITION SET POSITIONNAME='%s' WHERE POSITIONID=%s", dto.getPositionName(),dto.getPositionId());
		
		// 확인
		System.out.println(sql);
		
		// 쿼리문 실행
		Statement stmt = conn.createStatement();
		
		// 결과값 반환
		result = stmt.executeUpdate(sql);
		return result;		
	}
	// 부서 정보 수정
	public int departmentUpdate(EmployeeDTO dto) throws SQLException
	{
		int result = 0;
		// update 쿼리문 구성
		String sql = String.format("UPDATE TBL_DEPARTMENT SET DEPARTMENTNAME='%s' WHERE DEPARTMENTID=%s", dto.getDepartmentName(),dto.getDepartmentId());
		
		// 확인
		System.out.println(sql);
		
		// 쿼리문 실행
		Statement stmt = conn.createStatement();
		
		// 결과값 반환
		result = stmt.executeUpdate(sql);		
		return result;		
	}
	
	// 직원 정보 수정
	public int employeeUpdate(EmployeeDTO dto) throws SQLException
	{
		int result = 0;
		//update 쿼리문 구성
		String sql = String.format("UPDATE TBL_EMPLOYEE SET NAME='%s', SSN='%s'"
				+ ", BIRTHDAY=TO_DATE('%s','YYYY-MM-DD'),LUNAR= %s"
				+ ", TELEPHONE ='%s', DEPARTMENTID=%s, POSITIONID=%s"
				+ ", REGIONID =%s, BASICPAY=%d, EXTRAPAY=%d WHERE EMPLOYEEID=%s"
				, dto.getName(), dto.getSsn(), dto.getBirthday(), dto.getLunar(), dto.getTelephone()
				, dto.getDepartmentId(), dto.getPositionId(), dto.getRegionId(), dto.getBasicPay(), dto.getExtraPay()
				, dto.getEmployeeId());
		// 확인
		System.out.println(sql);
		
		// 쿼리문 실행
		Statement stmt = conn.createStatement();
		
		// 결과값 반환
		result = stmt.executeUpdate(sql);
		return result;				
	}
	//---------------------------------------------------------------------------------- 삭제 액션
}
