/*============================
 		BoardDTO.java
============================*/


package com.board;

public class BoardDTO
{
	//주요 속성 구성
	private int num, rnum;
	private String name, pwd, email, subject, content, ipAddr, created;
	private int hitCount;
	
	// getter / setter 구성
	
	
	public int getNum()
	{
		return num;
	}
	public int getRnum()
	{
		return rnum;
	}
	public void setRnum(int rnum)
	{
		this.rnum = rnum;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getPwd()
	{
		return pwd;
	}
	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getIpAddr()
	{
		return ipAddr;
	}
	public void setIpAddr(String ipAddr)
	{
		this.ipAddr = ipAddr;
	}
	public String getCreated()
	{
		return created;
	}
	public void setCreated(String created)
	{
		this.created = created;
	}
	public int getHitCount()
	{
		return hitCount;
	}
	public void setHitCount(int hitCount)
	{
		this.hitCount = hitCount;
	}
	
}
