package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class AddWarningInsertFormController implements Controller
{

	private IWarningDAO dao;

	public void setDao(IWarningDAO dao)
	{
		this.dao = dao;
	}



	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
	
		
		String usr_id = request.getParameter("usr_id");
		String cmpny_id = request.getParameter("cmpny_id");
		String warncount = request.getParameter("warncount");
	
		
		
		try
		{
			if (cmpny_id !=null) 
			{
				
			
			
			//String cmpny_id = request.getParameter("cmpny_id");
			//String warncount = request.getParameter("warncount");
			
			
			System.out.println(cmpny_id);
			System.out.println(warncount);
		
		
			mav.addObject("cmpny_id", cmpny_id);
			mav.addObject("warncount",warncount);
			
			
			
			mav.setViewName("admin/AddWarningInsertForm.jsp");

			
			}
			
			else
			{
				System.out.println(usr_id);
				System.out.println(warncount);
			
			
				mav.addObject("usr_id", usr_id);
				mav.addObject("warncount",warncount);
				
				
				
				mav.setViewName("admin/AddWarningInsertForm2.jsp");

			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		
		}
		
		
		
		return mav;
	}
	
	

	
	
	
}
