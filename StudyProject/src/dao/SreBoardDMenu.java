package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.SreBoard;

public interface SreBoardDMenu
{
	public ArrayList<SreBoard> list(int start, int end, int dataCount) throws SQLException;
	public ArrayList<SreBoard> lists(int start, int end, int dataCount, String searchKey, String searchValue) throws SQLException;
	public int getDataCount(String searchKey, String searchValue) throws SQLException;

	public ArrayList<SreBoard> lists2(int start, int end, int dataCount, String searchKey, String searchValue) throws SQLException;
	public ArrayList<SreBoard> view(int srId) throws SQLException;
	public int hitUp(int srId) throws SQLException;

	public int sreCreate(SreBoard sreboard) throws SQLException;
	public ArrayList<SreBoard> sreList(String srId) throws SQLException;
	public int sreUpdate(SreBoard sreboard) throws SQLException;
	public int sreDelete(String srId) throws SQLException;
	
	public int memberId(String nickname) throws SQLException;
	public double bukWi(String shopId) throws SQLException;
	public double dongKyung(String shopId) throws SQLException;
	
}
