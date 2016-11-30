package class3.com.test;

import java.sql.SQLException;
import java.util.ArrayList;

public interface Iweeding_main_DAO
{	
	// 각각 필요한 부분끼리 선언해서 사용
	
	/*public ArrayList<wedding_main_DTO> mainList
	  (String addr11, String addr12, String prodName
     , String sbjct, String img, String pth) throws SQLException;*/
	
	
	//---main 지도 클릭시 일반상품이미지, 이름, 가격
	public ArrayList<wedding_main_DTO> mainMap(String addr11, String addr12) throws SQLException;
	
	
	public ArrayList<wedding_main_DTO> mainAdvt() throws SQLException;
	
	public ArrayList<wedding_main_DTO> mainadvtajax(String addr11, String addr12) throws SQLException;
	
	public ArrayList<wedding_main_DTO> weddingSerchProduct(String regionMain, String regionSub) throws SQLException;
	public ArrayList<wedding_main_DTO> weddingSerchProduct(String regionMain) throws SQLException;
	
}
