package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UserPwCheckController implements Controller
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
	ModelAndView mav = new ModelAndView();
	
	String password = request.getParameter("password");
	String id = request.getParameter("id");
		
	try
	{		
		User user = new User();
		
		user = dao.userlist(id,password);
		
		if(user!=null)
		{
			mav.addObject("user",user);
			mav.setViewName("main/userUpdate.jsp");
		}
		else
		{
			mav.addObject("userpwcheck","1");
			mav.setViewName("main/userPwcheck.jsp");
		}
		
		
		
	} catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	return mav;
}	
}
