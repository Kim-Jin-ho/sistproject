package class3.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;




public class CmpnyDAO implements ICmpnyDAO
{
	private DataSource dataSource;

	//setter 硫붿냼�뱶
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

//湲곗뾽�쉶�썝 �쉶�썝媛��엯硫붿냼�뱶 ==========================================================================
	public int cmpnyadd(Cmpny Cmpny) throws SQLException
	{
		int result =0;
		
		Connection conn = dataSource.getConnection();
		
		// �뵲���몴 吏��썙�빞�맖
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

//湲곗뾽�쉶�썝 �븘�씠�뵒以묐났泥댄겕硫붿냼�뱶 ==========================================================================
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

//湲곗뾽 �뙣�뒪�썙�뱶 李얘린 硫붿냼�뱶========================================================================
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

//湲곗뾽 濡쒓렇�씤 硫붿냼�뱶========================================================================================
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

//湲곗뾽�옄湲곗젙蹂� 由ъ뒪�듃異쒕젰 硫붿냼�뱶========================================================================================	
	@Override
	public ArrayList<Cmpny> cmpnylist(String id, String pw) throws SQLException
	{
		ArrayList<Cmpny> cmpny = new ArrayList<Cmpny>();
		Connection conn = dataSource.getConnection();
		String sql = "SELECT CMPNY_ID,CMPNY,NAME,CTNT,EMAIL,TEL,HMPG,ADDR_NO,ADDR1,ADDR2 FROM CMPNY_TBL_VIEW WHERE CMPNY_ID=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);

		ResultSet rs = pstmt.executeQuery();
		
		Cmpny dto = null;
		while (rs.next())
		{
			dto = new Cmpny();
			dto.setCmpny_Id(rs.getString("CMPNY_ID"));
			dto.setCmpny_Ctgy_Id(Integer.parseInt(rs.getString("CMPNY")));
			dto.setName(rs.getString("NAME"));
			dto.setCtnt(rs.getString("CTNT"));
			dto.setEmail(rs.getString("EMAIL"));
			dto.setTel(rs.getString("TEL"));
			dto.setHmpg(rs.getString("HMPG"));
			dto.setAddr_No(rs.getString("ADDR_NO"));
			dto.setAddr1(rs.getString("ADDR1"));
			dto.setAddr2(rs.getString("ADDR2"));
			cmpny.add(dto);
		}
		rs.close();
		conn.close();
		pstmt.close();
		
		return cmpny;
	}

	
//湲곗뾽�옄湲곗젙蹂� �닔�젙 硫붿냼�뱶========================================================================================
	@Override
	public int cmpnyupdate(Cmpny cmpny) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE CMPNY_TBL SET CMPNY_CTGY_ID=?, NAME=?, CTNT =?, PWD=?, EMAIL=? ,TEL=?, HMPG=?, ADDR_NO=?, ADDR1=?,ADDR2=? WHERE CMPNY_ID=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, cmpny.getCmpny_Ctgy_Id());
		pstmt.setString(2, cmpny.getName());
		pstmt.setString(3, cmpny.getCtnt());
		pstmt.setString(4, cmpny.getPwd());
		pstmt.setString(5, cmpny.getEmail());
		pstmt.setString(6, cmpny.getTel());
		pstmt.setString(7, cmpny.getHmpg());
		pstmt.setString(8, cmpny.getAddr_No());
		pstmt.setString(9, cmpny.getAddr1());
		pstmt.setString(10, cmpny.getAddr2());
		pstmt.setString(11, cmpny.getCmpny_Id());
		pstmt.setString(12, cmpny.getPwd());
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}

//湲곗뾽�깉�눜 硫붿냼�뱶========================================================================================
	@Override
	public int cmpnydelete(String id, String pw) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE CMPNY_TBL SET WTDRL=1 WHERE CMPNY_ID=? AND PWD=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);		
		
		result = pstmt.executeUpdate();
		
		conn.close();
		pstmt.close();
		
		return result;
	}
	
	
	
	
//관리자 기업회원 목록 --------------------------------------------------------------------	
	@Override
	public ArrayList<Cmpny> list() throws SQLException
	{
		ArrayList<Cmpny> result = new ArrayList<Cmpny>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CMPNY_ID, NAME, TEL, ADDR1, WARNCOUNT, END "
				+ "FROM CO_VIEW ORDER BY 2";
		
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
			cmpny.setWarncount(rs.getInt("WARNCOUNT"));
			cmpny.setEnd(rs.getString("END"));
			
			result.add(cmpny);
		
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
		
	}


	
//관리자 기업별 경고 사유 출력----------------------------------------------------------------- 
	
	public ArrayList<Cmpny> warningList(String cmpny_Id) throws SQLException
	{
		ArrayList<Cmpny> result = new ArrayList<Cmpny>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CMPNY_ID, WARN1, WARN2, WARN3 FROM AD_CWARN_VIEW WHERE CMPNY_ID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cmpny_Id);
		ResultSet rs = pstmt.executeQuery();
		
		Cmpny cmpny = null;
		
		while (rs.next()) 
		{
			cmpny = new Cmpny();
		
			cmpny.setCmpny_Id(rs.getString("CMPNY_ID"));
			cmpny.setWarn1(rs.getString("WARN1"));
			cmpny.setWarn2(rs.getString("WARN2"));
			cmpny.setWarn3(rs.getString("WARN3"));
			
			result.add(cmpny);
		
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
		
		
		
	}

	@Override
	public int maxNum(String searchKey, String searchValue) throws SQLException {

		int result = 0;
		
		searchValue = "%" + searchValue + "%";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NVL(COUNT(*),0) AS MAX"
				+ " FROM QUSR_TBL Q, USR_TBL U WHERE Q.USR_ID = U.USR_ID AND " + searchKey + " LIKE ?";
		
		System.out.println(searchKey);
		System.out.println(searchValue);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, searchValue);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
			result = rs.getInt("MAX");
		
		
		conn.close();
		pstmt.close();
		rs.close();
		
		return result;
	
	
	}
	
	
	
	
	
}
