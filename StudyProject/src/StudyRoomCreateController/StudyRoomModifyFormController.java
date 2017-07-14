package StudyRoomCreateController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.ShopDAO;
import dao.SreBoardDAO;
import dto.Shop;
import dto.SreBoard;

public class StudyRoomModifyFormController implements Controller
{

	private SreBoardDAO dao;
	private ShopDAO dao2;
	
	public void setDao(SreBoardDAO dao) {
		this.dao = dao;
	}
	
	

	public void setDao2(ShopDAO dao2) {
		this.dao2 = dao2;
	}



	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		ArrayList<SreBoard> lists = new ArrayList<SreBoard>();
		ArrayList<Shop> list = new ArrayList<Shop>();
		
		String srId = request.getParameter("SRID");
		
		try {
			
			lists=dao.sreList(srId);
			list=dao2.list();
			
		} catch (Exception e) { 

			System.out.println(e.toString());
		
		}
		
		 
		
		mav.addObject("lists",lists);
		mav.addObject("list",list);
		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomModifyForm.jsp?SRID="+srId);
		
		
		return mav;
	
	
	
	}
	
	
	
	
	
}
