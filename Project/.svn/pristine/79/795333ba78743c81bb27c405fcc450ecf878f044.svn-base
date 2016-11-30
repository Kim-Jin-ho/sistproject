<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_경고추가팝업(addWarning.jsp)</title>
<script type="text/javascript">
	/* 글자수제한 */
	function checkLength(comment) {
		if (comment.value.length > 50) {
			comment.blur();
			comment.value = comment.value.substring(0, 50);
			alert('50자 이내로 입력');
			comment.focus();
			return false;
		}
	}
</script>

</head>
<body>
	<section>
		<div>
			<form name="insertFrm">
				<textarea rows="4" cols="30" name="test" onKeyUp="checkLength(this)"
					placeholder="사유 입력" style="resize: none;"></textarea>
				<br> [~차경고]를 하시겠습니까? <br>
				<button type="button" onclick="">확인</button>
				<!-- 경고횟수 추가 후 close -->
				<button type="button" onclick="window.close();">취소</button>
			</form>
		</div>
	</section>
</body>

</html>