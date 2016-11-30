package class3.com.company;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductInsertOkController implements Controller
{
	private IProductInsertDAO dao;
	
	public void setDao(IProductInsertDAO dao)
	{	
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse arg1) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 세션을 사용하겠다는 의미
		HttpSession session = request.getSession();
		//session.setAttribute("checkname",name);
		
		// 세션을 받아옴 (사업자번호, 사업자 이름)
		String saNum = (String)session.getAttribute("checkid");
		String name = (String)session.getAttribute("checkname");
		//String checkNum = (String)session.getAttribute("checknum");
		
		// 이미지 경로를 받기 위한 변수 선언
		String[] pth = null;
		int size = 0;
		
		String[] temp = null;
		// DB에서 일반 상품을 조회하여 넣는다.
		if (dao.prod_check(saNum) >= 1)
		{
			System.out.println("이미 상품이 존재합니다. 업데이트를 진행해야합니다.");
			
			
			/************************[파일 업로드]****************************/
			
			request.setCharacterEncoding("UTF-8");
						
			String path = request.getServletContext().getRealPath("/");
			
			System.out.println(path);	
			
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
				System.out.println("저장 경로 : " + fileRoot);
				
				
			/*****************************************************************/
			
				// 게시글 제목을 불러옴.
				String subject = req.getParameter("subject");
				// 대 카테고리를 배열로 불러옴
				String[] bigCtr = req.getParameterValues("bigCtr");
				
				
				fileRoot = fileRoot.replace("C:\\WebStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\", "..\\");
				System.out.println("저장 경로 : " + fileRoot);
				
				
				
				String[] cd = dao.prod_tbl_Update(subject, fileRoot, saNum);
				
				for (String string : cd)
				{
					System.out.println("cd : " + string);
				}
				
				// 배열 선언
				String[] bigArr = null;
				String[] smallArr = null;
				
				System.err.println("컨트롤러 진입확인");
				// 상품 종류 테이블 등록
				String str = dao.prod_tp_tbl_Update(cd, bigCtr, saNum);
				
				temp = str.split("/");
				
				
				
				
				
				///////////////////////////////////////////////////////////////////
				
				for (int i = 0; i < temp.length; i++)
				{
					bigArr = temp[i].split(",");
				
					for (String string : bigArr)
					{
						System.out.println("bigArr : " + string);
					}
					
					// 소 카테고리를 배열로 불러옴
					String[] smallCtr = req.getParameterValues("smallCtr" + (i+1));
					for (String string : smallCtr)
					{
						System.out.println("smallCtr : " + string);
					}
					// 가격을 배열로 불러옴
					String[] prc = req.getParameterValues("prc" + (i+1));
					for (String string : prc)
					{
						System.out.println("prc : " + string);
					}
					//String code = bigArr[i];
					
					
					str = "";
					for (int j = 0; j < bigArr.length; j++)
					{
						if (req.getFilesystemName("upload" + size) != null)
						{
							str = str + "..\\" + req.getFilesystemName("upload" + size) + ",";
							size++;
						}
					}
					pth = str.split(",");
					
					for (String string : pth)
					{
						System.out.println("pth : " + string);
					}
					
					
					// 상세 상품 테이블 등록
					smallArr = dao.dtl_prod_Update(bigArr, smallCtr, prc, pth);
					
					/*for (String string : smallArr)
					{
						str = str + string + ",";
					}
					
					// 배열 길이를 알아낸다.
					count = count + smallArr.length;*/
				}
				/*System.out.println("check123");
				smallArr = str.split(",");
				for (String string : smallArr)
				{
					System.out.println("smallArr : " + string);
				}
				System.out.println("check456");*/
				
				//////////////////////////////////////////////////////////////////////
				
				
				
				
				
				
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
				mav.setViewName("/error500.jsp");
			}
		}
		else
		{
			System.out.println("상품이 존재하지 않습니다. 인설트 단계를 진행합니다.");
			
			/************************[파일 업로드]****************************/
			
			request.setCharacterEncoding("UTF-8");
						
			String path = request.getServletContext().getRealPath("/");
			
			System.out.println(path);	
			
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
				System.out.println("저장 경로 : " + fileRoot);

				
			/*****************************************************************/
				
							
				// 게시글 제목을 불러옴.
				String subject = req.getParameter("subject");
				System.out.println("제목 : " + subject);
				
				// 대 카테고리를 배열로 불러옴
				String[] bigCtr = req.getParameterValues("bigCtr");
				for (String string : bigCtr)
				{
					System.out.println("대 카테고리 : " + string);
				}
				// 소 카테고리의 이미지를 배열로 불러옴
				
				// 배열 길이를 알기 위한 데헷
				int count = 0;
				
				// 배열의 내용을 합치기 위한 데헷
				String str = "";
				
				// 상품 등록 테이블 등록
				fileRoot = fileRoot.replace("C:\\WebStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\", "..\\");
				System.out.println("저장 경로 : " + fileRoot);
				
				String cd = dao.prod_tbl_Insert(saNum, subject, fileRoot);

				
				// 배열 선언
				String[] bigArr = null;
				String[] smallArr = null;
				
				
				// 상품 종류 테이블 등록
				bigArr = dao.prod_tp_tbl_Insert(cd, bigCtr);
				
				for (String string : bigArr)
				{
					System.out.println("bigArr : " + string);
				}
				
				// 상세 상품 테이블
				for (int i = 0; i < bigArr.length; i++)
				{
					// 소 카테고리를 배열로 불러옴
					String[] smallCtr = req.getParameterValues("smallCtr" + (i+1));
					
					// 가격을 배열로 불러옴
					String[] prc = req.getParameterValues("prc" + (i+1));
					cd = bigArr[i];
					
					
					str = "";
					for (int j = 0; j < smallCtr.length; j++)
					{
						if (req.getFilesystemName("upload" + size) != null)
						{
							str = str + "..\\" + req.getFilesystemName("upload" + size) + ",";
							size++;
						}
					}
					pth = str.split(",");
					
					for (String string : pth)
					{
						System.out.println("pth : " + string);
					}
				
					
					// 상세 상품 테이블 등록
					smallArr = dao.dtl_prod_Insert(cd, smallCtr, prc, pth);
					
					for (String string : smallArr)
					{
						str = str + string + ",";
					}
					
					// 배열 길이를 알아낸다.
					count = count + smallArr.length;
				}
				smallArr = str.split(",");
				for (String string : smallArr)
				{
					System.out.println("smallArr : " + string);
				}

				
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
				mav.setViewName("/error500.jsp");
			}
		}
				
		System.out.println("리 다이렉트 실행");
		mav.setViewName("redirect:CompanyProductManagement.love");
		
		return mav;
	}
}
