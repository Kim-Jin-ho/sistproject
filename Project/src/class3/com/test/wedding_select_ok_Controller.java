package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class wedding_select_ok_Controller implements Controller
{
	// wedding_select_ok.jsp 컨트롤러
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		/////////////////////////////////////////////////////////////////
		// 하나의 컨트롤러에서 진행하기 위해 어떤 버튼을 클릭했는지 확인한다.
		String buttonName = request.getParameter("buttonName");
		
		
		// 만약, 버튼의 name값이 상품평이라면
		
		/////////////////////////////////////////////////////////////////
		
		String love = request.getParameter("love");
		String userDay = request.getParameter("userDay");
		String userHalltypeSee = request.getParameter("userHalltypeSee");
		String userEatSee = request.getParameter("userEatSee");
		
		String remove = request.getParameter("remove");
		mav.addObject("remove", remove);
		
		
		mav.addObject("love",love);
		mav.addObject("userDay",userDay);
		mav.addObject("userHalltypeSee",userHalltypeSee);
		mav.addObject("userEatSee",userEatSee);
		
		mav.setViewName("wedding_select_ok.jsp");
		
		return mav;
	}
	
	
	public String a()
	{
		String a = "어디로간다.";
		
		
		
		
		return a;
	}
	
	
}
