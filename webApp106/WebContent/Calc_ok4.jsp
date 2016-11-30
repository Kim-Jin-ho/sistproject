<%@ page contentType="text/html; charset=UTF-8"%>

<!-- class3.com.test.Calc ob = new class3.com.test.Calc(); -->
<jsp:useBean id="ob" class="class3.com.test.Calc"></jsp:useBean>

<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/calc.css">
</head>
<body>

<div>
   <h2>계산 결과</h2>
   <hr>
</div>

<div>
   <h4><%=ob.result() %></h4>
</div>

</body>
</html>