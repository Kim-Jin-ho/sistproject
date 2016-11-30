<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String cp = request.getContextPath(); %>
<c:forEach var="dto" items="${list }">
	<a href="wedding_select.love?cd=${dto.prod_cd }">
	<div>
		<div><img src="${dto.img }"></div>
		<div>기업명 ${dto.name }</div>
		<div>주소 : ${dto.addr }</div>
		<div>최소가격 : ${dto.min }</div>
		<div>최대가격 : ${dto.max }</div>
	</div>
	</a>
</c:forEach>
