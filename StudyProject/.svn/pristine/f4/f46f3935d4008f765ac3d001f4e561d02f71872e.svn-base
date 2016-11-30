package StudyRoomCreateController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.ShopDAO;
import dto.Shop;

public class ShopSelectController implements Controller
{

	private ShopDAO dao;

	public void setDao(ShopDAO dao) {
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Shop> list = new ArrayList<Shop>();
		
		try 
		{
			list = dao.list();
			
			
			
		} catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		mav.addObject("list",list);
		mav.setViewName("WEB-INF/jsp/StudyRoom/ShopSelect.jsp");
		
		
		return mav;
	}
	
	
	
	
	
}
