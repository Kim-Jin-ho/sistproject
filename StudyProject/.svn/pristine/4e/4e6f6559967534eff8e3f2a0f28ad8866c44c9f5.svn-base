package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import dto.admin;

public class AdminMenuDAO implements AdminMenu
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public int searchId(int adminId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NAME FROM B2C_SM";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		return result;
	}

	@Override
	public ArrayList<admin> list(String region) throws SQLException
	{
		ArrayList<admin> result = new ArrayList<admin>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT SM_DIV_N, SM_DIV_NA FROM B2C_SM WHERE BI_DIV_N = ?";
		System.out.println(sql);
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, region);
		
		ResultSet rs = pstmt.executeQuery();
		
		admin admin = null;
		
		while (rs.next())
		{
			admin = new admin();
			
			admin.setMenuId(rs.getInt("SM_DIV_N"));
			admin.setName(rs.getString("SM_DIV_NA"));
			System.out.println("안녕"+rs.getString("SM_DIV_NA"));
			
			result.add(admin);
			
		}
		
		return result;
	}
}
