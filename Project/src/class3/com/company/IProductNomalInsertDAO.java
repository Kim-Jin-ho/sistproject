package class3.com.company;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductNomalInsertDAO
{
	public ArrayList<ProductNomalInsertDTO> normalInsert(String saNum) throws SQLException;
	public ArrayList<ProductNomalInsertDTO> normalUpdate(String saNum) throws SQLException;
	public ArrayList<ProductNomalInsertDTO> normalBigCtr(String saNum) throws SQLException;
	public ArrayList<ProductNomalInsertDTO> normalSmallCtr(String saNum) throws SQLException;
	public ProductNomalInsertDTO normalInfo(String saNum) throws SQLException;
	
	public ArrayList<ProductNomalInsertDTO> normalBigItem (String saNum) throws SQLException;
	public ArrayList<ProductNomalInsertDTO> normalSmallItem (String saNum, String text) throws SQLException;
	
	
	public String[] bigItem(String saNum) throws SQLException;
	public String[] smallItem(String saNum, String text) throws SQLException;
}
