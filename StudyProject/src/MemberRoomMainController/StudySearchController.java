package MemberRoomMainController;

import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;
import util.MyUtil;

public class StudySearchController implements Controller
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
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		System.out.println(searchValue);
		
		System.out.println(searchKey+searchValue);
		ArrayList<SreBoard> studyApplyList = null;
		ArrayList<SreBoard> studyApplyList1 = null;
		System.out.println(searchKey);
		System.out.println(searchValue);
		
		int dataCount = 0;
		
		String pageIndexList = "";
		
		MyUtil myUtil = new MyUtil();
		
		String pageNum = request.getParameter("pageNum");
		
		try {
			
			int current_page = 1;

			if (pageNum != null)
			{
				
				current_page = Integer.parseInt(pageNum);

			}
			
			if(searchKey != null)
			{
				if(request.getMethod().equalsIgnoreCase("GET"))
				{
					searchValue = URLDecoder.decode(searchValue, "utf-8");
				}
			}
			else
			{
				searchKey = "SRID";
			}
			System.out.println(searchKey);
			System.out.println(searchValue);
			
			dataCount = dao.getDataCount(searchKey, searchValue);	
			System.out.println(dataCount);
			
			int numPerPage = 10;
			
			int total_page = myUtil.getPageCount(numPerPage, dataCount);
			
			int end = dataCount - ((current_page-1) *10);
			int start = dataCount - (current_page * numPerPage) +1;
			System.out.println(start);
			System.out.println(end);
			
			String listUrl = "StudyRoomSearch.room";
			
			pageIndexList = myUtil.pageIndexList(current_page, total_page, listUrl);
			
			//------------------------------------------------------
			System.out.println(end+"  gff");
 			studyApplyList = dao.lists2(start, end, dataCount, searchKey, searchValue);
 			studyApplyList1 = dao.list(start, end, dataCount);
			System.out.println(searchValue);
			System.out.println(studyApplyList);
			
			} catch (Exception e) 
			{
				System.out.println(e.toString());
			}
		
		mav.addObject("studyApplyList", studyApplyList);
		mav.addObject("studyApplyList1",studyApplyList1);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomSearch.jsp");
	
		return mav;
	}
	
}
