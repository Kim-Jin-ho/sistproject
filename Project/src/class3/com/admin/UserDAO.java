/*====================================
 * MemberDAO.java
 * - 데이터베이스 액션처리 전용 클래스
 * - Connection 객체에 대한 의존성 주입
 * - Setter 메소드 추가
 =====================================*/
package class3.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;


public class UserDAO implements IUserDAO
{
	private DataSource dataSource;

	//setter 메소드
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	
//관리자 개인회원리스트 출력========================================================================================
	@Override
	public ArrayList<User> list() throws SQLException 
	{
		ArrayList<User> result = new ArrayList<User>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT USR_ID, NAME, TEL, ADDR1"
				+ ", GENDER, WARNCOUNT "
				+ "FROM USR_VIEW ORDER BY 2";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		User user = null;
		
		while (rs.next()) 
		{
			user = new User();
		
			user.setUsr_Id(rs.getString("USR_ID"));
			user.setName(rs.getString("NAME"));
			user.setTel(rs.getString("TEL"));
			user.setAddr1(rs.getString("ADDR1"));
			user.setGndrCtnt(rs.getString("GENDER"));
			user.setWarncount(rs.getInt("WARNCOUNT"));
			
			result.add(user);
		
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
			
	
		
		
	}
	
	
	
//관리자 개인회원별 경고 사유 출력----------------------------------------------------------------- 
		@Override
		public ArrayList<User> warningList(String usr_Id) throws SQLException
		{
			ArrayList<User> result = new ArrayList<User>();
			
			Connection conn = dataSource.getConnection();
			
			String sql = "SELECT USR_ID, WARN1, WARN2, WARN3 FROM AD_UWARN_VIEW WHERE USR_ID=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, usr_Id);
			ResultSet rs = pstmt.executeQuery();
			
			User user = null;
			
			while (rs.next()) 
			{
				user = new User();
			
				user.setUsr_Id(rs.getString("USR_ID"));
				user.setWarn1(rs.getString("WARN1"));
				user.setWarn2(rs.getString("WARN2"));
				user.setWarn3(rs.getString("WARN3"));
				
				result.add(user);
			
			}
			
			rs.close();
			pstmt.close();
			conn.close();
			
			
			return result;
			
			
			
		}	


		
		
	
};