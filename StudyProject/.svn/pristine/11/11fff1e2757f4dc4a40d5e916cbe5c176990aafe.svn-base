package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMemberDAO;

public class JoinIdChkController implements Controller
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
			String id = request.getParameter("idid");
			
			int daoId = dao.getId(id);			
			
			int idokok = 0;
			
			if (daoId != 0)
			{
				idokok = 1;
			}		
			
			mav.addObject("idokok", idokok);
			mav.setViewName("/WEB-INF/jsp/join/join_value_ajax.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

}
