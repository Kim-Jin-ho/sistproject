package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class wedding_reserve_Controller implements Controller
{
	private Iwedding_reserve_DAO dao;

	public void setDao(Iwedding_reserve_DAO dao)
	{
		this.dao = dao;
	}
	
	// wedding_reserve.jsp
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{
			wedding_reserve_DTO dto = dao.reserveList();
			
			String usrName = dto.getUsrName();
			String usrId = dto.getUsrId();
			String usrTel = dto.getUsrTel();
			String usrEmail = dto.getUsrEmail();
			String gndr = dto.getGndr();
			
			mav.addObject("usrName", usrName);
			mav.addObject("usrId", usrId);
			mav.addObject("usrTel", usrTel);
			mav.addObject("usrEmail", usrEmail);
			mav.addObject("gndr", gndr);
			
			mav.setViewName("/youngjin/wedding_reserve.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	
	
	
	
}
