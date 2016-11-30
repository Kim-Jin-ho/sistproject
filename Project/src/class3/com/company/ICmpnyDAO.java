package class3.com.company;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ICmpnyDAO
{
	// -----------------------★★★ CmpnyDAO 인터페이스 ★★★-------------------------
	// 회원 QNA 리스트 출력 메소드
	public ArrayList<CmpnyDTO> cmpnyQnaList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException;
	
	// 특정 QNA 글 내용 출력 메소드
	public CmpnyDTO cmpnyQnaArticle(String cd) throws SQLException;
	
	// QNA 생성 메소드
	public int cmpnyQnaCreate(CmpnyDTO dto) throws SQLException;
	
	// QNA 글 클릭시 조회수 +1 해주는 메소드
	public int updateCount(String cd) throws SQLException;
	
	// QNA 삭제 메소드
	public int cmpnyQnaDelete(String cd) throws SQLException;
	
	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	public CmpnyDTO cmpnyQnaUpdateSend(String cd) throws SQLException;
	
	// QNA 수정시 변경된 사항을 등록하는 메소드
	public int cmpnyQnaUpdate(CmpnyDTO dto) throws SQLException;
	
	// QNA 모든 갯수를 출력하는 메소드
	public int maxNum(String searchKey, String searchValue) throws SQLException;
	
	// QNA 특정글에 달린 댓글 출력 메소드
	public CmpnyDTO cmpnyQnaComment(String cd) throws SQLException;
}






