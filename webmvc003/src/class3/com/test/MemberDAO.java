package class3.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import class3.com.util.DBConn;

public class MemberDAO
{
	private Connection conn;

	public Connection getConnection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();

		return conn;
	}

	public int insertQuery(MemberVO vo) throws SQLException
	{
		int result = 0;

		String sql = String.format // 1 2 4 5 6
		("INSERT INTO TBL_MEMBERLIST(ID, PW, NAME, TEL, EMAIL)" + " VALUES(?, CRYPTPACK.ENCRYPT(?, ?)" // 3
																										// -->
																										// 암호화
																										// 키
				+ ", ?, ?, ?)", vo.getId(), vo.getPw(), vo.getId(), vo.getName(), vo.getTel(), vo.getEmail());

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPw());
		pstmt.setString(3, vo.getId()); // 3 --> 암호화 키
		pstmt.setString(4, vo.getName());
		pstmt.setString(5, vo.getTel());
		pstmt.setString(6, vo.getEmail());

		result = pstmt.executeUpdate();

		pstmt.close();

		return result;

	} // end addStu()

	public ArrayList<MemberVO> list() throws SQLException
	{
		ArrayList<MemberVO> result = new ArrayList<MemberVO>();

		String sql = "SELECT ID, PW, NAME, TEL, EMAIL FROM TBL_MEMBERLIST ORDER BY ID";
		System.out.println(sql);

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		MemberVO dto = null;

		while (rs.next())
		{
			dto = new MemberVO();

			dto.setId(rs.getString("ID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			dto.setEmail(rs.getString("EMAIL"));

			result.add(dto);

		}
		rs.close();
		stmt.close();

		return result;

	} // end list()

	
	
	
	public ArrayList<ScoreDTO> jumsuList() throws SQLException
	{

		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();

		String sql = "SELECT NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ((KOR+ENG+MAT)/3) AS AVG FROM TBL_MEMBERJUMSU J, TBL_MEMBERLIST L WHERE J.ID(+) = L.ID";

		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();

			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));

			result.add(dto);

		}

		return result;
	}

	public void close() throws SQLException
	{
		DBConn.close();
	}

}
