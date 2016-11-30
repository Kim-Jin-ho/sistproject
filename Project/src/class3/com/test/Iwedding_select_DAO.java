package class3.com.test;

import java.sql.SQLException;
import java.util.ArrayList;

public interface Iwedding_select_DAO 
{	
	// 상세정보 / 이름, 홈피, 주소 
	public wedding_select_DTO list(String cd) throws SQLException;
	
	// 상품평 / 글, 날짜, 평점, 아이디
	public ArrayList<wedding_select_DTO> prodList(String cd) throws SQLException;
	
	// 상품평 댓글 / 글, 날짜 , 아이디
	public ArrayList<wedding_select_DTO> prodRvwList() throws SQLException;
	
	// 상담하기 내역 / 글, 날짜, 아이디
	public ArrayList<wedding_select_DTO> advList(String cd) throws SQLException;
	
	// 상담하기 댓글 / 글, 날짜, 아이디
	public ArrayList<wedding_select_DTO> advRvwList() throws SQLException;
	
	// 찜한 상태인지 확인하기
	public String selList(String cd, String id) throws SQLException;
	
	///////////////////////////////////////////////////////////////////////////////
	// 상품평 작성 Ajax 처리
	public int prodInsert(String cd, String userId, String ctnt, String scr) throws SQLException; 
	// 상담 작성 Ajax 처리
	public int advInsert(String cd, String userId, String ctnt) throws SQLException;
	// 상세상품 이미지 출력
	public ArrayList<wedding_select_DTO> imgList(String cd) throws SQLException;
	// 평점 출력
	public String[] srcScore(String cd) throws SQLException;
}
