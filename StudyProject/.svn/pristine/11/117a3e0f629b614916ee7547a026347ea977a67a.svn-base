package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class JoinFormController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		String allAgree = request.getParameter("allAgree");
		
		
		
		
		HttpSession session = request.getSession();
		
		session.setAttribute("allAgree", allAgree);
		
		
		
		
		if (allAgree.equals("1"))
		{
			mav.setViewName("redirect:GotoJoinForm.room");
		}
		else
		{
			mav.setViewName("redirect:join_agree.room");
		}
		
		return mav;
	}

}
