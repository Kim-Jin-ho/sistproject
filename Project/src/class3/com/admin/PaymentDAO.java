package class3.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class PaymentDAO implements IPaymentDAO
{
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	//관리자 정산관리 리스트 출력
	@Override
	public ArrayList<Payment> list() throws SQLException
	{
		
		ArrayList<Payment> result = new ArrayList<Payment>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CMPNY_ID, DT, CASH, NAME FROM AD_CPAYMENT_VIEW";
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		Payment payment = null;
		
		
		while (rs.next())
		{
			payment = new Payment();
			
			payment.setCmpny_id(rs.getString("CMPNY_ID"));
			payment.setDate(rs.getString("DT"));
			payment.setCash(rs.getInt("CASH"));
			payment.setPayType(rs.getString("NAME"));
			
			result.add(payment);
			
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	
	
	
	}
	
	
	
	
	
	
}
