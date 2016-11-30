/*====================
 * IMemberDAO.java
 *   인터페이스
 ===================*/


package class3.com.test;

import java.sql.SQLException;
import java.util.ArrayList;


public interface IUserDAO
{
	//DAO가 갖고 있음직한 메소드를 선언한다!!
	public int add(User user) throws SQLException; //일반회원 회원가입 메소드
	public int idcheck(String user)throws SQLException; // 일반회원 ID중복체크 메소드
	public String idsearch(String user,String tel)throws SQLException; // 일반회원 ID찾기 메소드
	public String userpwsearch(String name,String tel,String id)throws SQLException;//일반회원 비밀번호찾기메소드
	public String userlogin(String id,String pw)throws SQLException;//회원 로그인 
	//회원 로그아웃(세션으로처리됨)
	public User userlist(String id,String pw)throws SQLException;//회원 자신의 리스트를 출력하는 메소드
	public int userupdate(User user)throws SQLException;//회원 자신의 정보를 수정하는 메소드
	public int userdelete(String id,String pw)throws SQLException;//회원 탈퇴메소드

	
	//관리자 회원리스트 출력
	public ArrayList<User> list() throws SQLException;
	
}
