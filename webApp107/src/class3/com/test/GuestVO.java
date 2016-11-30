package class3.com.test;

public class GuestVO
{
	// 여기에서 사용한 변수명 앞 두 글자는 소문자로 지정하길 권장
	// 여기에서 사용한 변수명은 html의 폼 태그 안에서 name 속성으로 지정하길 권장
	private String userName;	//-- 작성자
	private String subject;		//-- 제목
	private String content;		//-- 내용
	private String created;		//-- 작성일
	
	// getter / setter 구성
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
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
	public String getCreated()
	{
		return created;
	}
	public void setCreated(String created)
	{
		this.created = created;
	}

}
