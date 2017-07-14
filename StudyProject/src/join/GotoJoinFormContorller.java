package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class GotoJoinFormContorller implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String allAgree = (String)session.getAttribute("allAgree");
		
		
		
		if (allAgree != null)		
		{
			session.removeAttribute("allAgree");
			mav.setViewName("/WEB-INF/jsp/join/join_form.jsp");
		}
		else
		{
			mav.setViewName("/WEB-INF/jsp/join/join_agree.jsp");
		}
		
		
		return mav;
	}

}
