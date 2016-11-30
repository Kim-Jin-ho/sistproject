<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" href="css/main.css">
<script type="text/javascript">
	
	function sendIt()
	{
		var f = document.myForm;
		// 체크 및 검증할 내용 작성
		
		f.submit();
	}
</script>
</head>
<body>
<div>
	<h2>방명록 작성</h2>
	<hr>
</div>

<div>
	<form action="Guest_ok.jsp" method="post" name="myForm">
		이름 <input type="text" name="userName"><br>
		제목 <input type="text" name="subject"><br>
		내용 <textarea rows="5" cols="30" name="content"></textarea><br><br>
		<button type="button" onclick="sendIt()" class="activeControl">글 올리기</button>
				
	</form>
</div>
</body>
</html>