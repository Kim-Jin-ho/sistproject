<%@page import="class3.com.test.MemberScoreDAO"%>
<%@page import="class3.com.test.MemberScoreDTO"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%

	// MemberScoreInsert.jsp
	/*=================================================================
	① 필요한 데이터 수신
	
	② MemberScoreDTO 구성
	
	③ MemberScoreDAO 에 정의된 add(MemberScoreDTO score) 메소드 호출
	
	④ 테이블에 데이터 입력(TBL_MEMBERSCORE)
            ↓
    ⑤ 페이지 이동 (MemberScoreSelect.jsp)
	
	=================================================================*/
	
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	MemberScoreDTO member = new MemberScoreDTO();
	
	member.setSid(sid);
	member.setKor(Integer.parseInt(kor));
	member.setEng(Integer.parseInt(eng));
	member.setMat(Integer.parseInt(mat));
	
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try{
		
		// 데이터베이스 연결 
		dao.Connection();
		
		dao.add(member);
		
	}catch(Exception e){
		
		System.out.println(e.toString());
		
	}finally{
		
		try{
			
			// 데이터베이스 연결 종료
			dao.close();
			
		}catch(Exception e){
			
			System.out.println(e.toString());
			
		}
		
	}
	
	
	response.sendRedirect("MemberScoreSelect.jsp");
	
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>memberScoreInsert.jsp</title>
</head>
<body>

</body>
</html>