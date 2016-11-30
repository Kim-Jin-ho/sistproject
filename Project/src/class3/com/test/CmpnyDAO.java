package class3.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class CmpnyDAO implements ICmpnyDAO
{
	private DataSource dataSource;

	//setter메소드
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

//기업회원 회원가입메소드aaa ==========================================================================
	public int cmpnyadd(Cmpny Cmpny) throws SQLException
	{
		int result =0;
		
		Connection conn = dataSource.getConnection();
		
		// 따움표 지워야됨
		String sql = "INSERT INTO CMPNY_TBL(CMPNY_ID, CMPNY_CTGY_ID, NAME, CTNT, PWD, EMAIL, TEL, HMPG, ADDR_NO, ADDR1, ADDR2)"
				+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Cmpny.getCmpny_Id());
		pstmt.setInt(2, Cmpny.getCmpny_Ctgy_Id());
		pstmt.setString(3, Cmpny.getName());
		pstmt.setString(4, Cmpny.getCtnt());
		pstmt.setString(5, Cmpny.getPwd());
		pstmt.setString(6, Cmpny.getEmail());
		pstmt.setString(7, Cmpny.getTel());
		pstmt.setString(8, Cmpny.getHmpg());
		pstmt.setString(9, Cmpny.getAddr_No());
		pstmt.setString(10, Cmpny.getAddr1());
		pstmt.setString(11, Cmpny.getAddr2());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();		
		
		return result;
	}

//기업회원 아이디중복체크메소드 ==========================================================================
	@Override
	public int cmpnyidcheck(String id) throws SQLException
	{
		int result =0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM CMPNY_TBL_VIEW WHERE CMPNY_ID=?";
		
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

//기업 패스워드 찾기 메소드========================================================================
@Override
	public String cmpnypwsearch(String id, String tel) throws SQLException
	{
	String pw= "";
	Connection conn = dataSource.getConnection();
	String sql = "SELECT PWD FROM CMPNY_TBL_VIEW WHERE CMPNY_ID=? AND TEL=? AND WTDRL=0";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, tel);
	
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

//기업 로그인 메소드========================================================================================
	@Override
	public String cmpnylogin(String id, String pw) throws SQLException
	{
		String name= "";
		Connection conn = dataSource.getConnection();
		String sql = "SELECT NAME FROM CMPNY_TBL_VIEW WHERE CMPNY_ID=? AND PWD=?  AND WTDRL=0";
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

//기업자기정보 리스트출력 메소드========================================================================================	
	@Override
	public Cmpny cmpnylist(String id, String pw) throws SQLException
	{
		Cmpny cmpny = null;
		Connection conn = dataSource.getConnection();
		String sql = "SELECT CMPNY_ID,CMPNY_CTGY_ID,NAME,CTNT,EMAIL,TEL,HMPG,ADDR_NO,ADDR1,ADDR2 FROM CMPNY_TBL WHERE CMPNY_ID=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);

		ResultSet rs = pstmt.executeQuery();
		
		
		while (rs.next())
		{
			cmpny = new Cmpny();
			cmpny.setCmpny_Id(rs.getString("CMPNY_ID"));
			cmpny.setCmpny_Ctgy_Id(Integer.parseInt(rs.getString("CMPNY_CTGY_ID")));
			cmpny.setName(rs.getString("NAME"));
			cmpny.setCtnt(rs.getString("CTNT"));
			cmpny.setEmail(rs.getString("EMAIL"));
			cmpny.setTel(rs.getString("TEL"));
			cmpny.setHmpg(rs.getString("HMPG"));
			cmpny.setAddr_No(rs.getString("ADDR_NO"));
			cmpny.setAddr1(rs.getString("ADDR1"));
			cmpny.setAddr2(rs.getString("ADDR2"));
		}
		rs.close();
		conn.close();
		pstmt.close();
		
		return cmpny;
	}

	
//기업자기정보 수정 메소드========================================================================================
	@Override
	public int cmpnyupdate(Cmpny cmpny) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE CMPNY_TBL SET  NAME=?, CTNT =?, PWD=?, EMAIL=? ,TEL=?, HMPG=?, ADDR_NO=?, ADDR1=?,ADDR2=? WHERE CMPNY_ID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cmpny.getName());
		pstmt.setString(2, cmpny.getCtnt());
		pstmt.setString(3, cmpny.getPwd());
		pstmt.setString(4, cmpny.getEmail());
		pstmt.setString(5, cmpny.getTel());
		pstmt.setString(6, cmpny.getHmpg());
		pstmt.setString(7, cmpny.getAddr_No());
		pstmt.setString(8, cmpny.getAddr1());
		pstmt.setString(9, cmpny.getAddr2());
		pstmt.setString(10, cmpny.getCmpny_Id());
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}

//기업탈퇴 메소드========================================================================================
	@Override
	public int cmpnydelete(String id, String pw) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE CMPNY_TBL SET WTDRL=1 , NAME =NULL,CTNT = NULL ,PWD=NULL , EMAIL = NULL, TEL = NULL , HMPG =NULL , ADDR_NO = NULL, ADDR1 = NULL ,ADDR2 = NULL WHERE CMPNY_ID=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);		
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}
	
//관리자 로그인 메소드========================================================================================================	
	@Override
	public String adminlogin(String id, String pw) throws SQLException
	{
		String name= "";
		Connection conn = dataSource.getConnection();
		String sql = "SELECT ADMIN_CD FROM ADMIN_TBL WHERE ADMIN_CD=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			name = rs.getString("ADMIN_CD");
		}
		rs.close();
		conn.close();
		pstmt.close();
		
		return name;		
	}

	@Override
	public ArrayList<Cmpny> list() throws SQLException
	{
		ArrayList<Cmpny> result = new ArrayList<Cmpny>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CMPNY_ID, NAME, TEL, ADDR1, WARN1, WARN2, WARN3, END "
				+ "FROM AD_CMPNY_VIEW";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Cmpny cmpny = null;
		
		while (rs.next()) 
		{
			cmpny = new Cmpny();
		
			cmpny.setCmpny_Id(rs.getString("CMPNY_ID"));
			cmpny.setName(rs.getString("NAME"));
			cmpny.setTel(rs.getString("TEL"));
			cmpny.setAddr1(rs.getString("ADDR1"));
			cmpny.setWarn1(rs.getString("WARN1"));
			cmpny.setWarn2(rs.getString("WARN2"));
			cmpny.setWarn3(rs.getString("WARN3"));
			cmpny.setEnd(rs.getString("END"));
			
			result.add(cmpny);
		
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
		
	}
	
}
