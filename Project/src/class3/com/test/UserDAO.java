/*====================================
 * MemberDAO.java
 * - 데이터베이스 액션처리 전용 클래스
 * - Connection 객체에 대한 의존성 주입
 * - Setter 메소드 추가
 =====================================*/
package class3.com.test;

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
//일반회원 회원가입 ==========================================================================
	@Override
	public int add(User user) throws SQLException
	{
		int result =0;
		
		Connection conn = dataSource.getConnection();
		
		// 따움표 지워야됨
		String sql = "INSERT INTO USR_TBL(USR_ID, GNDR_CD, NAME, PWD, EMAIL,TEL, BRTHDAY, ADDR_NO, ADDR1, ADDR2)"
				+ " VALUES(?, ?, ?, ?, ?, ?, TO_DATE(?, 'YY-MM-DD'), ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUsr_Id());
		pstmt.setInt(2, user.getGndr_Cd());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getPwd());
		pstmt.setString(5, user.getEmail());
		pstmt.setString(6, user.getTel());
		pstmt.setString(7, user.getBirth());
		pstmt.setInt(8, user.getAddr_No());
		pstmt.setString(9, user.getAddr1());
		pstmt.setString(10, user.getAddr2());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();		
		
		return result;
	}

//일반회원 ID중복체크==========================================================================
	@Override 
	public int idcheck(String id) throws SQLException
	{
		int result =0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM USR_TBL_VIEW WHERE USR_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			result = rs.getInt("COUNT");			
		}
		rs.close();
		conn.close();
		pstmt.close();
		
		return result;
	}


//일반회원 ID찾기 ==========================================================================
	@Override
	public String idsearch(String name, String tel) throws SQLException
	{
		String usrId= "";
		Connection conn = dataSource.getConnection();
		String sql = "SELECT USR_ID FROM USR_TBL_VIEW WHERE NAME=? AND TEL=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, tel);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			usrId = rs.getString("USR_ID");
		}
		
		rs.close();
		conn.close();
		pstmt.close();
		
		return usrId;		
	}
//일반회원 비밀번호찾기 메소드===================================================================
	@Override
	public String userpwsearch(String name, String tel, String id) throws SQLException
	{
		String pw= "";
		Connection conn = dataSource.getConnection();
		String sql = "SELECT PWD FROM USR_TBL_VIEW WHERE NAME=? AND TEL=? AND USR_ID =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, tel);
		pstmt.setString(3, id);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			pw = rs.getString("PWD");
		}
		
		rs.close();
		conn.close();
		pstmt.close();
		
		return pw;		
	}
//일반회원 로그인 메소드========================================================================================
	@Override
	public String userlogin(String id, String pw) throws SQLException
	{
		String name= "";
		Connection conn = dataSource.getConnection();
		String sql = "SELECT NAME FROM USR_TBL_VIEW WHERE USR_ID=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			name = rs.getString("NAME");
		}
		rs.close();
		conn.close();
		pstmt.close();
		
		return name;		
	}
	
//일반회원자기정보 리스트출력 메소드========================================================================================
	@Override
	public User userlist(String id, String pw) throws SQLException
	{
		User user = null;
		Connection conn = dataSource.getConnection();
		String sql = "SELECT NAME,GNDR_CD,EMAIL,TEL,BRTHDAY,ADDR_NO,ADDR1,ADDR2 FROM USR_TBL WHERE USR_ID=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);

		ResultSet rs = pstmt.executeQuery();
		
		
		while (rs.next())
		{
			user = new User();
			user.setName(rs.getString("NAME"));			
			user.setGndr_Cd(Integer.parseInt(rs.getString("GNDR_CD")));
			user.setEmail(rs.getString("EMAIL"));
			user.setTel(rs.getString("TEL"));
			user.setBirth(rs.getString("BRTHDAY"));
			user.setAddr_No(Integer.parseInt(rs.getString("ADDR_NO")));
			user.setAddr1(rs.getString("ADDR1"));
			user.setAddr2(rs.getString("ADDR2"));
		}
		rs.close();
		conn.close();
		pstmt.close();
		
		return user;
	}

//일반회원 자기정보 수정 메소드========================================================================================
	@Override
	public int userupdate(User user) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE USR_TBL SET GNDR_CD = ?, NAME = ?,PWD=?, EMAIL = ?, TEL = ?, BRTHDAY= TO_DATE(?,'YY-MM-DD'), ADDR_NO =?, ADDR1 = ?,ADDR2 = ? WHERE USR_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,user.getGndr_Cd());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPwd());
		pstmt.setString(4, user.getEmail());
		pstmt.setString(5, user.getTel());
		pstmt.setString(6, user.getBirth());
		pstmt.setInt(7, user.getAddr_No());
		pstmt.setString(8, user.getAddr1());
		pstmt.setString(9, user.getAddr2());
		pstmt.setString(10, user.getUsr_Id());
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}

//일반회원탈퇴 메소드========================================================================================	
	@Override
	public int userdelete(String id, String pw) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "DELETE USR_TBL WHERE USR_ID=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);		
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}

	
	
//관리자 개인회원리스트 출력========================================================================================
	@Override
	public ArrayList<User> list() throws SQLException 
	{
		ArrayList<User> result = new ArrayList<User>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT USR_ID, NAME, TEL, ADDR1"
				+ ", GENDER, WARN1, WARN2, WARN3 "
				+ "FROM AD_USR_VIEW";
		
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