package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.Shop;

public class ShopDAO implements IShopDAO
{

	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) 
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<Shop> list() throws SQLException 
	{
		ArrayList<Shop> result = new ArrayList<Shop>();
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT SHOPID, SHOPNAME, DONGKYUNG, BUKWI FROM SHOP ORDER BY 2";
		System.out.println(sql);
		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			Shop dto = new Shop();
			dto.setShopId(rs.getInt("SHOPID"));
			dto.setShopName(rs.getString("SHOPNAME"));
			dto.setDongkyung(rs.getDouble("DONGKYUNG"));
			dto.setBukwi(rs.getDouble("BUKWI"));
			
			
			System.out.println(rs.getDouble("DONGKYUNG"));
			result.add(dto);

		}
		rs.close();
		pstmt.close();
		conn.close();

		return result;
	
	}
	
	
	
	
}
