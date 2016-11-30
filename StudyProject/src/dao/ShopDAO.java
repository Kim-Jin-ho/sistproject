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
		
		String sql = "SELECT SHOPID, SHOPNAME, SHOPPHONE, OFFICEOUR, DONGKYUNG, BUKWI, HOLIDAY, ROOMCOUNT, YESNOID, YESNOID2 FROM SHOP ORDER BY 2";
		System.out.println(sql);
		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			Shop dto = new Shop();
			
			dto.setShopId(rs.getInt("SHOPID"));
			dto.setShopName(rs.getString("SHOPNAME"));
			dto.setTel(rs.getString("SHOPPHONE"));
			dto.setHour(rs.getString("OFFICEOUR"));
			dto.setDongkyung(rs.getString("DONGKYUNG"));
			dto.setBukwi(rs.getString("BUKWI"));
			dto.setHoliday(rs.getString("HOLIDAY"));
			dto.setRoomCount(rs.getInt("ROOMCOUNT"));;
			dto.setYesno1(rs.getString("YESNOID"));
			dto.setYesno2(rs.getString("YESNOID2"));
			
			
			//System.out.println(rs.getDouble("DONGKYUNG"));
			result.add(dto);

		}
		rs.close();
		pstmt.close();
		conn.close();

		return result;
	
	}

	
	
	
	@Override
	public int shopAdd(Shop shop) throws SQLException
	{

		int result = 0;
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO SHOP(SHOPID, SHOPNAME, SHOPPHONE, OFFICEOUR, DONGKYUNG, BUKWI, HOLIDAY, ROOMCOUNT, YESNOID, YESNOID2) "
				+ "VALUES ((SELECT MAX(SHOPID)+1 AS SHOPID FROM SHOP), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, shop.getShopName());
		pstmt.setString(2, shop.getTel());
		pstmt.setString(3, shop.getHour());
		pstmt.setString(4, shop.getDongkyung());
		pstmt.setString(5, shop.getBukwi());
		pstmt.setString(6, shop.getHoliday());
		pstmt.setInt(7, shop.getRoomCount());
		pstmt.setString(8, shop.getYesno1());
		pstmt.setString(9, shop.getYesno2());

		result = pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		return result;
		

	}
	
	
	
	
	
}
