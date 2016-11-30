/*==================================
		EmployeeModel
		- 모델 객체 (비지니스 로직)
==================================*/

package class3.com.test;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmployeeModel
{
	// 요청 액션을 수행할 메소드 추가
	/*
	public String 메소드이름(HttpServletRequest request, HttpServletResponse response)
	{
		// 비지니스 로직 처리 구문
		return "뷰 객체 이름";
	}
	*/
	
	public String employeeList(HttpServletRequest request, HttpServletResponse response)
	{
		// 비지니스 로직 처리 구문
		//-- 직원 정보를 읽어다가 뷰 객체에 전달하는 액션 처리
		ArrayList<EmployeeDTO> list = new ArrayList<EmployeeDTO>();
		EmployeeDAO dao = new EmployeeDAO();
		
		try
		{
			dao.connection();
			list = dao.employeeList();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}finally 
		{
			try
			{
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString()); 
			}
		}
		request.setAttribute("list", list);
		return "EmployeeList.jsp";
	}
	public String employeeinsert(HttpServletRequest request, HttpServletResponse response)
	{
		//비지니스 로직 처리 구문
		//-- 지역, 부서, 직위 정보 읽어서 뷰 객체에 전달하는 액션
		String result = "";
		// 지역
		ArrayList<EmployeeDTO> regionList = new ArrayList<EmployeeDTO>();
		// 부서
		ArrayList<EmployeeDTO> departmentList = new ArrayList<EmployeeDTO>();
		// 직위
		ArrayList<EmployeeDTO> positionList = new ArrayList<EmployeeDTO>();
		
		// dao 객체 생성
		EmployeeDAO dao = new EmployeeDAO();
		
		try
		{
			dao.connection();
			
			regionList = dao.regionList();
			departmentList = dao.departmentList();
			positionList = dao.positionList();
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}finally 
		{
			try
			{
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		request.setAttribute("regionList", regionList);
		request.setAttribute("departmentList", departmentList);
		request.setAttribute("positionList", positionList);
		
		result = "EmployeeInsertForm.jsp";
		return result;
	}
}
