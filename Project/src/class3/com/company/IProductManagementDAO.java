package class3.com.company;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductManagementDAO
{
	public ArrayList<ProductManagementDTO> normalList(String saNum) throws SQLException;
	public ArrayList<ProductManagementDTO> discountList(String saNum) throws SQLException;
	public ArrayList<ProductManagementDTO> advtList(String saNum) throws SQLException;
}
