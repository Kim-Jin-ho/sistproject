package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomViewReportAjax implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		int srId = Integer.parseInt(request.getParameter("num"));
		
		
		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		// 세션을 받아옴 (사업자번호, 사업자 이름)
		String nickname = (String)session.getAttribute("nickname");
		
		int recommend = 0;
		int report = 0;
		int mid = 0;
		int reportCheck = 0;
		try
		{
			// nickname으로 mid 찾기
			mid = dao.searchNum(nickname);
			// 신고하기
			dao.reportInsert(srId, mid);
			// 신고수 불러오기
			report = dao.report(srId);
			// 신고 여부 체크
			reportCheck = dao.reportCheck(srId, mid);
			
			
			
			// ArrayList 출력
			//System.out.println(viewList.get(0).getMemBer());
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		mav.addObject("reportCheck",reportCheck);
		mav.addObject("nickname",nickname);
		mav.addObject("report",report);

		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomViewReportAjax.jsp");
		
		
		return mav;
	}
}
