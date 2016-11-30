package class3.com.test;

public class studio_main_DTO
{
	// 주소, 상품등록제목, 주소, 사진
	private String addr1, addr2, name, prc, img ;
	private String prodName, sbjct, pth;
	
	// main 지도 클릭시 일반상품이미지, 이름, 가격
	private String mainImg, mainName;
	private int mainPrc;
	
	public String getPrc()
	{
		return prc;
	}

	public void setPrc(String prc)
	{
		this.prc = prc;
	}
	
	public String getAddr2()
	{
		return addr2;
	}

	public void setAddr2(String addr2)
	{
		this.addr2 = addr2;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	//---main 지도 클릭시 일반상품이미지, 이름, 가격 // setter / getter
	public String getmainImg()
	{
		return mainImg;
	}

	public void setmainImg(String mainImg)
	{
		this.mainImg = mainImg;
	}

	public String getMainName()
	{
		return mainName;
	}

	public void setMainName(String mainName)
	{
		this.mainName = mainName;
	}

	public int getMainPrc()
	{
		return mainPrc;
	}

	public void setMainPrc(int mainPrc)
	{
		this.mainPrc = mainPrc;
	}
	// main 지도 클릭시 일반상품이미지, 이름, 가격 // setter / getter---
	
	
	public String getAddr1()
	{
		return addr1;
	}

	public void setAddr1(String addr1)
	{
		this.addr1 = addr1;
	}

	public String getProdName()
	{
		return prodName;
	}

	public void setProdName(String prodName)
	{
		this.prodName = prodName;
	}

	public String getSbjct()
	{
		return sbjct;
	}

	public void setSbjct(String sbjct)
	{
		this.sbjct = sbjct;
	}

	public String getImg()
	{
		return img;
	}

	public void setImg(String img)
	{
		this.img = img;
	}

	public String getPth()
	{
		return pth;
	}

	public void setPth(String pth)
	{
		this.pth = pth;
	}
}
