package class3.com.test;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class wedding_main_ok_Controller implements Controller
{	
	private Iweeding_main_DAO dao;
	
	public void setDao(Iweeding_main_DAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{	
		ModelAndView mav = new ModelAndView();
		
		String addr11 = request.getParameter("map");
		String addr12 = request.getParameter("detailedMap");
		//String addr11 = request.getParameter("NationwideMap");
		//String addr12 = request.getParameter("regionMap");
		
		//String prodName = request.getParameter("prodName");
		//String sbjct = request.getParameter("sbjct");
		//String img = request.getParameter("img");
		//String pth = request.getParameter("pth");
		
		
		try
		{
			//ArrayList<wedding_main_DTO> result = dao.mainList(addr11, addr12, prodName, sbjct, img, pth);
			ArrayList<wedding_main_DTO> mainResult = dao.mainMap(addr11, addr12);
			ArrayList<wedding_main_DTO> advtajaxResult = dao.mainadvtajax(addr11, addr12);
			
			
			//mav.addObject("result", result);
			mav.addObject("mainResult", mainResult);
			mav.addObject("advtajaxResult",advtajaxResult);
			
			mav.setViewName("wedding_main_ok.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
		
		/*
		/////////////////////////////////////////////////////////////
				
		
		// jsp 딴 구문
		String map = request.getParameter("map");
		String detailedMap = request.getParameter("detailedMap");
		String hallType = request.getParameter("hallType");
		String eatMenu = request.getParameter("eatMenu");
		String eatPrice = request.getParameter("eatPrice");
		String people = request.getParameter("people");
					
		mav.addObject("map",map);
		mav.addObject("detailedMap",detailedMap);
		mav.addObject("hallType",hallType);
		mav.addObject("eatMenu",eatMenu);
		mav.addObject("eatPrice",eatPrice);
		mav.addObject("people",people);

		
		//mav.setViewName("wedding_main_ok.jsp");
		
		
		return mav;
		*/
		
	}
	

}
