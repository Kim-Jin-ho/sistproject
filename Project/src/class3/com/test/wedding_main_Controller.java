package class3.com.test;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class wedding_main_Controller implements Controller
{	
	private Iweeding_main_DAO dao;
	
	public void setDao(Iweeding_main_DAO dao)
	{
		this.dao = dao;
	}

	// wedding_main.jsp 컨트롤러
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<wedding_main_DTO> advtResult = new ArrayList<wedding_main_DTO>();
		
		try
		{
			// 광고 첫화면에 뿌려줌
			advtResult = dao.mainAdvt();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
			mav.setViewName("/error500.jsp");
		}
		
		mav.addObject("advtResult", advtResult);
		mav.setViewName("wedding_main.jsp");
		
		return mav;
	}
	
}

















