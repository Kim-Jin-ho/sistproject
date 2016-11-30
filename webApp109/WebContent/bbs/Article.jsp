<%@page import="com.board.BoardDTO"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
%>

<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 데이터 수신
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 검색 후 리스트 버튼 클릭 시 되돌아 가기 위한 세션 받아내기
	String searchKey = (String)session.getAttribute("searchKey");
	String searchValue = (String)session.getAttribute("searchValue");
	
	// 조회수 증가
	dao.updateHitCount(num);
	
	// 게시물 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	if(dto ==null)
	{
		response.sendRedirect("List.jsp");
	}
	
	// 글 라인 수
	int lineSu = dto.getContent().split("\n").length; 
	
	
	// 글 내용의 엔터(\N) 를 태그(<br>) 로 변경
	dto.setContent(dto.getContent().replaceAll("\n","<br>"));
	
	   String pre = dao.preNum(num);
	   
	   String str = "";
	   
	   if(pre != null){
	            
	      BoardDTO dto2 = dao.getReadData(Integer.parseInt(pre));
	   
	      str = "<a href= "+cp+"/bbs/Article.jsp?num="+pre+">이전글 : "+dto2.getSubject()+"</a>";
	   
	   }else{
	      
	      str = "없음";
	   }
	   
	   String next = dao.nextNum(num);
	   
	   String str1 = "";
	   
	   if(next != null){
	      
	      BoardDTO dto3 = dao.getReadData(Integer.parseInt(next));
	      
	      str1 = "<a href= "+cp+"/bbs/Article.jsp?num="+next+">다음글 : "+dto3.getSubject()+"</a>";
	      
	   }else{
	      
	      str1 = "없음";
	      
	   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게 시 판 (Article.jsp)</title>
<link rel="stylesheet" href="<%=cp %>/bbs/data/css/article.css">
<link rel="stylesheet" href="<%=cp %>/bbs/data/css/style.css">
</head>
<body>

<div id="bbs">
	<div id="bbs_title">
		게 시 판 (JDBC 버전)
	</div>
	
	<div id="bbsArticle">
		<div id="bbsArticle_header">
			<%=dto.getSubject() %>
		</div>
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd><%=dto.getName() %></dd>
				<dt>라인수</dt>
				<dd><%=lineSu %></dd>
			</dl>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd><%=dto.getCreated() %></dd>
				<dt>조회수</dt>
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div>
		
		<div id="bbsArticle_content">
			<table>
				<tr>
					<td>
						<%=dto.getContent()%>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<%=str1 %>	
		</div>
		<div class="bbsArticle_bottomLine">
			<%=str %>
		</div>
	</div>
	
	<div class="bbsArticle_noLine">
		<%=dto.getIpAddr() %>
	</div>
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<button type="button" 
			onclick="javascript:location.href='<%=cp%>/bbs/Updated.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type="button"
			onclick="javascript:location.href='<%=cp%>/bbs/Deleted.jsp?num=<%=dto.getNum()%>'">삭제</button>
		</div>
		<div id="rightFooter">
			<button type="button"onclick="javascript:location.href='<%=cp%>/bbs/List.jsp?searchKey=<%=searchKey %>&searchValue=<%=searchValue%>&pageNum=<%=pageNum%>'">리스트</button>
		</div>
	</div>
	
</div>
</body>
</html>