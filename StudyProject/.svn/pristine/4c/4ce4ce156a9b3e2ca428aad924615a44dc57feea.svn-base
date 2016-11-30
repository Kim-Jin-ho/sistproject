package MemberRoomMainController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomViewController implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		int srId = Integer.parseInt(request.getParameter("SRID"));
		System.out.println(srId);
		
		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		// 세션을 받아옴 (사업자번호, 사업자 이름)
		String nickname = (String)session.getAttribute("nickname");
		
		ArrayList<SreBoard> viewList = null;
		
		// 리플 담을 변수
		ArrayList<SreBoard> reList = null;
		
		ModelAndView mav = new ModelAndView();
		
		int recommend = 0, report = 0;
		int mid = 0;
		int reportCheck = 0, recommendCheck = 0;
		// 추천 리스트 갯수 불러오기
		int arrSize = dao.recommendCount();
		String recommendList[] = new String[arrSize];
		try
		{
			dao.hitUp(srId);
			// 추천 리스트 불러오기
			recommendList = dao.recommendList();
			// 추천수 불러오기
			recommend = dao.recommend(srId);
			// 신고수 불러오기
			report = dao.report(srId);
			// nickname으로 mid 찾기
			mid = dao.searchNum(nickname);
			// 추천 여부 체크
			recommendCheck = dao.recommendCheck(srId, mid);
			// 신고 여부 체크z
			reportCheck = dao.reportCheck(srId, mid);
			
			// 리플 불러오기
			reList = dao.reList(srId);
			
			viewList = dao.view(srId);
			
			// ArrayList 출력
			//System.out.println(viewList.get(0).getMemBer());
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		mav.addObject("reList", reList);
		mav.addObject("recommendList", recommendList);
		mav.addObject("recommendCheck",recommendCheck);
		mav.addObject("reportCheck",reportCheck);
		mav.addObject("nickname",nickname);
		mav.addObject("srId",srId);
		mav.addObject("recommend",recommend);
		mav.addObject("report",report);
		mav.addObject("viewList",viewList);
		

		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomView.jsp");
		
		return mav;
	}

}
