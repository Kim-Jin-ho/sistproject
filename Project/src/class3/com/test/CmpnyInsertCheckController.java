package class3.com.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CmpnyInsertCheckController implements Controller
{
	private ICmpnyDAO dao; // 의존성 멤버주입을위해선 인터페이스 형의 자료형을 띄어야 하므로 멤버타입을 인터페이스 형으로 갖고 있어야한다.           
	
	public void setDao(ICmpnyDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		try
		{			
			String search_cmpid = request.getParameter("search_cmpid");
			//System.out.println(search_cmpid);
			int idNum = 0;
		
			idNum = dao.cmpnyidcheck(search_cmpid);
			mav.addObject("idNum", idNum);
			mav.setViewName("ajax/ajaxcheck.jsp");
									
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
		
	}
}