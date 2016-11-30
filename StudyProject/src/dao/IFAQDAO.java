package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import faq.FAQDTO;

public interface IFAQDAO
{
	// 일반 게시글 갯수 확인
	//public int getDataCount() throws SQLException;
	// 일반 리스트 페이지
	public int getPageCount(int numPerPage, int dataCount) throws SQLException;
	// 일반 게시글 갯수 확인
	public int getDataCount(String searchKey, String searchValue) throws SQLException;
	
	
	// 일반 리스트 
	public ArrayList<FAQDTO> list() throws SQLException;
	// 검색 후 리스트
	public ArrayList<FAQDTO> getLists(int start, int end, String searchKey, String searchValue, int cnt) throws SQLException;
	public String pageIndexList(int current_page, int total_page, String list_url) throws SQLException;
	// FAQ PrimaryKey 최대값 구하기
	public int maxCode() throws SQLException;
	// FAQ 작성
	public int insert(int cd, String title, String comment) throws SQLException;
	// FAQ 수정
	public FAQDTO updateList(int cd) throws SQLException;
	public int update(int cd, String title, String comment) throws SQLException;
	// FAQ 삭제
	public int delete(String cd) throws SQLException;
}
