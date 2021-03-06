package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import dto.Member;

public class MemberDAO implements IMemberDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	// 회원 추가 메소드
	@Override
	public int memberAdd(Member member) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO MEMBER(MID, ID, PW, NICKNAME) VALUES (SEQ_MEMBER.NEXTVAL, ?, CRYPTPACK.ENCRYPT(?, ?), ?)";
				
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setString(1, member.getId());
		pstmt.setString(2, member.getPw());
		pstmt.setString(3, member.getId());
		pstmt.setString(4, member.getNickname());
		
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;	
	}

	// 개인 정보 추가 메소드
	@Override
	public int gainfoAdd(Member member) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO GAINFO(MID, NAME, TEL, EMAIL, JOINDATE) VALUES(SEQ_GAINFO.NEXTVAL, ?, ?, ?, TO_DATE(SYSDATE, 'YYYY-MM-DD'))";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());
		pstmt.setString(3, member.getEmail());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 아이디 중복검사 메소드
	@Override
	public int getId(String memberId) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(ID) AS COUNT FROM MEMBER WHERE ID=?";	
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		pstmt.close();
		conn.close();
		rs.close();
		
		return result;
	}

	// 닉네임 중복검사 메소드
	@Override
	public int getNickname(String memberNickname) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(NICKNAME) AS COUNT FROM MEMBER WHERE NICKNAME=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberNickname);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		pstmt.close();
		conn.close();
		return result;
	}

	// 이메일 중복검사 메소드
	@Override
	public int getEmail(String memberEmail) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(EMAIL) AS COUNT FROM GAINFO WHERE EMAIL=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberEmail);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		pstmt.close();
		conn.close();
		return result;
	}

	// 연락처 중복검사 메소드
	@Override
	public int getTel(String memberTel) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(TEL) AS COUNT FROM GAINFO WHERE TEL=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberTel);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		pstmt.close();
		conn.close();
		return result;
		
	}
	
	// 일반 회원 로그인 메소드
	@Override
	public String login(String id, String pw) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NICKNAME FROM MEMBER WHERE ID=? AND pw=CRYPTPACK.ENCRYPT(?, ( SELECT id FROM member WHERE id=?))";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, id);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next())
		{
			result = rs.getString("NICKNAME");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 관리자 로그인 메소드
	@Override
	public String loginAdmin(String id, String pw) throws SQLException
	{
		String result = null;
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT SRAID FROM SRADMIN WHERE SRAID=? AND SRAPW=CRYPTPACK.ENCRYPT(?, ( SELECT SRAID FROM SRADMIN WHERE SRAID=?))";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, id);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result = rs.getString("SRAID");
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
		
	}
	
	
	
}
