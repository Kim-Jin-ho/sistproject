package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.Notice;

public class NoticeDAO implements INoticeDAO
{

	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<Notice> noticeList(int start, int end) throws SQLException
	{
		ArrayList<Notice> result = new ArrayList<Notice>();
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT"
				+ "  T.RNUM AS RNUM"
				+ ", T.SRNOTICEID AS WRITENUM"
				+ ", T.SRNOTICETITLE AS TITLE"
				+ ", T.SRAID AS ID"
				+ ", T.SRNOTICEDATE AS WRITEDATE"
				+ ", T.SRNOTICEHIT AS HITCOUNT"
				+ " FROM (SELECT ROW_NUMBER() OVER (ORDER BY SRNOTICEDATE ASC) AS RNUM,"
				+ " SRNOTICEID, SRNOTICETITLE, SRAID, SRNOTICEDATE, SRNOTICEHIT"
				+ " FROM NOTICE ORDER BY SRNOTICEDATE deSC ) T"
				+ " WHERE RNUM>=? AND RNUM<=? ORDER BY RNUM desc";
		
		/*
		String sql = "SELECT T2.RNUM AS RNUM"
				+ ", T2.SRNOTICEID AS WRITENUM"
				+ ", T2.SRNOTICETITLE AS TITLE"
				+ ", T2.SRAID AS ID"
				+ ", T2.SRNOTICEDATE AS WRITEDATE"
				+ ", T2.SRNOTICEHIT AS HITCOUNT"
				+ " FROM (SELECT ROWNUM AS RNUM, T1.*"
				+ " FROM (SELECT * FROM NOTICE ORDER BY SRNOTICEDATE) T1 ) T2"
				+ " ORDER BY T2.RNUM DESC";
		*/
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			Notice dto = new Notice();
			dto.setRnum(rs.getInt("RNUM"));
			dto.setNoticeSeq(rs.getString("WRITENUM"));
			dto.setSubject(rs.getString("TITLE"));
			dto.setWriter(rs.getString("ID"));
			dto.setWriteDate(rs.getString("WRITEDATE"));
			dto.setHitCount(rs.getInt("HITCOUNT"));
			result.add(dto);

		}
		rs.close();
		pstmt.close();
		conn.close();

		return result;
	}
	
	
	public int listCount() throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "SELECT COUNT(*) AS COUNT FROM NOTICE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getInt("COUNT");

		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	

	@Override
	public Notice noticeDetail(String noticeSeq) throws SQLException
	{
		Notice result = new Notice();
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT T.RNUM AS RNUM"
				+ ", T.SRNOTICEID AS WRITENUM"
				+ ", T.SRNOTICETITLE AS TITLE"
				+ ", T.SRNOTICEDETAIL AS CONTENT"
				+ ", T.SRAID AS ID"
				+ ", T.SRNOTICEDATE AS WRITEDATE"
				+ ", T.SRNOTICEHIT AS HITCOUNT"
				+ " FROM (SELECT ROW_NUMBER() OVER (ORDER BY SRNOTICEID DESC) AS RNUM"
				+ ", SRNOTICEID, SRNOTICETITLE, SRNOTICEDETAIL, SRAID, SRNOTICEDATE, SRNOTICEHIT"
				+ " FROM NOTICE ORDER BY SRNOTICEID DESC ) T"
				+ " WHERE T.SRNOTICEID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(noticeSeq));
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setRnum(rs.getInt("RNUM"));
			result.setNoticeSeq(rs.getString("WRITENUM"));
			result.setSubject(rs.getString("TITLE"));
			result.setContent(rs.getString("CONTENT"));
			result.setWriter(rs.getString("ID"));
			result.setWriteDate(rs.getString("WRITEDATE"));
			result.setHitCount(rs.getInt("HITCOUNT"));
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	public Notice preNotice(String noticeRnum) throws SQLException
	{
		Notice result = new Notice();
		Connection conn = dataSource.getConnection();
		
		int preRnum = Integer.parseInt(noticeRnum) - 1;
		
		String sql = "SELECT T.RNUM AS RNUM, T.SRNOTICEID AS WRITENUM, T.SRNOTICETITLE AS TITLE FROM (SELECT ROW_NUMBER() OVER (ORDER BY SRNOTICEID DESC) AS RNUM, SRNOTICEID, SRNOTICETITLE, SRNOTICEDETAIL, SRAID, SRNOTICEDATE, SRNOTICEHIT FROM NOTICE ORDER BY SRNOTICEID DESC ) T WHERE T.RNUM=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, preRnum);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setRnum(rs.getInt("RNUM"));
			result.setNoticeSeq(rs.getString("WRITENUM"));
			result.setSubject(rs.getString("TITLE"));
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	public Notice nextNotice(String noticeRnum) throws SQLException
	{
		Notice result = new Notice();
		Connection conn = dataSource.getConnection();
		
		int nextRnum = Integer.parseInt(noticeRnum) + 1;
		
		String sql = "SELECT T.RNUM AS RNUM, T.SRNOTICEID AS WRITENUM, T.SRNOTICETITLE AS TITLE FROM (SELECT ROW_NUMBER() OVER (ORDER BY SRNOTICEID DESC) AS RNUM, SRNOTICEID, SRNOTICETITLE, SRNOTICEDETAIL, SRAID, SRNOTICEDATE, SRNOTICEHIT FROM NOTICE ORDER BY SRNOTICEID DESC ) T WHERE T.RNUM=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, nextRnum);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			result.setRnum(rs.getInt("RNUM"));
			result.setNoticeSeq(rs.getString("WRITENUM"));
			result.setSubject(rs.getString("TITLE"));
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	

	@Override
	public int noticeWrite(Notice notice) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "INSERT INTO NOTICE(SRNOTICEID,SRNOTICETITLE,SRNOTICEDETAIL,SRAID,SRNOTICEDATE,SRNOTICEHIT)"
				+ " VALUES((SELECT MAX(SRNOTICEID)+1 FROM NOTICE),?,?,?,SYSDATE,0)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, notice.getSubject());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getWriter());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int noticeModify(Notice notice) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		String sql = "UPDATE NOTICE"
				+ " SET SRNOTICETITLE=?,SRNOTICEDETAIL=?,SRNOTICEDATE=SYSDATE"
				+ " WHERE SRNOTICEID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, notice.getSubject());
		pstmt.setString(2, notice.getContent());
		pstmt.setInt(3, Integer.parseInt(notice.getNoticeSeq()));
		
		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int noticeDelete(String noticeSeq) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM NOTICE WHERE SRNOTICEID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(noticeSeq));

		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int addHitCount(String noticeSeq) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE NOTICE SET SRNOTICEHIT = SRNOTICEHIT+1 WHERE SRNOTICEID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(noticeSeq));

		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
	}

}
