package class3.com.test;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;



public class wedding_main_AjaxController implements Controller
{
	private Iweeding_main_DAO dao;
	
	public void setDao(Iweeding_main_DAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		String regionMain = request.getParameter("regionMain");
		String regionSub = request.getParameter("regionSub");
		System.out.println(regionMain);
		System.out.println(regionSub);
		try
		{
			ArrayList<wedding_main_DTO> list = null;
			if (regionSub == null)
				list = dao.weddingSerchProduct(regionMain);
			else if (regionSub != null)
				list = dao.weddingSerchProduct(regionMain, regionSub);
			
			mav.addObject("list", list);
			System.out.println("ajax뷰 출동");
			
			mav.setViewName("/youngjin/wedding_main_Ajax.jsp");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}
	
}
