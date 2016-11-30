package class3.com.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class AddWarningInsertController implements Controller
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
		String warningctnt = request.getParameter("warning");
		int a = 10;
		
		try
		{
			if(cmpny_id!=null)
			{
				/*test*/
				System.out.println("오니? 기업회원 insert");
				Warning warning = new Warning();
				
				
				warning.setCmpny_id(cmpny_id);
				warning.setWarncount(warncount);
				warning.setWarning(warningctnt);
				
				
				
				/*test*/
				System.out.println(request.getParameter("cmpny_id"));
				System.out.println(request.getParameter("warncount"));
				System.out.println(request.getParameter("warning"));
				
				
				if(warncount==0)
				{
					
					a=dao.add1(warning);
					System.out.println(a);
				}
				else if (warncount==1) 
				{
					a =dao.add2(warning);
					System.out.println(a);
				}
				else if (warncount==2)
				{
					a =dao.add3(warning);
					System.out.println(a);
				}
				
				
				System.out.println("왔어!!!! 메소드 통과");
				
				
				//mav.setViewName("");
				mav.addObject("success",a);
				mav.setViewName("admin/warningSuccess.jsp");
				
			}
			else
			{
				/*test*/
				System.out.println("오니? 개인회원 insert");
				Warning warning = new Warning();
				
				
				warning.setUsr_id(usr_id);
				warning.setWarncount(warncount);
				warning.setWarning(warningctnt);
				
				
				
				/*test*/
				System.out.println(request.getParameter("usr_id"));
				System.out.println(request.getParameter("warncount"));
				System.out.println(request.getParameter("warning"));
				
				
				if(warncount==0)
				{
					
					a=dao.add4(warning);
					System.out.println(a);
				}
				else if (warncount==1) 
				{
					a =dao.add5(warning);
					System.out.println(a);
				}
				else if (warncount==2)
				{
					a =dao.add6(warning);
					System.out.println(a);
				}
				
				
				System.out.println("왔어!!!! 개인메소드 통과");
				
				
				//mav.setViewName("");
				mav.addObject("success",a);
				mav.setViewName("admin/warningSuccess.jsp");
				
			}
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	
		return mav;
		
	}
	
	
	
	
}
