package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.Shop;

public interface IShopDAO 
{
	public ArrayList<Shop> list() throws SQLException;
}
