/*======================================================
			Main.java
	- 임시 프로그램. DAO 에 대한 단위 테스트 수행
	  (콘솔 버전)
=======================================================*/

package class3.com.test;

public class Main
{
	public static void main(String[] args) 
	{
		EmployeeDAO dao = new EmployeeDAO();
		
		try
		{
			dao.connection();

			/*
			// 지역 정보 출력 메소드 확인
			for(EmployeeDTO dto : dao.regionList())
			{
				System.out.printf("%s %s %d %n", dto.getRegionId(), dto.getRegionName(), dto.getDelCheck());
			}
			*/
			
			/*			
			System.out.println("직위 정보=======================");
			// 직위 정보 출력 메소드 확인
			for (EmployeeDTO dto : dao.positionList())
			{
				System.out.printf("%s %s %d %n", dto.getPositionId(),dto.getPositionName(), dto.getDelCheck());
			}
			System.out.println();
			
			
			System.out.println("부서정보=======================");
			// 부서 정보 출력 메소드 확인
			for (EmployeeDTO dto : dao.departmentList())
			{
				System.out.printf("%s %s %d %n", dto.getDepartmentId(), dto.getDepartmentName(), dto.getDelCheck());
			}
			*/
			/*
			 	// set 시킨 값들 갯수 확인
				dto.setEmployeeId(rs.getString("EMPLOYEEID"));					1
				dto.setName(rs.getString("NAME"));								2	
				dto.setSsn(rs.getString("SSN"));								3
				dto.setBirthday(rs.getString("BIRTHDAY"));						4
				dto.setLunar(rs.getInt("LUNAR"));								5
				dto.setLunarName(rs.getString("LUNARNAME"));					6
				dto.setTelephone(rs.getString("TELEPHONE"));					7
				dto.setDepartmentId(rs.getString("DEPARTMENTID"));				8
				dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));			9
				dto.setPositionId(rs.getString("POSITIONID"));					10
				dto.setPositionName(rs.getString("POSITIONNAME"));				11
				dto.setRegionId(rs.getString("REGIONID"));						12
				dto.setRegionName(rs.getString("REGIONNAME"));					13
				dto.setBasicPay(rs.getInt("BASICPAY"));							14
				dto.setExtraPay(rs.getInt("EXTRAPAY"));							15
				dto.setPay(rs.getInt("PAY"));									16
			 */
			/*
			// 사원 정보 출력
			System.out.printf("================================사원 정보 출력================================%n");
			for (EmployeeDTO dto : dao.employeeList())
			{
				System.out.printf(" %s | %s| %s | %s | %d | %s | %s | %s | %s | %s |"
						+ " %s | %s | %s | %d | %d | %d"
						, dto.getEmployeeId(), dto.getName(), dto.getSsn()
						, dto.getBirthday(), dto.getLunar(), dto.getLunarName()
						, dto.getTelephone(), dto.getDepartmentId(), dto.getDepartmentName()
						, dto.getPositionId(), dto.getPositionName(), dto.getRegionId()
						, dto.getRegionName(), dto.getBasicPay(), dto.getExtraPay()
						, dto.getPay());
						
				//-->>  1 | 이준환| 8708251234567 | 1987-08-25 | 0 | 양력 
				//    | 010-1111-1111 | 1 | 개발부 | 1 | 사원 | 1 | 서울 | 1500000 | 100000 | 1600000
			}*/
			
			// 지역 정보 입력 메소드 확인
			@SuppressWarnings("unused")
			EmployeeDTO dto = new EmployeeDTO();
			/*			
			dto.setRegionName("제주");
			dao.regionInsert(dto);
			for (EmployeeDTO dto2 : dao.regionList())
			{
				System.out.printf("%s %s %d %n", dto2.getRegionId(), dto2.getRegionName(), dto2.getDelCheck());
			}
			*/
			
			// 직위 정보 입력 메소드 확인
			
			/*			
			dto.setPositionName("사장");
			dto.setMinBasicPay(6000000);
			dao.positionInsert(dto);
			
			for (EmployeeDTO dto2 : dao.positionList())
			{
				System.out.printf("%s %s %d %n", dto2.getPositionId(),dto2.getPositionName(), dto2.getDelCheck());
			}
			System.out.println();
			*/
			
			// 부서 정보 입력 메소드 확인
			/*
			dto.setDepartmentName("인사부");
			dao.departmentInsert(dto);
			
			for (EmployeeDTO dto2 : dao.departmentList())
			{
				System.out.printf("%s %s %d %n", dto2.getDepartmentId(), dto2.getDepartmentName(), dto2.getDelCheck());
			}
			*/
			/*
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getSsn());
			pstmt.setString(3, dto.getBirthday());
			pstmt.setInt(4, dto.getLunar());
			pstmt.setString(5, dto.getTelephone());
			pstmt.setString(6, dto.getDepartmentId());
			pstmt.setString(7, dto.getPositionId());
			pstmt.setString(8, dto.getRegionId());
			pstmt.setInt(9, dto.getBasicPay());
			pstmt.setInt(10, dto.getExtraPay());
			 */

			// 직원 정보 입력 메소드 확인
			/*
			dto.setName("김진호");
			dto.setSsn("8906271178719");
			dto.setBirthday("1989-06-27");
			dto.setLunar(0);
			dto.setTelephone("010-5823-4222");
			dto.setDepartmentId("2");
			dto.setPositionId("3");
			dto.setRegionId("2");
			dto.setBasicPay(3500000);
			dto.setExtraPay(100000);
			
			dao.employeeInsert(dto);
			
			for (EmployeeDTO dto2 : dao.employeeList())
			{
				System.out.printf(" %s | %s| %s | %s | %d | %s | %s | %s | %s | %s |"
						+ " %s | %s | %s | %d | %d | %d"
						, dto2.getEmployeeId(), dto2.getName(), dto2.getSsn()
						, dto2.getBirthday(), dto2.getLunar(), dto2.getLunarName()
						, dto2.getTelephone(), dto2.getDepartmentId(), dto2.getDepartmentName()
						, dto2.getPositionId(), dto2.getPositionName(), dto2.getRegionId()
						, dto2.getRegionName(), dto2.getBasicPay(), dto2.getExtraPay()
						, dto2.getPay());
						
				//-->> 2 | 김진호| 8906271178719 | 1989-06-27 | 0 | 양력 |
				//     010-5823-4222 | 2 | 마케팅부 | 3 | 과장 | 2 | 경기 | 3500000 | 100000 | 15100000
			}
			*/
			/*for (EmployeeDTO dto2 : dao.employeeList())
			{
				System.out.printf(" %s | %s| %s | %s | %d | %s | %s | %s | %s | %s |"
						+ " %s | %s | %s | %d | %d | %d \n"
						, dto2.getEmployeeId(), dto2.getName(), dto2.getSsn()
						, dto2.getBirthday(), dto2.getLunar(), dto2.getLunarName()
						, dto2.getTelephone(), dto2.getDepartmentId(), dto2.getDepartmentName()
						, dto2.getPositionId(), dto2.getPositionName(), dto2.getRegionId()
						, dto2.getRegionName(), dto2.getBasicPay(), dto2.getExtraPay()
						, dto2.getPay());
						
				//-->> 2 | 김진호| 8906271178719 | 1989-06-27 | 0 | 양력 |
				//     010-5823-4222 | 2 | 마케팅부 | 3 | 과장 | 2 | 경기 | 3500000 | 100000 | 15100000
			}*/
			
			//삭제 -------------------------------------------
			//dto.departmentDelete("4");		-- 부서
			//dao.positionDelete("5");			-- 직위
			//dao.regionDelete("4");			-- 지역
			//dao.empolyeeDelete("2");			-- 직원
			//-------------------------------------------삭제
			
			// 수정 -------------------------------------------------------------------------
			// 지역 수정
/*			dto.setRegionId("1");
			dto.setRegionName("서울");
			dao.regionUpdate(dto);
			
			for (EmployeeDTO dto2 : dao.regionList())
			{
				System.out.printf("%s %s %d %n", dto2.getRegionName(), dto2.getRegionId(), dto2.getDelCheck());
			}*/
			
			// 직위 수정
/*			dto.setPositionId("1");
			dto.setPositionName("사장");
			dto.setMinBasicPay(8000000);
			
			dao.positionUpdate(dto);
			
			for(EmployeeDTO dto2 : dao.positionList())
			{
				System.out.printf("%s %s %d %n", dto2.getPositionName(), dto2.getPositionName(), dto2.getDelCheck());
				             
			}
			*/
			
			
			// 부서 수정
			
/*			dto.setDepartmentId("1");
			dto.setDepartmentName("개발부");
			dao.departmentUpdate(dto);
			
			for(EmployeeDTO dto2 : dao.departmentList())
			{
				System.out.printf("%s %s %d %n", dto2.getDepartmentName(), dto2.getDepartmentId(), dto2.getDelCheck());
			}*/
			
			/*
			
			String sql = String.format("UPDATE TBL_EMPLOYEE SET NAME='%s', SSN='%s'"
				+ ", BIRTHDAY=TO_DATE('%s','YYYY-MM-DD'),LUNAR= %s"
				+ ", TELEPHONE ='%s', DEPARTMENTID=%s, POSITIONID=%s"
				+ ", REGIONID =%s, BASICPAY=%d, EXTRAPAY=%d WHERE EMPLOYEEID=%s"
			 */
			
			dto.setName("김진호");
			dto.setSsn("8906271178719");
			dto.setBirthday("1989-06-27");
			dto.setLunar(0);
			dto.setTelephone("010-5823-4222");
			dto.setDepartmentId("1");
			dto.setPositionId("1");
			dto.setRegionId("1");
			dto.setBasicPay(1500000);
			dto.setExtraPay(100000);
			dto.setEmployeeId("1");
			
			dao.employeeUpdate(dto);
			
			for (EmployeeDTO dto2 : dao.employeeList())
			{
				System.out.printf(" %s | %s| %s | %s | %d | %s | %s | %s | %s | %s |"
						+ " %s | %s | %s | %d | %d | %d"
						, dto2.getEmployeeId(), dto2.getName(), dto2.getSsn()
						, dto2.getBirthday(), dto2.getLunar(), dto2.getLunarName()
						, dto2.getTelephone(), dto2.getDepartmentId(), dto2.getDepartmentName()
						, dto2.getPositionId(), dto2.getPositionName(), dto2.getRegionId()
						, dto2.getRegionName(), dto2.getBasicPay(), dto2.getExtraPay()
						, dto2.getPay());
						
				//-->> 2 | 김진호| 8906271178719 | 1989-06-27 | 0 | 양력 |
				//     010-5823-4222 | 2 | 마케팅부 | 3 | 과장 | 2 | 경기 | 3500000 | 100000 | 15100000
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}finally
		{
			try
			{
				// DB 연결 종료
				dao.close();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
	}
}
