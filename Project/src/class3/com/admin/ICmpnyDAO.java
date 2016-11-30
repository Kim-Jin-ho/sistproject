package class3.com.admin;

import java.sql.SQLException;
import java.util.ArrayList;



public interface ICmpnyDAO
{
	//DAO媛� 媛뽮퀬 �엳�쓬吏곹븳 硫붿냼�뱶瑜� �꽑�뼵�븳�떎!!
	public int cmpnyadd(Cmpny Cmpny) throws SQLException; //湲곗뾽�쉶�썝 �쉶�썝媛��엯 硫붿냼�뱶
	public int cmpnyidcheck(String id)throws SQLException; //湲곗뾽�쉶�썝 ID以묐났泥댄겕 硫붿냼�뱶
	public String cmpnylogin(String id,String pw)throws SQLException;//湲곗뾽�쉶�썝 濡쒓렇�씤 
	public String cmpnypwsearch(String id,String tel)throws SQLException;//湲곗뾽�쉶�썝 鍮꾨�踰덊샇李얘린硫붿냼�뱶
	//湲곗뾽 濡쒓렇�븘�썐(�꽭�뀡�쑝濡쒖쿂由щ맖)
	public ArrayList<Cmpny> cmpnylist(String id,String pw)throws SQLException;//湲곗뾽 �옄�떊�쓽 由ъ뒪�듃瑜� 異쒕젰�븯�뒗 硫붿냼�뱶
	public int cmpnyupdate(Cmpny cmpny)throws SQLException;//湲곗뾽 �옄�떊�쓽 �젙蹂대�� �닔�젙�븯�뒗 硫붿냼�뱶
	public int cmpnydelete(String id,String pw)throws SQLException;//湲곗뾽 �깉�눜硫붿냼�뱶
	
	
	//관리자 Cmpnylist 출력
	public ArrayList<Cmpny> list() throws SQLException;
	//관리자 CmpnyWarningList 출력
	public ArrayList<Cmpny> warningList(String Cmpny_Id) throws SQLException;

	
	
	public int maxNum(String searchKey, String searchValue) throws SQLException;

}
