package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class DelProductController implements Controller
{

	private IProductDAO dao;

	public void setDao(IProductDAO dao) {
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		
		String cmpny_id = request.getParameter("cmpny_id");
		
		try 
		{
			
			dao.delete(cmpny_id);
			
			
		} catch (Exception e) 
		{
			
			System.out.println(e.toString());
		}
		
		mav.setViewName("redirect:AdminProductManagement.love");
		
		
		
		return mav;
	
	
	}
	
	
	
	
	
}
