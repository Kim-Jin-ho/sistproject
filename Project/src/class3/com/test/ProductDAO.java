package class3.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ProductDAO implements IProductDAO
{
	
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	
	
	//관리자 상품관리 리스트 출력
	@Override
	public ArrayList<Product> list() throws SQLException
	{
		ArrayList<Product> result = new ArrayList<Product>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CMPNY_ID, CTGY, PRODNAME, MAX, MIN FROM AD_PROD_VIEW";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Product product = null;
		
		while (rs.next())
		{
			product = new Product();
			
			product.setCmpny_id(rs.getString("CMPNY_ID"));
			product.setCtgy(rs.getString("CTGY"));
			product.setProdName(rs.getString("PRODNAME"));
			product.setMax(rs.getInt("MAX"));
			product.setMin(rs.getInt("MIN"));
			
			result.add(product);
			
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;

		
		
	}
	
	
	
	
	
	
}
