package class3.com.test;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ICmpnyDAO
{
	//DAO가 갖고 있음직한 메소드를 선언한다!!
	public int cmpnyadd(Cmpny Cmpny) throws SQLException; //기업회원 회원가입 메소드
	public int cmpnyidcheck(String id)throws SQLException; //기업회원 ID중복체크 메소드
	public String cmpnylogin(String id,String pw)throws SQLException;//기업회원 로그인 
	public String cmpnypwsearch(String id,String tel)throws SQLException;//기업회원 비밀번호찾기메소드
	//기업 로그아웃(세션으로처리됨)
	public Cmpny cmpnylist(String id,String pw)throws SQLException;//기업 자신의 리스트를 출력하는 메소드
	public int cmpnyupdate(Cmpny cmpny)throws SQLException;//기업 자신의 정보를 수정하는 메소드
	public int cmpnydelete(String id,String pw)throws SQLException;//기업 탈퇴메소드
	
	public String adminlogin(String id,String pw)throws SQLException;//관리자 로그인메소드
	//관리자 Cmpnylist 출력
	public ArrayList<Cmpny> list() throws SQLException;
}
