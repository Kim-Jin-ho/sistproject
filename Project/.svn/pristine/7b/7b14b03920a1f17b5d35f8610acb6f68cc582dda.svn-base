/*=====================================================
 * - 컨트롤러 클래스
 * - 회원정보 추가 액션
 * - DAO 객체에 대한 의존성 주입 → SETTER메소드 추가
 =====================================================*/


package class3.com.test;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserInsertController implements Controller
{
	private IUserDAO dao; // 의존성 멤버주입을위해선 인터페이스 형의 자료형을 띄어야 하므로 멤버타입을 인터페이스 형으로 갖고 있어야한다.           
	
	public void setDao(IUserDAO dao)
	{
		this.dao = dao;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		//파라미터는 네임값을 받아온단다!!!
		ModelAndView mav = new ModelAndView(); 
		String usr_id = request.getParameter("id");
		String pwd= request.getParameter("password");
		String name = request.getParameter("name");
		String birth = request.getParameter("date");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String tel = tel1+"-"+tel2+"-"+tel3;
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1+"@"+email2;
		String gndr_Cd = request.getParameter("gender");
		String addr_No = request.getParameter("strZipcode_1");
		String addr1 = request.getParameter("strZipcode_2");
		String addr2 = request.getParameter("strZipcode_3");
		User member = null;				
		int check = 0;	
		
		try
		{ 
			
			member = new User();
			member.setUsr_Id(usr_id);
			member.setPwd(pwd);
			member.setName(name);
			member.setBirth(birth);
			member.setTel(tel);
			member.setEmail(email);
			member.setGndr_Cd(Integer.parseInt(gndr_Cd));
			member.setAddr_No(Integer.parseInt(addr_No));
			member.setAddr1(addr1);
			member.setAddr2(addr2);
			check = dao.add(member);
			
			mav.addObject("UserInsertcheck",check);
			mav.setViewName("main/userJoin.jsp");
			System.out.println(check);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return mav;	
	}	
}
