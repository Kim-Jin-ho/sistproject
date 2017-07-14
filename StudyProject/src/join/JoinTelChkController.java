package join;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IMemberDAO;

public class JoinTelChkController implements Controller
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
			String tel = request.getParameter("teltel");
			
			int daoTel = dao.getTel(tel);
			
			int telokok = 0;
			
			if (daoTel != 0)
			{
				telokok = 1;
			}
			
			mav.addObject("telokok", telokok);
			mav.setViewName("/WEB-INF/jsp/join/join_value_ajax.jsp");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	
}
