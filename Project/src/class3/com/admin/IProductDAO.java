package class3.com.admin;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductDAO
{
	// 관리자 상품목록
	public ArrayList<Product> list() throws SQLException;
	// 관리자 상품 삭제
	public int delete(String cmpny_id) throws SQLException;
	
}
