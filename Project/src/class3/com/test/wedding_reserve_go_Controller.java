package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class wedding_reserve_go_Controller implements Controller
{
	private Iwedding_reserve_DAO dao;

	public Iwedding_reserve_DAO getDao()
	{
		return dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		String usrName = request.getParameter("usrName");
		String usrId = request.getParameter("usrId");
		String usrTel = request.getParameter("usrTel");
		String usrEmail = request.getParameter("usrEmail");
		String gndr = request.getParameter("gndr");
		
		try
		{
			wedding_reserve_DTO dto = new wedding_reserve_DTO();
			
			dto.setUsrName(usrName);
			dto.setUsrId(usrId);
			dto.setUsrTel(usrTel);
			dto.setUsrEmail(usrEmail);
			dto.setGndr(gndr);
			
			dao.reserveList();
			
			mav.setViewName("redirect:wedding_reserve.love");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	
	
	
}
