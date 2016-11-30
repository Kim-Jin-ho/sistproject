package class3.com.company;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IReservationsManagementDAO
{
	// 예약 신청자 확인
	public ArrayList<MembershipReservationsDTO> resList(String saNum) throws SQLException;
		
	// 세부 견적사항 확인
	public MembershipReservationsDTO estimate(String name, String tel) throws SQLException;
	
	// 결과 수정
	public int updateSelect(String cd, String text) throws SQLException;
}
