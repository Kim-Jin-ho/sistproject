<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jtest003.jsp</title>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript">

   $(function()
   {
      // 이벤트 처리 방법
      //-- 기존 방식에서는 버튼 요소에 『onclick=""』와 같은 이벤트 핸들러를 등록하여
      //   사용하였다면... jQuery 에서는 다음과 같은 방법을 사용하는 것이 가능하다.
      $("#btnOk").click(function()
      {
         // 폼 안에 존재하는 데이터를 가져오는 방법
         // 가존 방식에서는
         // var name = documnet.getElementById("textName").value;
         // ① text 에서 데이터 가져오기 (아이디로 접근)
         var msg = $("#txtName").val();
         //alert(msg);
         
         // ② radio 에서 데이터 가져오기
         msg += "\r\n"+ $("input:radio[name=g]:checked").val();
         // alert(msg);
         
         // ③ 다중 선택이 가능한 컨트롤에서 데이터 가져오기
         msg += "\r\n"+$("#hobby").val().join("|");
         
         // 현재까지 종합된 내용 경고창을 통해 띄우기
         alert(msg);
                 
      });
   });
	css("jquery-ui");

</script>
<link rel="stylesheet" href="jquery-ui.css"></link>
</head>
<body>

<div>
   <h2>jQuery 실습</h2>
   <hr>
</div>

<div>
   이름 : <input type="text" id="txtName"/><br>
   성별 :
   <input type="radio" id="gender1" value="M" name="g"/><label for="gender1">남자</label>
   <input type="radio" id="gender2" value="F" name="g"/><label for="gender2">여자</label>
   <br>
   취미 :
   <select multiple="multiple" id="hobby" size="4">
      <option value="이상하다">픽미픽미</option>
      <option value="영화감상">영화감상</option>
      <option value="티비시청">티비시청</option>
      <option value="음악감상">음악감상</option>   
   </select>
   <br>
   <button type="button" id="btnOk">확인</button>
</div>


</body>
</html>