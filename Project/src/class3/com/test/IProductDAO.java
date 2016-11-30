package class3.com.test;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductDAO
{
	public ArrayList<Product> list() throws SQLException;
}
