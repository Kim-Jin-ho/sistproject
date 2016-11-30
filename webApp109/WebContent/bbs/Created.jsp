<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게 시 판(Created.jsp)</title>
<link rel="stylesheet" href="data/css/created.css">
<script type="text/javascript"src="<%=cp%>/bbs/data/js/util.js"></script>
<script type="text/javascript">
	
	function sendIt()
	{
		var f = document.myForm;
		
		var str = f.subject.value;	// 가나
		str = str.trim();			// javascript에는 trim이 없다. (외부에 생성 : util.js)
		
		if(!str)
		{
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		//f.subject.value = str;
		
		
		str = f.name.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n이름을 입력하세요.");
			f.name.focus();
			return;
		}
		f.name.value = str;
		
		str = f.email.value;
		str = str.trim();
		
		if(str)
		{
			if (!isValidEmail(str))
			{
				alert("\n정상적인 E-MAIL을 입력하세요.");
				f.email.focus();
				return;
			}
		}
		
		str = f.content.value;
		if(!str)
		{
			alert("\n내용을 입력하세요");
			f.content.focus();
			return;
		}
		
		str = f.pwd.value;
		str = str.trim();
		
		if(!str)
		{
			alert("\n패스워드를 입력하세요");
			f.pwd.focus();
			return;
		}
		f.pwd.value = str;
		
		f.action = "<%=cp%>/bbs/Created_ok.jsp";
		
		f.submit();
		
	}
</script>
</head>
<body>

<div id='bbs'>
   <div id='bbs_title'>
      게 시 판 (JDBC 버전)
   </div>
   
   <form action="" name="myForm" method="post">
   
      <div id="bbsCreated">
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
               <dd>
                  <input type="text" name="subject" maxlength="100" style="width: 250px" class="boxTF">
               </dd>               
            </dl>
         </div>
         
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>작성자</dt>
               <dd>
                  <input type="text" name="name" maxlength="30" class="boxTF">
               </dd>
            </dl>
         </div>
         
         <div class="bbsCreated_bottomLine">
            <dl>
               <dt>E-Mail</dt>
               <dd>
                  <input type="email" name="email" maxlength="50" class="boxTF">
               </dd>
            </dl>         
         </div>   
         
         <div id="bbsCreated_content">
            <dl>
               <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
               <dd>
                  <textarea name="content" rows="10" cols="60" class="botTA"></textarea>
               </dd>
            </dl>
         </div>
         
         <div class="bbsCreated_noLine">
            <dl>
               <dt>패스워드</dt>
               <dd>
                  <input type="password" name="pwd" maxlength="20" class="boxTF" size="20">
                  &nbsp;<span id="notice">(게시물 수정 및 삭제 시 필요 !!!)</span>
               </dd>
            </dl>         
         </div>
         
         <div id="bbsCreated_footer">
            <button type="button" class="btn1"onclick="sendIt();">등록하기</button>
            <button type="reset" class="btn1"onclick="document.myForm.subject.focus()">다시입력</button>
            <button type="button" class="btn1"onclick="javascript:location.href='<%=cp%>/bbs/List.jsp'">작성취소</button>
         </div>
               
      </div>
   </form>
   
</div>
</body>
</html>