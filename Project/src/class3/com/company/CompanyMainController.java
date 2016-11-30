package class3.com.company;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class CompanyMainController implements Controller
{
   private ICompanyMainDAO dao;
   
   public void setDao(ICompanyMainDAO dao)
   {
      this.dao = dao;
   }

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
   {
      ModelAndView mav = new ModelAndView();
      
      // 세션을 사용하겠다는 의미
      HttpSession session = request.getSession();
      //session.setAttribute("checkname",name);
      
      // 세션을 받아옴 (사업자번호, 사업자 이름)
      String saNum = (String)session.getAttribute("checkid");
      String name = (String)session.getAttribute("checkname");
      //String checkNum = (String)session.getAttribute("checknum");   
            
      try
      {  
    	  // 경고 횟수 출력
         int warCount = dao.warCount(saNum);
         
         // 공지 출력
         ArrayList<CompanyMainDTO> noticeList = dao.noticeList();
         
         // 금일 처리해야되는 예약
         int rsvtnCount = dao.rsvtnCount(saNum);
         
         // 금일 처리해야되는 상담
         int advCount = dao.advCount(saNum);
         
         // 금일 처리해야되는 상품평
         int reviewCount = dao.reviewCount(saNum);
         
         // 일반 상품 대표 이미지
         String normalImg = dao.normalImg(saNum);
         
         // 일반 상품 금일 방문자 수
         int normalHitCount = dao.normalHitCount(saNum);
         
         // 일반 상품 금일 예약수
         int normalRsvtnCount = dao.normalRsvtnCount(saNum);
         
         // 일반 상품 금일 상담수
         int normalAdvCount = dao.normalAdvCount(saNum);
         
         // 일반 상품 금일 상품평수
         int normalReviewCount = dao.normalReviewCount(saNum);
         
         // 일반 상품 금일 상품평 점수
         int normalScore = dao.normalScore(saNum);
         
         // 할인 상품 대표 이미지
         String discountImg = dao.discountImg(saNum);
         
         // 할인 상품 금일 방문자 수
         int discountHitCount = dao.discountHitCount(saNum);
         
         // 할인 상품 금일 예약자 수
         int discountRsvtnCount = dao.discountRsvtnCount(saNum);
         
         // 할인 상품 금일 상담 수
         int discountAdvCount = dao.discountAdvCount(saNum);
         
         // 할인 상품 금일 상품평 수
         int discountReviewCount = dao.discountReviewCount(saNum);
         
         //할인 상품 금일 상품평 점수
         int discountScore = dao.discountScore(saNum);
         
         // 광고 상품 대표 이미지
         String advtImg = dao.advtImg(saNum);
         
         // 세션에서 받은 기업명을 전달
         mav.addObject("name", name);
         
         // dao에서 전달받은 경고횟수, 공지, 금일 처리해야 되는 현황 전달
         mav.addObject("warCount", warCount);
         mav.addObject("noticeList", noticeList);
         mav.addObject("rsvtnCount", rsvtnCount);
         mav.addObject("advCount", advCount);
         mav.addObject("reviewCount", reviewCount);
         
         // dao에서 일반 상품에 관한 정보를 전달 (대표이미지, 방문자, 예약, 상담, 상품평, 상품평 점수)
         mav.addObject("normalImg",normalImg);
         mav.addObject("normalHitCount",normalHitCount);
         mav.addObject("normalRsvtnCount",normalRsvtnCount);
         mav.addObject("normalAdvCount",normalAdvCount);
         mav.addObject("normalReviewCount",normalReviewCount);
         mav.addObject("normalScore",normalScore);
      
         // dao에서 할인 상품에 관한 정보를 전달 (대표 이미지, 방문자, 예약, 상담, 상품평, 상품평 점수)
         mav.addObject("discountImg",discountImg);
         mav.addObject("discountHitCount",discountHitCount);
         mav.addObject("discountRsvtnCount",discountRsvtnCount);
         mav.addObject("discountAdvCount",discountAdvCount);
         mav.addObject("discountReviewCount",discountReviewCount);
         mav.addObject("discountScore",discountScore);
         
         // dao에서 광고 상품에 관한 정보를 전달 (대표 이미지)
         mav.addObject("advtImg",advtImg);
         
         // 위 데이터들과 함께 아래의 뷰를 출동시킴
         mav.setViewName("/company/CompanyMain.jsp");

      }
      catch (Exception e)
      {
         System.out.println(e.toString());
         // 만약 예외가 발생된다면 500error 페이지가 출동!!
         mav.setViewName("/error500.jsp");
      }
      
      return mav;
   }


}