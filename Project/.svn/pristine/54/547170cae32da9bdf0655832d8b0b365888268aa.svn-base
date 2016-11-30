package class3.com.admin;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IQnaDAO 
{

	// 회원 QNA 리스트 출력 메소드
	public ArrayList<Qna> userQnaList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException;

	// 특정 QNA 글 내용 출력 메소드
	public Qna userQnaArticle(String cd) throws SQLException;
	
	// QNA 생성 메소드
	public int userQnaCreate(Qna qna) throws SQLException;
	
	// QNA 글 클릭시 조회수 +1 해주는 메소드
	public int updateCount(String cd) throws SQLException;
	
	// QNA 삭제 메소드
	public int userQnaDelete(String cd) throws SQLException;
	
	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	public Qna userQnaUpdateSend(String cd) throws SQLException;
	
	// QNA 수정시 변경된 사항을 등록하는 메소드
	public int userQnaUpdate(Qna qna) throws SQLException;
	
	// QNA 모든 갯수를 출력하는 메소드
	public int maxNum(String searchKey, String searchValue) throws SQLException;
	
	// QNA 특정글에 달린 댓글 출력 메소드
	public Qna userQnaComment(String cd) throws SQLException;
	
	// 관리자 코멘트작성 
	public int addCmt(Qna qna) throws SQLException;

	// 관리자 코멘트 삭제
	public int delCmt(String cd) throws SQLException;
	
	
	
	
	// 회원 QNA 리스트 출력 메소드
	public ArrayList<Qna> cmpnyQnaList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException;
	
	// 특정 QNA 글 내용 출력 메소드
	public Qna cmpnyQnaArticle(String cd) throws SQLException;
	
	// QNA 생성 메소드
	public int cmpnyQnaCreate(Qna dto) throws SQLException;
	
	// QNA 글 클릭시 조회수 +1 해주는 메소드
	public int updateCount2(String cd) throws SQLException;
	
	// QNA 삭제 메소드
	public int cmpnyQnaDelete(String cd) throws SQLException;
	
	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	public Qna cmpnyQnaUpdateSend(String cd) throws SQLException;
	
	// QNA 수정시 변경된 사항을 등록하는 메소드
	public int cmpnyQnaUpdate(Qna dto) throws SQLException;
		
	// QNA 모든 갯수를 출력하는 메소드
	public int maxNum2(String searchKey, String searchValue) throws SQLException;
		
	// QNA 특정글에 달린 댓글 출력 메소드
	public Qna cmpnyQnaComment(String cd) throws SQLException;
	
	// 관리자 코멘트 입력
	public int addCmt2(Qna qna) throws SQLException;
	
	
	//관리자 코멘트 삭제
	public int delCmt2(String cd) throws SQLException;
	
	
	
	
}
