package class3.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.sql.DataSource;

public class WarningDAO implements IWarningDAO
{
	
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	
	// 경고 추가 메소드1
	@Override
	public int add1(Warning warning) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO CMPNY_WAR1_TBL (CMPNY_ID, CTNT) VALUES (?, ?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		
		pstmt.setString(1, warning.getCmpny_id());
		pstmt.setString(2, warning.getWarning());
		
		System.out.println(sql);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	
	
	}
	
	// 경고 추가 메소드
	@Override
	public int add2(Warning warning) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO CMPNY_WAR2_TBL (CMPNY_ID, CTNT) VALUES (?, ?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		
		pstmt.setString(1, warning.getCmpny_id());
		pstmt.setString(2, warning.getWarning());
		
		System.out.println(sql);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	
	
	}
	
	// 경고 추가 메소드3
	@Override
	public int add3(Warning warning) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO CMPNY_WAR3_TBL (CMPNY_ID, CTNT) VALUES (?, ?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		
		pstmt.setString(1, warning.getCmpny_id());
		pstmt.setString(2, warning.getWarning());
		
		System.out.println(sql);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	
	
	}


	@Override
	public int remove1(String cmpny_id) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM CMPNY_WAR1_TBL WHERE CMPNY_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cmpny_id);
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
		
	}


	@Override
	public int remove2(String cmpny_id) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM CMPNY_WAR2_TBL WHERE CMPNY_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cmpny_id);
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	
	}


	@Override
	public int remove3(String cmpny_id) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM CMPNY_WAR3_TBL WHERE CMPNY_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cmpny_id);
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	
	}


	@Override
	public int add4(Warning warning) throws SQLException {

		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO USR_WAR1_TBL (USR_ID, CTNT) VALUES (?, ?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		
		pstmt.setString(1, warning.getUsr_id());
		pstmt.setString(2, warning.getWarning());
		
		System.out.println(sql);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	
	}


	@Override
	public int add5(Warning warning) throws SQLException {

		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO USR_WAR2_TBL (USR_ID, CTNT) VALUES (?, ?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		
		pstmt.setString(1, warning.getUsr_id());
		pstmt.setString(2, warning.getWarning());
		
		System.out.println(sql);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	
	}


	@Override
	public int add6(Warning warning) throws SQLException {

		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO USR_WAR3_TBL (USR_ID, CTNT) VALUES (?, ?)";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		
		pstmt.setString(1, warning.getUsr_id());
		pstmt.setString(2, warning.getWarning());
		
		System.out.println(sql);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}


	@Override
	public int remove4(String usr_id) throws SQLException {

		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM USR_WAR1_TBL WHERE USR_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, usr_id);
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
		
	}


	@Override
	public int remove5(String usr_id) throws SQLException {


		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM USR_WAR2_TBL WHERE USR_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, usr_id);
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
	}


	@Override
	public int remove6(String usr_id) throws SQLException {


		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM USR_WAR3_TBL WHERE USR_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, usr_id);
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	
	}
	
	
	
	
	
	
	
	
}
