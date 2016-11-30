package dao;

import java.sql.SQLException;

public interface IMainSaveDAO
{
	public String getSave(String nickname) throws SQLException;			// 마일리지 조회 메소드
	public String getMid(String nickname) throws SQLException;			// 회원번호 조회 메소드
}
