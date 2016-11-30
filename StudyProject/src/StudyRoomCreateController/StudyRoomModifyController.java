package StudyRoomCreateController;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomModifyController implements Controller
{
	private SreBoardDAO dao;

	public void setDao(SreBoardDAO dao) {
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ModelAndView mav = new ModelAndView(); 
		
		HttpSession session = request.getSession();
		String nickname = (String)session.getAttribute("nickname");
		
		ArrayList<SreBoard> viewList = null; 
		
		String srId = request.getParameter("SRID");
		System.out.println("게시글번호는"+srId);
	    String title = request.getParameter("title");
	    String location = request.getParameter("location");
	    String shopId = request.getParameter("shopId");
	    String timeCheck = request.getParameter("timeCheck");
	    String price = request.getParameter("price");
	    String content = request.getParameter("content");
	    String minTime = request.getParameter("minTime");
	    String consent = request.getParameter("consent");
	    String noiseCheck = request.getParameter("noiseCheck");
	    String wifiCheck = request.getParameter("wifiCheck");
	    String inwon = request.getParameter("inwon");
	    String yesnoCheck = request.getParameter("yesnoCheck");
	    
	    System.out.println("수정 컨트롤러 온다");
	    System.out.println(srId);
	    System.out.println(title);
	    System.out.println(location);
	    System.out.println(shopId);
	    System.out.println(timeCheck);
	    System.out.println(price);
	    System.out.println(minTime);
	    System.out.println(consent);
	    System.out.println(noiseCheck);
	    System.out.println(wifiCheck);
	    System.out.println(inwon);
	    System.out.println(yesnoCheck);
	    System.out.println(content);
	    
	    
	    SreBoard sreboard = null;
	    
	    
	    try {
			
	    	sreboard = new SreBoard();
	    	
	    	System.out.println("srId  :" + srId);
	    	
	    	sreboard.setSrId(Integer.parseInt(srId));
	    	sreboard.setShopNo(title);
	    	sreboard.setLocaTion(location);
	    	sreboard.setSouNd(noiseCheck);
	    	sreboard.setShopId(shopId);
	    	sreboard.setInWon(inwon);
	    	sreboard.setDetailCon(content);
	    	sreboard.setDayHours(timeCheck);
	    	sreboard.setPricE2(price);
	    	sreboard.setMinTime(minTime);
	    	sreboard.setYesNo(yesnoCheck);
	    	sreboard.setWiFi(wifiCheck);
	    	sreboard.setConSent(consent);
	    	
	    	dao.sreUpdate(sreboard);
	    	
	    	int intSrid = Integer.parseInt(srId);
	    	viewList = dao.view(intSrid);
	    	
	    	
		} catch (Exception e) {

			e.toString();
		
		}
		
	    mav.addObject("viewList",viewList);
	    mav.setViewName("redirect:StudyRoomView.room?SRID="+srId);
	    return mav;
		
		}
		
	

}
