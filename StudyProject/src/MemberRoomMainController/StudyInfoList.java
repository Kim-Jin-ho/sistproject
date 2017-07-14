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


public class StudyInfoList implements Controller{

	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		String searchKey = request.getParameter("searchKey");
		
		String searchValue = request.getParameter("searchValue");
		
		ArrayList<SreBoard> studyApplyList = null;
		
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
			
			if(searchKey != null){
				
				if(request.getMethod().equalsIgnoreCase("GET")){
					
					searchValue = URLDecoder.decode(searchValue, "utf-8");
					
				}
				
			}else{
				
				searchKey = "SRID";
				
				searchValue = "";
				
			}
			dataCount = dao.getDataCount(searchKey, searchValue);
			
			System.out.println(dataCount);
			int numPerPage = 10;
			
			int total_page = myUtil.getPageCount(numPerPage, dataCount);
			
			int start = (current_page - 1) * numPerPage + 1;
			System.out.println(start);
			
			int end = current_page * numPerPage;
			System.out.println(end);
			String listUrl = "StudyRoomMain.room";
			
			pageIndexList = myUtil.pageIndexList(current_page, total_page, listUrl);
			
			//------------------------------------------------------
			
			studyApplyList = dao.list(start, end, dataCount);
			
		} catch (Exception e) {
			
			System.out.println(e.toString());
			
		}
		
		
		mav.addObject("studyApplyList", studyApplyList);
		mav.addObject("dataCount", dataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.setViewName("WEB-INF/jsp/StudyRoom/StudyRoomMain.jsp");
	
		return mav;
	}
}