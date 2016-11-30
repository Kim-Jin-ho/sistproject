package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LogoutController  implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		
		try
		{	
			
			HttpSession session = request.getSession();
			session.invalidate(); //모든세션정보를 지우고
			mav.setViewName("main/main.jsp");//메인으로 보낸다.
			
		} catch (Exception e)
		{
			
		}
		return mav;
	}	
}