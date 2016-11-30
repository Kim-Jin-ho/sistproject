package class3.com.company;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IProductInsertDAO
{
	public int Insert(String saNum) throws SQLException;
	public int Update(String saNum) throws SQLException;
	public ArrayList<ProductNomalInsertDTO> normalBigCtr(String saNum) throws SQLException;
	public ArrayList<ProductNomalInsertDTO> normalSmallCtr(String saNum) throws SQLException;
	public ProductNomalInsertDTO normalInfo(String saNum) throws SQLException;
	
	public ArrayList<ProductNomalInsertDTO> normalBigItem (String saNum) throws SQLException;
	public ArrayList<ProductNomalInsertDTO> normalSmallItem (String saNum, String text) throws SQLException;
	
	
	public String[] bigItem(String saNum) throws SQLException;
	public String[] smallItem(String saNum, String text) throws SQLException;
	
	// 게시글 내리는 메소드
	public int productDown(String saNum) throws SQLException;
	
	// 상품 등록 메소드
	public int prod_check(String saNum) throws SQLException;
	public String prod_tbl_Insert(String saNum, String subject, String img) throws SQLException;
	public String[] prod_tp_tbl_Insert(String cd, String[] bigCtr) throws SQLException;
	public String[] dtl_prod_Insert(String cd, String[] smallCtr, String[] prc, String pth[]) throws SQLException;
	public int img_tbl_Insert(String cd, String[] img) throws SQLException;
	
	// 상품 수정 메소드
	public String[] prod_tbl_Update(String subject, String img, String saNum) throws SQLException;
	public String prod_tp_tbl_Update(String cd[], String[] bigCtr, String saNum) throws SQLException;
	public String[] dtl_prod_Update(String cd[], String[] smallCtr, String[] prc, String[] pth) throws SQLException;
	public int img_tbl_Update(String cd, String[] img) throws SQLException;
	
	
	
	
}
