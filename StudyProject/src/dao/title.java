package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import dto.DBConn;
import dto.arr;

public class title
{
	public ArrayList<arr> list()
	{
		ArrayList<arr> arr = new ArrayList<arr>();
		String title = "";
		String day = "";
		String day2 = "";
		try
		{
			
			Connection conn = DBConn.getConnection();
			//out.print("DB Connect Success <br><br>");

			System.out.print("g2");
			
			String sql = "SELECT TITLE, TO_CHAR(DAY1,'YYYY-MM-DD') AS DAY1, TO_CHAR(DAY2,'YYYY-MM-DD') AS DAY2 FROM TBL_CALENDAR";
			System.out.println(sql);

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
	
			
			arr ar = null;
			System.out.println(rs);
			
			while (rs.next()) 
			{
				ar = new arr();
				System.out.print("h244");
				ar.setTitle(rs.getString("TITLE"));
				System.out.print(title);
				ar.setDay1(rs.getString("DAY1"));
				System.out.print(day);
				ar.setDay2(rs.getString("DAY2"));
				System.out.print(day2);
				
				arr.add(ar);
			}
		} catch (Exception e)
		{
			System.out.print(e);
		}
		return arr;
	}
}
