package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.Notice;

public interface INoticeDAO
{
	public ArrayList<Notice> noticeList(int start, int end) throws SQLException;
	public int listCount() throws SQLException;
	public Notice noticeDetail(String noticeSeq) throws SQLException;
	public Notice preNotice(String noticeRnum) throws SQLException;
	public Notice nextNotice(String noticeRnum) throws SQLException;
	
	public int noticeWrite(Notice notice) throws SQLException;
	public int noticeModify(Notice notice) throws SQLException;
	public int noticeDelete(String noticeSeq) throws SQLException;
	public int addHitCount(String noticeSeq) throws SQLException;
	

}
