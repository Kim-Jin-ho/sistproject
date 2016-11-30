package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserUpdateController  implements Controller
{
	private IUserDAO dao; // 의존성 멤버주입을위해선 인터페이스 형의 자료형을 띄어야 하므로 멤버타입을 인터페이스 형으로 갖고 있어야한다.           
	
	public void setDao(IUserDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView(); //결과값으로 반환하게 되는 모델객체 생성함!!!
		
		
		String id = request.getParameter("id"); 
		String pwd= request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("date");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1+"@"+email2;            //이메일
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String tel = tel1+"-"+tel2+"-"+tel3; //전화번호	
		String gndr_Cd = request.getParameter("gender");
		String addr_no = request.getParameter("strZipcode_1");
		String addr1 = request.getParameter("strZipcode_2");
		String addr2 = request.getParameter("strZipcode_3");
	
		System.out.println(id+pwd+name+birth+tel+email+gndr_Cd+addr_no+addr1+addr2);
		User user = null;				
		int check = 0;

		try
		{ 
			user = new User();
			user.setGndr_Cd(Integer.parseInt(gndr_Cd));
			user.setName(name);
			user.setPwd(pwd);
			user.setEmail(email);
			user.setTel(tel);
			user.setBirth(birth);
			user.setAddr_No(Integer.parseInt(addr_no));
			user.setAddr1(addr1);
			user.setAddr2(addr2);
			user.setUsr_Id(id);
			check = dao.userupdate(user);
			
			
			mav.addObject("check",check);
			mav.setViewName("main/userUpdate.jsp");
			System.out.println(check);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return mav;	
		
	}
}