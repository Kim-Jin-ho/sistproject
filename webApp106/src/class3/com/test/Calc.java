package class3.com.test;

public class Calc
{
	private int su1;
	private String oper;
	private int su2;
	public int getSu1()
	{
		return su1;
	}
	public void setSu1(int su1)
	{
		this.su1 = su1;
	}
	public String getOper()
	{
		return oper;
	}
	public void setOper(String oper)
	{
		this.oper = oper;
	}
	public int getSu2()
	{
		return su2;
	}
	public void setSu2(int su2)
	{
		this.su2 = su2;
	}
	
	// 연산 처리 메소드 추가!!
	public String result()
	{
		System.out.print(su1+su2);
		String str = "";
		int s = 0;
		if(oper!=null)
		{
	         if(oper.equals("+"))
	             s=su1+su2;
	          else if(oper.equals("-"))
	             s=su1-su2;
	          else if(oper.equals("*"))
	             s=su1*su2;
	          else if(oper.equals("/"))
	             s=su1/su2;      
				
				
			str = String.format("%d %s %d = %d", su1, oper, su2, s);
		}
		return str;
	}
}
