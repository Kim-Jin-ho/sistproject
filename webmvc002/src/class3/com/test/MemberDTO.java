/*========================================
    MemberDTO.java
    - 데이터 저장소 및 전송 전용 객체
========================================*/

package class3.com.test;

public class MemberDTO
{
	// 멤버 변수 (속성 구성)
	//-- 데이터베이스 테이블(TBL_MEMBERLIST) 의 컬럼명을 기준으로 작성
	private String id, pw, tel, email, name;

	// getter / setter 구성
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getPw()
	{
		return pw;
	}

	public void setPw(String pw)
	{
		this.pw = pw;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}
	
	
}
