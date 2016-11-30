package StudyRoomCreateController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;

public class StudyRoomDeleteController implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

	ModelAndView mav = new ModelAndView(); 
	
	HttpSession session = request.getSession();
	String nickname = (String)session.getAttribute("nickname");
	
    String srId = request.getParameter("SRID");
    
    System.out.println("글번호:"+srId);
    
    
    
    try 
    {
    	
    	dao.sreDelete(srId);
    	
    	
	} catch (Exception e) {

		System.out.println(e.toString());
	}
    
    
		mav.setViewName("redirect:StudyRoomMain.room");
		return mav;
	
	}
	
}
