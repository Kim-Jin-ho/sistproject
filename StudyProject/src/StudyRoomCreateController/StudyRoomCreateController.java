package StudyRoomCreateController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.IShopDAO;
import dto.Shop;

public class StudyRoomCreateController implements Controller
{
	private IShopDAO dao;
	

	public void setDao(IShopDAO dao) {
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
		
		mav.addObject("list", list);
		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomCreate.jsp");
		return mav;
	}
	
}
