package class3.com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ProductNomalInsertDAO implements IProductNomalInsertDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	@Override
	public ArrayList<ProductNomalInsertDTO> normalInsert(String saNum) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<ProductNomalInsertDTO> normalUpdate(String saNum) throws SQLException
	{
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CCNAME, CMPNY_ID, PNAME, PTNAME, DPNAME, PRC, PTH FROM CMPNY_PRO_ALL_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			
			dto.setCcname(rs.getString("CCNAME"));
			dto.setCmpny_id(rs.getString("CMPNY_ID"));
			dto.setPname(rs.getString("PNAME"));
			dto.setPtname(rs.getString("PTNAME"));
			dto.setDpname(rs.getString("DPNAME"));
			dto.setPrc(rs.getString("PRC"));
			dto.setPth(rs.getString("PTH"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	public ProductNomalInsertDTO normalInfo(String saNum) throws SQLException
	{
		ProductNomalInsertDTO result = new ProductNomalInsertDTO();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CCNAME, CMPNY_ID, HMPG, ADDR, PNAME, IMG FROM CMPNY_PRO_INFO_VIEW WHERE CMPNY_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setCcname(rs.getString("CCNAME"));
			result.setCmpny_id(rs.getString("CMPNY_ID"));
			result.setHmpg(rs.getString("HMPG"));
			result.setAddr(rs.getString("ADDR"));
			result.setPname(rs.getString("PNAME"));
			result.setImg(rs.getString("IMG"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	public ArrayList<ProductNomalInsertDTO> normalBigCtr(String saNum) throws SQLException
	{
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT PTNAME FROM CMPNY_PRO_BIGCTR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			
			dto.setPtname(rs.getString("PTNAME"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	
	public ArrayList<ProductNomalInsertDTO> normalSmallCtr(String saNum) throws SQLException
	{
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DPNAME, PRC FROM CMPNY_PRO_SMALLCTR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			
			dto.setDpname(rs.getString("DPNAME"));
			dto.setPrc(rs.getString("PRC"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	public String[] bigItem(String saNum) throws SQLException
	{
		// 배열 선언하기 위한 변수 선언
		int i = 0;
		String str = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT PTNAME FROM CMPNY_PRO_BIGCTR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{	
			str = str + rs.getString("PTNAME");
			str = str + ",";
			i++;
		}
		String arr[] = new String[i];
		
		arr = str.split(",");

		rs.close();
		pstmt.close();
		conn.close();
		return arr;
	}
	
	public String[] smallItem(String saNum, String text) throws SQLException
	{
		// 배열 선언하기 위한 변수 선언
		int i = 0;
		String str = "";
		text = "%" + text + "%";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DPNAME, PRC FROM CMPNY_PRO_SMALLCTR_VIEW WHERE CMPNY_ID = ? AND DPNAME LIKE ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		pstmt.setString(2, text);
		
		ResultSet rs = pstmt.executeQuery();
		
		String[] arr;
		
		while(rs.next())
		{	
			str = str + rs.getString("DPNAME");
			str = str + ",";
			str = str + rs.getString("PRC");
			str = str + ",";
		}
		System.out.println(str);
		arr = str.split(",");	
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return arr;
	}
	
	
	
	
	public ArrayList<ProductNomalInsertDTO> normalBigItem (String saNum) throws SQLException
	{
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT PTNAME FROM CMPNY_PRO_BIGCTR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			
			dto.setPtname(rs.getString("PTNAME"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		System.out.println("이건가");
		return result;
	}
	public ArrayList<ProductNomalInsertDTO> normalSmallItem (String saNum, String text) throws SQLException
	{
		// 배열 선언하기 위한 변수 선언
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		text = "%" + text + "%";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DPNAME, PRC FROM CMPNY_PRO_SMALLCTR_VIEW WHERE CMPNY_ID = ? AND DPNAME LIKE ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		pstmt.setString(2, text);
		
		ResultSet rs = pstmt.executeQuery();
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			
			dto.setDpname(rs.getString("DPNAME"));
			dto.setPrc(rs.getString("PRC"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		System.out.println("요건가");
		return result;
	}
}
