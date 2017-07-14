package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMemberDAO;

public class JoinEmailChkController implements Controller
{
	private IMemberDAO dao;

	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			String email = request.getParameter("emailemail");	
			
			int daoEmail = dao.getEmail(email);
			
			int emailokok = 0;
			
			if (daoEmail != 0)
			{
				emailokok = 1;			
			}			
			
			mav.addObject("emailokok", emailokok);
			mav.setViewName("/WEB-INF/jsp/join/join_value_ajax.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
