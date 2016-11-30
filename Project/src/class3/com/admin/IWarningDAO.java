package class3.com.admin;

import java.sql.SQLException;

public interface IWarningDAO
{
	public int add1(Warning warning) throws SQLException;
	public int add2(Warning warning) throws SQLException;
	public int add3(Warning warning) throws SQLException;
	
	public int remove1(String cmpny_id) throws SQLException;
	public int remove2(String cmpny_id) throws SQLException;
	public int remove3(String cmpny_id) throws SQLException;
	
	
	public int add4(Warning warning) throws SQLException;
	public int add5(Warning warning) throws SQLException;
	public int add6(Warning warning) throws SQLException;
	
	public int remove4(String cmpny_id) throws SQLException;
	public int remove5(String cmpny_id) throws SQLException;
	public int remove6(String cmpny_id) throws SQLException;
}
