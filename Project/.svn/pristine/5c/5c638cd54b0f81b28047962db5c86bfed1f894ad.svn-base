package class3.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class Adv_AjaxController implements Controller
{
	private Iwedding_select_DAO  dao;
	
	public void setDao(Iwedding_select_DAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// Ajax 에서 값을 불러온다. (내용, 평점, 작성자, 시간, 코드)
		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		
		//String userId = (String)session.getAttribute("checkid");
		String userId = "LJH";
		//String name = (String)session.getAttribute("checkname");
		String userName = "이준환";
		String ctnt = request.getParameter("advice");
		//String cd = request.getParameter("cd");
		String cd = "1";
		
		System.out.println("내용 : " + ctnt);
		System.out.println("작성자 : " + userId);
		
		try
		{	
			// 받은 데이터로 인설트를 시작합시다.
			dao.advInsert(cd, userId, ctnt);
			

			ArrayList<wedding_select_DTO> advCmtResult = dao.advList(cd);
			
			mav.addObject("advCmtResult",advCmtResult);
			mav.setViewName("/youngjin/Adv_Ajax.jsp");
			
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
			mav.setViewName("/error500.jsp");
		}
		
		
		return mav;
	}
}
