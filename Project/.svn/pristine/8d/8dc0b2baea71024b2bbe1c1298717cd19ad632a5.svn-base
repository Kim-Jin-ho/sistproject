package class3.com.admin;

import java.sql.SQLException;
import java.util.ArrayList;

public interface INoticeDAO
{
	// -----------------------★★★ NoticeDAO 인터페이스 ★★★-------------------------
	
	// 회원 QNA 리스트 출력 메소드
	public ArrayList<NoticeDTO> noticeList(String searchKey, String searchValue, int start, int end, int dataCount) throws SQLException;
	
	// 특정 QNA 글 내용 출력 메소드
	public NoticeDTO noticeArticle(String cd) throws SQLException;
	
	// QNA 생성 메소드
	public int noticeCreate(NoticeDTO dto) throws SQLException;
	
	// QNA 글 클릭시 조회수 +1 해주는 메소드
	public int updateCount(String cd) throws SQLException;
	
	// QNA 삭제 메소드
	public int noticeDelete(String cd) throws SQLException;
	
	// QNA 수정시 수정 페이지에 기존 값을 출력하기 위한 메소드
	public NoticeDTO noticeUpdateSend(String cd) throws SQLException;
	
	// QNA 수정시 변경된 사항을 등록하는 메소드
	public int noticeUpdate(NoticeDTO dto) throws SQLException;
	
	// QNA 모든 갯수를 출력하는 메소드
	public int maxNum(String searchKey, String searchValue) throws SQLException;
	
}






