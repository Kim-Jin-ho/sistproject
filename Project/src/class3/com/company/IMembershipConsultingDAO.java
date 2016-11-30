package class3.com.company;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMembershipConsultingDAO
{
	public ArrayList<MembershipConsultingDTO> list(String saNum) throws SQLException;
	
	public int updateSelect(String cd, String text) throws SQLException;
}
