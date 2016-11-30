package StudyRoomCreateController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class ShopAddFormController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("WEB-INF/jsp/StudyRoom/ShopAdd.jsp");
		
		return mav;
	
	
	}
	
	
	
	
}
