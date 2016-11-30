<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<c:forEach var="dto" items="${prodCmtResult }">
	<div>
		<div>작성자 : ${dto.name} 시간 : ${dto.dt } 평점 : ${dto.scr }</div>
		${dto.ctnt }
		
		<div>상품평의 댓글</div>				 
	</div>
</c:forEach>