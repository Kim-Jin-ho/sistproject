/*====================
 * IMemberDAO.java
 *   인터페이스
 ===================*/


package class3.com.admin;

import java.sql.SQLException;
import java.util.ArrayList;


public interface IUserDAO
{

	//관리자 회원리스트 출력
	public ArrayList<User> list() throws SQLException;
	//관리자 개인회원 경고리스트 출력
	public ArrayList<User> warningList(String usr_Id) throws SQLException;
	
	

	
}
