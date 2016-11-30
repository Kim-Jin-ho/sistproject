package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MinWarningController implements Controller
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
		
		
		String cmpny_id = request.getParameter("cmpny_id");
		String usr_id = request.getParameter("usr_id");
		int warncount = Integer.parseInt(request.getParameter("warncount"));
		
		try
		{
			if(cmpny_id!=null)
			{
			
				if(warncount==3)
				{	
					dao.remove3(cmpny_id);
				}
				else if (warncount==2) 
				{
					dao.remove2(cmpny_id);
				}
				else if (warncount==1)
				{
					dao.remove1(cmpny_id);
				}
				
			
		
				System.out.println("왔어!!!! 기업회원삭제");
			
			
			
			
				mav.setViewName("redirect:AdminCoMemberList.love");
			
			}
			
			else
			{
				if(warncount==3)
				{	
					dao.remove6(usr_id);
				}
				else if (warncount==2) 
				{
					dao.remove5(usr_id);
				}
				else if (warncount==1)
				{
					dao.remove4(usr_id);
				}
				
			
		
				System.out.println("왔어!!!! 개인회원삭제");
			
			
			
			
				mav.setViewName("redirect:AdminPriMemberList.love");
			
				
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		
		}
		
		
		
		
		
		
		
		
		
		return mav;
		
		
	}
	
	
	
	
}
