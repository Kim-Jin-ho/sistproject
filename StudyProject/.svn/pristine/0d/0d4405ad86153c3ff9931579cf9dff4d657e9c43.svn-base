package StudyRoomCreateController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import dao.SreBoardDAO;
import dto.SreBoard;

public class StudyRoomInsertController implements Controller
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
   
    
    
    
    
    
    System.out.println("스터디룸 인서트 컨트롤러 값");
    System.out.println(title);
    System.out.println(location);
    System.out.println(shopId);
    System.out.println(timeCheck);
    System.out.println(price);
    System.out.println(content);
    System.out.println(minTime);
    System.out.println(consent);
    System.out.println(noiseCheck);
    System.out.println(wifiCheck);
    System.out.println(inwon);
    System.out.println(yesnoCheck);
    
    
    
    
    
    
    

    SreBoard sreboard = null;
    
    String mid = "";
    
    try {
		
    	sreboard = new SreBoard();
    	
    	int srId =  dao.memberId(nickname);
    	System.out.println("srId  :" + srId);
    	
    	sreboard.setShopNo(title);
    	sreboard.setSrId(srId);
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

    	dao.sreCreate(sreboard);
    	
    	mid = dao.getMid(nickname);
    	dao.insertSave(mid);
    	
    	
	} catch (Exception e) {

		e.toString();
	
	}
    
    
    
    mav.setViewName("redirect:StudyRoomMain.room");
	return mav;
	}
	
}
