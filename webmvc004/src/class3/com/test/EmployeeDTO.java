/*================================================
	EmployeeDTO.java
	- 데이터베이스 전송 및 저장 전용
	- 직원정보, 직위정보, 지역정보, 부서정보 
=================================================*/

package class3.com.test;

public class EmployeeDTO
{
	// 속성 구성 (멤버 변수 선언)
	// - 직원 정보
	private String employeeId, name, ssn, birthday, lunarName, telephone;
	private int lunar, basicPay, extraPay, pay;
	
	// - 지역 정보
	private String regionId, regionName;
	
	// - 부서 정보
	private String departmentId, departmentName;
	
	// - 직위 정보
	private String positionId, positionName;
	private int minBasicPay;
	
	// - 삭제 가능 여부 확인용 멤버 변수 추가!!
	private int delCheck;
	
	// getter / setter 구성
	public String getEmployeeId()
	{
		return employeeId;
	}

	public void setEmployeeId(String employeeId)
	{
		this.employeeId = employeeId;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getSsn()
	{
		return ssn;
	}

	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}

	public String getBirthday()
	{
		return birthday;
	}

	public void setBirthday(String birthday)
	{
		this.birthday = birthday;
	}

	public String getLunarName()
	{
		return lunarName;
	}

	public void setLunarName(String lunarName)
	{
		this.lunarName = lunarName;
	}

	public String getTelephone()
	{
		return telephone;
	}

	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}

	public int getLunar()
	{
		return lunar;
	}

	public void setLunar(int lunar)
	{
		this.lunar = lunar;
	}

	public int getBasicPay()
	{
		return basicPay;
	}

	public void setBasicPay(int basicPay)
	{
		this.basicPay = basicPay;
	}

	public int getExtraPay()
	{
		return extraPay;
	}

	public void setExtraPay(int extraPay)
	{
		this.extraPay = extraPay;
	}

	public int getPay()
	{
		return pay;
	}

	public void setPay(int pay)
	{
		this.pay = pay;
	}

	public String getRegionId()
	{
		return regionId;
	}

	public void setRegionId(String regionId)
	{
		this.regionId = regionId;
	}

	public String getRegionName()
	{
		return regionName;
	}

	public void setRegionName(String regionName)
	{
		this.regionName = regionName;
	}

	public String getDepartmentId()
	{
		return departmentId;
	}

	public void setDepartmentId(String departmentId)
	{
		this.departmentId = departmentId;
	}

	public String getDepartmentName()
	{
		return departmentName;
	}

	public void setDepartmentName(String departmentName)
	{
		this.departmentName = departmentName;
	}

	public String getPositionId()
	{
		return positionId;
	}

	public void setPositionId(String positionId)
	{
		this.positionId = positionId;
	}

	public String getPositionName()
	{
		return positionName;
	}

	public void setPositionName(String positionName)
	{
		this.positionName = positionName;
	}

	public int getMinBasicPay()
	{
		return minBasicPay;
	}

	public void setMinBasicPay(int minBasicPay)
	{
		this.minBasicPay = minBasicPay;
	}

	public int getDelCheck()
	{
		return delCheck;
	}

	public void setDelCheck(int delCheck)
	{
		this.delCheck = delCheck;
	}
	
	
	
	
}
