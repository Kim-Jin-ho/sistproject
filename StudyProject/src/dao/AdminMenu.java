package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.admin;

public interface AdminMenu 
{
	public int searchId(int adminId) throws SQLException;
	public ArrayList<admin> list(String region) throws SQLException;
}
