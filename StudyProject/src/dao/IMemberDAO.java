package dao;

import java.sql.SQLException;

import dto.Member;

public interface IMemberDAO
{
	public int memberAdd(Member member) throws SQLException;  // 회원 추가 메소드
	public int gainfoAdd(Member member) throws SQLException;  // 개인 정보 추가 메소드
	public int getId(String memberId) throws SQLException;	  // 아이디 중복검사 메소드
	public int getNickname(String memberNickname) throws SQLException;	// 닉네임 중복검사 메소드
	public int getEmail(String memberEmail) throws SQLException;	// 이메일 중복검사 메소드
	public int getTel(String memberTel) throws SQLException;		// 연락처 중복검사 메소드
	public String login(String id, String pw) throws SQLException;		// 일반 회원 로그인 메소드
	public String loginAdmin(String id, String pw) throws SQLException; // 관리자 로그인 메소드
}
	
