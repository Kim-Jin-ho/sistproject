package class3.com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ProductManagementDAO implements IProductManagementDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	@Override
	public ArrayList<ProductManagementDTO> normalList(String saNum) throws SQLException
	{
		ArrayList<ProductManagementDTO> result = new ArrayList<ProductManagementDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CMPNY_ID, IMG, NAME, STT FROM CMPNY_NORMAL_PRO_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		ProductManagementDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductManagementDTO();
			
			dto.setCmpny_id(rs.getString("CMPNY_ID"));
			dto.setImg(rs.getString("IMG"));
			dto.setName(rs.getString("NAME"));
			dto.setStt(rs.getString("STT"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public ArrayList<ProductManagementDTO> discountList(String saNum) throws SQLException
	{
		ArrayList<ProductManagementDTO> result = new ArrayList<ProductManagementDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CMPNY_ID, IMG, NAME, STT FROM CMPNY_DISCOUNT_PRO_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		ProductManagementDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductManagementDTO();
			
			dto.setCmpny_id(rs.getString("CMPNY_ID"));
			dto.setImg(rs.getString("IMG"));
			dto.setName(rs.getString("NAME"));
			dto.setStt(rs.getString("STT"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public ArrayList<ProductManagementDTO> advtList(String saNum) throws SQLException
	{
		ArrayList<ProductManagementDTO> result = new ArrayList<ProductManagementDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CMPNY_ID, IMG, SBJCT, END, STT FROM CMPNY_ADVT_PRO_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		ProductManagementDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductManagementDTO();
			
			dto.setCmpny_id(rs.getString("CMPNY_ID"));
			dto.setImg(rs.getString("IMG"));
			dto.setSbjct(rs.getString("SBJCT"));
			dto.setEnd(rs.getString("END"));
			dto.setStt(rs.getString("STT"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

}
