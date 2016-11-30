package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomViewDeleteController implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		int srId = Integer.parseInt(request.getParameter("srId"));
		int scId = Integer.parseInt(request.getParameter("scId"));
		System.out.println(srId + scId);
		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		// 세션을 받아옴 (사업자번호, 사업자 이름)
		String nickname = (String)session.getAttribute("nickname");
		
		
		try
		{
			dao.reDelete(scId);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}


		mav.setViewName("redirect:StudyRoomView.room?SRID=" + srId);
		
		return mav;
	}

}
