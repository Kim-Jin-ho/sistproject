package class3.com.admin;

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
		
		String sql = "SELECT CMPNY_ID, CTGY, PRODNAME, MAX, MIN, POST_CD FROM AD_PROD_VIEW";
		
		
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
			product.setPost_cd(rs.getInt("POST_CD"));
			
			result.add(product);
			
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;

		
		
	}




	// 상품삭제
	@Override
	public int delete(String cmpny_id) throws SQLException 
	{
	
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE PROD_TBL SET POST_CD = '3' WHERE CMPNY_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cmpny_id);
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
		
		
	}
	
	
	
	
	
	
	
}
