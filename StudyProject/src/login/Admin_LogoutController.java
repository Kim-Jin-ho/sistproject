package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class Admin_LogoutController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		
		//로그아웃 진행
		if (admin.equals("admin"))
		{
			//세션 비우기
			session.setAttribute("admin", null);
		}
		mav.setViewName("StudyMain.room");
		return mav;
	}
	
	

}
