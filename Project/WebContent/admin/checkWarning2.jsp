<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_경고차감팝업(minWarning.jsp)</title>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
</head>
<body>
<form name="insertFrm">
	<c:forEach var="user" items="${warningList }">
	<textarea rows="4" cols="30" name="test" onKeyUp="checkLength(this)" placeholder="사유 입력" style="resize: none;" readonly="readonly">
-경고내용-
아이디 : ${user.usr_Id }
<c:if test='${!empty user.warn1}'> 1차경고사유 : ${user.warn1 } </c:if>
<c:if test='${!empty user.warn2}'> 2차경고사유 : ${user.warn2 } </c:if>
<c:if test='${!empty user.warn3}'> 3차경고사유 : ${user.warn3 } </c:if>
	
	</textarea>
	<br>
	<br>
	<button type="button" onclick="window.close();">확인</button>
	</c:forEach>
</form>
</body>

</html>