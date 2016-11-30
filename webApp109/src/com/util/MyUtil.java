/*========================
   MyUtil.java
   - 게시판 페이징 처리
========================*/

package com.util;

public class MyUtil
{
   // ■ 전체 페이지 수를 구하는 메소드
   // numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
   // dataCount : 전체 데이터(게시물)의 수
   // → 한 페이지 표시할 데이터 갯수를 구한 변수와
   //    데이터 수를 구한 변수를 인자값으로 받는다.
   public int getPageCount(int numPerPage, int dataCount)
   {
      // 전체 페이지 수
      int pageCount = 0;
      pageCount = dataCount / numPerPage;
      // 만약 총 데이터 갯수가 15개 이고...
      // 페이지 표시하고 싶은 데이터 수가 10개라면
      // 15 / 10 = 1 이다.
      
      if(dataCount % numPerPage != 0)
         pageCount++;      
      // 그래서 여기서 나머지 구하기 연산을 해줘서
      // 0 이 아니면 페이지 수는 +=1 !!!!
      // 그래서 2 페이지가 리턴된다
      
      return pageCount;
   }   
   // 한 페이지에 10 개의 게시물을 출력할 때
   // 총 32 개의 게시물을 페이지로 구성하기 위해서는
   // 32 / 10 연살을 수행하면 결과 3을 얻을 수 있다.
   // → 『pageCount = dateCount / numPerPage;』
   // 그런데 이 때,
   // 나머지 2 개의 게시물을 출력하기 위해서는
   // 페이지가 하나 더 필요하다.
   
   
   
   // ■ 페이징 처리 기능의 메소드
   // current_page : 현재 표시할 페이지
   // total_page : 전체 페이지 수
   // list_url : 링크를 설정할 url
   public String pageIndexList(int current_page, int total_page, String list_url)
   {
      // 실제 페이징을 저장할 StringBuffer 변수
      StringBuffer strList = new StringBuffer();
      
      int numPerBlock = 10;   // 페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여주겠다.
      int currentPageSetup;   // 현재 페이지 (이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문에...)   
      int page;            // 
      int n;               // 이전페이지블록과 같은 처리에서 이동하기 위한 변수 (얼만큼 이동해야하느냐...)
      
      // 페이징 처리가 별도로 필요하지 않은 경우
      // 데이터가 없거나 한페이지에 다 채워지지 않은 경우는 페이징 처리를 별도로 할 필요가 없다.
      if (current_page == 0)
         return "";
      
      
      // ○ 『list_url』 전처리
      // IF문을 지났다는것은 한페이지 이상이라는 것!
      // GET 방식으로 처리하는 과정에서
      // URL 경로의 패턴에 대한 처리
      // 검색기능 때문에 추가하는 구문!
      /*
      abcd.jsp            ?key=value
      abcd.jsp&name=hong    &key=value
        
      ? 붙일때가 있고 & 붙일 때가 있다
       */
      if (list_url.indexOf("?") != -1)  // 입력받은 list_url 에 『?』 가 있다면 (GET방식)
         list_url = list_url + "&";
      else                       // 입력받은 list_url 에 『?』 가 없다면 (POST방식 → GET방식으로 전환)
         list_url = list_url + "?";
      // 검색값이 존재하면 이미 request 값에 searchKey rkqtrhk value 값이 들어있는 상황이므로
      // 『&』를 붙여서 추가해 주어야 한다.
      
      // currentPageSetup = 표시할 첫 페이지 - 1
      currentPageSetup = (current_page / numPerBlock) * numPerBlock;
      // 막약 현재 페이지가 5페이지이고 (current_page = 5)                          //    0   1  2  3  4  5  6  7  8  9 10       
      // 리스트 하단에 보여줄 페이지 갯수가 10 이면 (numPerBlock = 10)              //    10 11 12 13 14 15 16 17 18 19 20       0 과 10이 currentPageSetup
      // 『5 / 10 = 0』 이며... 여기에 『* 10』 (10을 곱해도)을 해도 0 이다.
      // 하지만 현재 페이지가 11 페이지라면 (current_page = 11)
      // 『11 / 10 = 1』 이며... 여기에 『* 10』 (10을 곱하면) 을 하면 10 이다.
      // 그러면 currentPageSetup 은 10 이 되는 것이다.
            
      if (current_page % numPerBlock == 0)
         currentPageSetup = currentPageSetup - numPerBlock;
      // 만약 위에서 한 처리에서 현재 페이지가 20페이지 였다면 (current_page = 20)
      // 『20 / 10 = 2』 이며... 여기에 『* 10』 (10을 곱해서)을 해서 20 이 되는데
      // 이 경우 다시 10을 빼서 10으로 만들어 준다.
      
      
      
      // 1 페이지
      if ( (total_page > numPerBlock) && (currentPageSetup > 0) )   
      {
         strList.append(" <a href='" + list_url + "pageNum=1'> 1 </a> ");
      }
      
      // Prev   numPerBlock만큼 이전으로 간다
      n = current_page - numPerBlock;   // 『n』 : 해당 페이지만큼 앞으로 가기 위한 변수    23에서 Prev를 누르면 13페이지로 이동하기위한 변수
      if ( (total_page > numPerBlock) && (currentPageSetup > 0) )
      {
         strList.append(" <a href='" + list_url + "pageNum=" + n + "'>Prev</a> ");         
      }
      // currentPageSetup 이 0 보다 큰 경우는 이미 페이지가 10 이상이라는 의미이며
      // 이 때 현재 페이지(current_page) 가 11 이상일 경우 Prev 를 붙이기 위한 내용
      // Prev 를 클릭할 경우 n 변수 페이지로 이동하는데 12 에서 Prev를 할 경우
      // 2 페이지가 되게끔 처리
      
      // 바로 가기 페이지
      page = currentPageSetup + 1;
      // currentPageSetup 에다가 『+ 1』 를 하는 이유는
      // 앞에서 currentPageSetup 에서 10을 가져왔다면
      // 10부터 시작하는 것이 아니라 11 부터 시작해야 하기 때문에 해준다.
      
      while ( (page <= total_page) && (page <= currentPageSetup + numPerBlock) )
      {
         if (page == current_page)
            strList.append("<font color='orange'>" + page + "</font>");
         else
            strList.append(" <a href='" + list_url + "pageNum=" + page + "'>" + page + "</a> ");
         page++;
      }
      
      // Next
      n = current_page + numPerBlock;
      if ( (total_page - currentPageSetup) > numPerBlock )
      {
         strList.append(" <a href='" + list_url + "pageNum=" + n + "'>Next</a> ");
      }
         
      // 마지막 페이지
      if ( (total_page > numPerBlock) && ((currentPageSetup + numPerBlock) < total_page) )
      {
         strList.append(" <a href='" + list_url + "pageNum=" + total_page + "'>" + total_page + "</a> ");
      }
      
      return strList.toString();
         
   }
}