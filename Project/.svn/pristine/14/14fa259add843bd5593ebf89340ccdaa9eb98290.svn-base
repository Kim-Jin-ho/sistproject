package class3.com.company;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ICompanyMainDAO
{
	/********************************* Main View *************************************/
	// 경고누적
	public int warCount(String saNum) throws SQLException;
	// 공지
	public ArrayList<CompanyMainDTO> noticeList() throws SQLException;
	// 금일 주요 일정 (예약, 상담, 상품평)
	public int rsvtnCount(String saNum) throws SQLException;
	public int advCount(String saNum) throws SQLException;
	public int reviewCount(String saNum) throws SQLException;
	// 일반 상품
	public String normalImg(String saNum) throws SQLException;
	public int normalHitCount(String saNum) throws SQLException;
	public int normalRsvtnCount(String saNum) throws SQLException;
	public int normalAdvCount(String saNum) throws SQLException;
	public int normalReviewCount(String saNum) throws SQLException;
	public int normalScore(String saNum) throws SQLException;
	// 할인 상품
	public String discountImg(String saNum) throws SQLException;
	public int discountHitCount(String saNum) throws SQLException;
	public int discountRsvtnCount(String saNum) throws SQLException;
	public int discountAdvCount(String saNum) throws SQLException;
	public int discountReviewCount(String saNum) throws SQLException;
	public int discountScore(String saNum) throws SQLException;
	// 광고 상품
	public String advtImg(String saNum) throws SQLException;
	/********************************* Main View *************************************/
}
