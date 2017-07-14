package dto;

public class Notice
{

	//글번호, 글제목, 작성일, 내용, 작성자
	private String noticeSeq, subject, writeDate, content, writer;

	// 상단에 올릴 글 (배경색 추가+상단 표시)
	private int rnum, topCheck, hitCount;

	
	// getter setter
	public String getNoticeSeq()
	{
		return noticeSeq;
	}

	public void setNoticeSeq(String noticeSeq)
	{
		this.noticeSeq = noticeSeq;
	}

	public String getSubject()
	{
		return subject;
	}

	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	public String getWriteDate()
	{
		return writeDate;
	}

	public void setWriteDate(String writeDate)
	{
		this.writeDate = writeDate;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getWriter()
	{
		return writer;
	}

	public void setWriter(String writer)
	{
		this.writer = writer;
	}

	public int getTopCheck()
	{
		return topCheck;
	}

	public void setTopCheck(int topCheck)
	{
		this.topCheck = topCheck;
	}

	public int getHitCount()
	{
		return hitCount;
	}

	public void setHitCount(int hitCount)
	{
		this.hitCount = hitCount;
	}

	public int getRnum()
	{
		return rnum;
	}

	public void setRnum(int rnum)
	{
		this.rnum = rnum;
	}



}
