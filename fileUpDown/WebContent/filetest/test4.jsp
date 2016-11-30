<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContentType();
	
	//String root = request.getRealPath("/");	//-- 예전에 사용하던 방식
	
	String root = pageContext.getServletContext().getRealPath("/");
	
	// 실제 물리적인 주소
	System.out.println(root);
	//--> web 에서 실행하고... console 창에서 확인
	//--==>> K:\SsangYong\WebStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileUpDown\
	//		      [워크스페이스]
	
	// 중간 수정
	root="C:\\";
			
	// 저장되는 위치 및 디렉터리 구조 설정(separator : 분리 / 선별)
	String path = root + File.separator + "pds" + File.separator + "saveData";
	
	//저장 경로 상에 폴더(디렉터리) 가 존재하지 않으면 생성
	
	File dir = new File(path);
	if(!dir.exists())
	{
		dir.mkdirs();
	}
	
	String encType= "UTF-8";
	int maxFileSize = 5*1024*1024;
	
	try
	{
		MultipartRequest req = null; 
		req = new MultipartRequest(request, path, maxFileSize, encType
									, new DefaultFileRenamePolicy());
		// ※ MultiPartRequest
		// -- request : request 객체
		//	  path    : 업로드 될 파일이 저장될 파일의 디렉터리 경로
		//    maxFileSize : 업로드 될 파일의 최대 크기
		//	  encType : 인코딩 방식
		//    DefaultFileRenamePolicy()
		//    : 업로드 될 파일명이 기존에 업로드 되어 있는 다른 파일명과 같은 경우
		//      무작정 중복해서 덮어쓰기 하는 것을 방지 하기 위한 코딩
		
		out.print("이름 : " + req.getParameter("name")+"<br>");
		out.print("서버에 저장된 파일명 : " + req.getFilesystemName("upload")+"<br>");
		out.print("업로드한 파일명 : " + req.getOriginalFileName("upload")+"<br>");
		out.print("파일 타입 : "+ req.getContentType("upload")+"<br>");
		
		File file = req.getFile("upload");
		if(file != null)
		{
			out.println("파일 길이 : " +file.length() + "<br>");
		}
		
		
	}catch(Exception e)
	{
		System.out.print(e.toString());
	}

%>
