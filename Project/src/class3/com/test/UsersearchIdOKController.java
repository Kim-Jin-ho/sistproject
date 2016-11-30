package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class UsersearchIdOKController  implements Controller
{
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		
		try
		{	
			
			String idkk = request.getParameter("idkk");
			
			mav.addObject("idkk",idkk);
			mav.setViewName("main/idSearchSelect.jsp");
		
		} catch (Exception e)
		{
			
		}
		return mav;
	}	
}
