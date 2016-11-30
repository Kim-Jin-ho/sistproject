package class3.com.company;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CompanyFileUploadController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		/************************[파일 업로드]****************************/
		
		request.setCharacterEncoding("UTF-8");
					
		String root = "C:";
		System.out.println(root);
        //                           구분
		// 저장되는 위치 및 디렉터리 구조 설정(separator : 분리 / 선별)
		String path = root + File.separator + "WebStudy" + File.separator + "Project" + File.separator + "WebContent" + File.separator + "images" + File.separator + "photo" + File.separator + "111111111" + File.separator;	
		
		// 저장 경로 상에 폴더(디렉터리)가 존재하지 않으면 생성
		File dir = new File(path);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		
		String encType = "UTF-8";
		int maxFileSize = 5*1024*1024;	//-- 전송 최대 사이즈 5Mega
		
		try
		{
			MultipartRequest req = null;
			req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
			// ※ MultipartRequest
			//-- request : request 객체
			//-- part : 업로드 될 파일이 저장될 디렉터리 경로
			//-- maxFileSize : 업로드 될 파일의 최대 크기
			//-- encType : 인코딩 방식
			//-- new DefaultFileRenamePolicy() 
			//   : 업로드 될 파일명이 기존에 업로드 되어 있는 다른 파일명과 같은 경우
			//     무작정 중복해서 덮어쓰기 하는 것을 방지하기 위한 코딩
			
			String fileRoot = path + req.getFilesystemName("upload");
			String fileRoot1 = path + req.getFilesystemName("upload1");
			String fileRoot2 = path + req.getFilesystemName("upload2");
			String fileRoot3 = path + req.getFilesystemName("upload3");
			System.out.println("저장 경로 : " + fileRoot);
			System.out.println("저장 경로 : " + fileRoot1);
			System.out.println("저장 경로 : " + fileRoot2);
			System.out.println("저장 경로 : " + fileRoot3);
		/*****************************************************************/
			
			
			
			mav.setViewName("redirect:test1.jsp");
			
			
			
		}catch(Exception e)
		{
			System.out.print(e.toString());
		}
		
		return mav;
	}
	
}
