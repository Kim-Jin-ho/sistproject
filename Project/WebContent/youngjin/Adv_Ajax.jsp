<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<c:forEach var="dto" items="${advCmtResult }">
	<div>
		<div>작성자 : ${dto.name} 시간 : ${dto.dt } </div>
		${dto.ctnt }
		
		<div>상담의 댓글</div>				 
	</div>
</c:forEach>