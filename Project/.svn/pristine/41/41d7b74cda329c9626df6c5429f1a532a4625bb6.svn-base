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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">

	/* 글자수제한 */
	function checkLength(comment) {
	    if (comment.value.length > 50 ) {
	        comment.blur();
	        comment.value = comment.value.substring(0, 50);
	        alert('50자 이내로 입력');
	        comment.focus();
	        return false;
	    }
	}
	
	
	$(document).ready(function()
   {
      $("#submitBtn").click(function()
      {
         //데이터 검사(누락된 입력값 검사)후 submit 액션
         if($("textarea").val()=="")
         {
            alert("경고 사유를 입력하세요.");
   
         }   
         
         //submit액션처리
         $("#addWarnForm").submit();
            
      });
            
   });
	

	

</script>

</head>
<body>


	
<form action="AddWarningInsert.love" method="post" id="addWarnForm" >
	<textarea rows="4" cols="30" name="warning" id="warning" onKeyUp="checkLength(this)" placeholder="사유 입력" style="resize: none;"></textarea>
	<br>
	<input type="hidden" name="warncount" value="${warncount }" readonly="readonly" >${warncount +1 }차 경고를 하시겠습니까?
	<br>
	<input type="text" name="cmpny_id" id="cmpny_id" value="${cmpny_id }" readonly="readonly"><br>
	<button type="button" id="submitBtn">확인</button> 
	<button type="button" onclick="location.href='AdminCoMemberList.action'">취소</button>
</form>


</body>

</html>