package class3.com.user;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IUserDAO
{
	// -----------------------★★★ UserDAO 인터페이스 ★★★-------------------------
	// 회원 예약 리스트 출력 메소드
	public ArrayList<UserDTO> userReservationList(String UserId) throws SQLException;
	
	
	// 회원 예약 삭제 메소드
	public int userReservationDelete(String cd) throws SQLException;
	
	// 회원 상담 리스트 출력 메소드
	public ArrayList<UserDTO> userAdviceList(String UserId) throws SQLException;
	
	// 회원 찜 리스트 출력 메소드
	public ArrayList<UserDTO> userSelectList(String UserId) throws SQLException;
	// 회원 찜 리스트 삭제 메소드
	public int userSelectDelete(String cd) throws SQLException;
	
	// 회원 상품평 리스트 출력 메소드
	public ArrayList<UserDTO> userCommentList(String UserId) throws SQLException;
	
	// 회원 QNA 리스트 출력 메소드
	public ArrayList<UserDTO> userQnaList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException;
	
	// 특정 QNA 글 내용 출력 메소드
	public UserDTO userQnaArticle(String cd) throws SQLException;
	
	// QNA 생성 메소드
	public int userQnaCreate(UserDTO dto) throws SQLException;
	
	// QNA 글 클릭시 조회수 +1 해주는 메소드
	public int updateCount(String cd) throws SQLException;
	
	// QNA 삭제 메소드
	public int userQnaDelete(String cd, String UserId) throws SQLException;
	
	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	public UserDTO userQnaUpdateSend(String cd) throws SQLException;
	
	// QNA 수정시 변경된 사항을 등록하는 메소드
	public int userQnaUpdate(UserDTO dto) throws SQLException;
	
	// QNA 모든 갯수를 출력하는 메소드
	public int maxNum(String searchKey, String searchValue) throws SQLException;
	
	// QNA 특정글에 달린 댓글 출력 메소드
	public UserDTO userQnaComment(String cd) throws SQLException;
	
	// 1차 경고 메소드
	public String userWar1(String UserId) throws SQLException;
	
	// 2차 경고 메소드
	public String userWar2(String UserId) throws SQLException;
	
	// 3차 경고 메소드
	public String userWar3(String UserId) throws SQLException;
}






