<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 메인 화면</h2>
<table class="hi" border="1" style="width: 700px;height: 500px;">
	<tr>
		<td align="center" colspan="2">
			<jsp:include page="top.jsp" flush="false"/>
		</td> 
	</tr>
	<tr style="height: 300">
		<td valign="top" width="120"> 
			<jsp:include page="left.jsp" flush="false"/>
		</td>
		<td align="center">
			메인화면
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"> 
			<jsp:include page="bottom.jsp" flush="false"/>
		</td>		
	</tr>
</table>
</body>
</html>
