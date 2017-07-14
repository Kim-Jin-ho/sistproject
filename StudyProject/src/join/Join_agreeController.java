package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class Join_agreeController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/jsp/join/join_agree.jsp");
		return mav;
	}

}
