package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class searchPwOKController implements Controller
{
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		
		try
		{	
			
			String getuserpw = request.getParameter("getuserpw");
			System.out.println(getuserpw);
			mav.addObject("getuserpw",getuserpw);
			mav.setViewName("main/pwSearchSelect.jsp");
		
		} catch (Exception e)
		{
			
		}
		return mav;
	}	
}
