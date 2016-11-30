<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
	String root = pageContext.getServletContext().getRealPath("/");
	String path = root + "pds" + File.separator + "saveData";
	
	out.print(root+"<br>");
	out.print(path+"<br>");
	
	File dir = new File(path);
	
	if(!dir.exists())
	{
		dir.mkdirs();	// dir 경로(=path)대로 폴더를 만들어라...
	}
	
	String encType = "UTF-8";
	int maxFileSize = 25*1024*1024;
	
	try
	{
		MultipartRequest req = null;
		req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
		// ※ MultipartRequest
		//-- request : request 객체
		//-- path : 업로드 될 파일이 저장될 파일의 디럭테리 경로
		//-- maxFileSize : 업로드 될 파일의 최대 크기
		//-- encType : 인코딩 방식 (꼭 "UTF-8" 방식일 필요는 없음)
		//-- new DefaultFileRenamePolicy()
		//   : 업로드 될 파일명이 기존에 업로드 되어 있는 다른 파일명과 같은 경우
		//     무작정 중복해서 덮어쓰기 하는 것을 방지하기 위한 코드
		
		out.println("파일이름 : " + req.getParameter("upload-name")+"<br>");
		out.println("서버에 저장된 파일명 : " + req.getFilesystemName("file")+"<br>");
		out.println("업로드한 파일명 : "+req.getOriginalFileName("file")+"<br>");
		out.println("파일 타입 : "+req.getContentType("file")+"<br>");
		
		
		File file = req.getFile("file");
		
		if(file != null)
		{
			out.println("<br>파일 길이 : " + file.length() + "<br>");
		}
		
		// test
		String admin_content = req.getParameter("admin_content");
		
		out.print("<br>내용: "+admin_content);
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	



	 
	
	 
%>




