package class3.com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class ProductInsertDAO implements IProductInsertDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	@Override
	public int Insert(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CCNAME, CMPNY_ID, HMPG, ADDR, PNAME, IMG FROM CMPNY_PRO_INFO_VIEW WHERE CMPNY_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int Update(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CCNAME, CMPNY_ID, HMPG, ADDR, PNAME, IMG FROM CMPNY_PRO_INFO_VIEW WHERE CMPNY_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	@Override
	public ProductNomalInsertDTO normalInfo(String saNum) throws SQLException
	{
		ProductNomalInsertDTO result = new ProductNomalInsertDTO();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT CCNAME, CMPNY_ID, HMPG, ADDR, PNAME, IMG FROM CMPNY_PRO_INFO_VIEW WHERE CMPNY_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setCcname(rs.getString("CCNAME"));
			result.setCmpny_id(rs.getString("CMPNY_ID"));
			result.setHmpg(rs.getString("HMPG"));
			result.setAddr(rs.getString("ADDR"));
			result.setPname(rs.getString("PNAME"));
			result.setImg(rs.getString("IMG"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public ArrayList<ProductNomalInsertDTO> normalBigCtr(String saNum) throws SQLException
	{
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT PTNAME FROM CMPNY_PRO_BIGCTR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			
			dto.setPtname(rs.getString("PTNAME"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public ArrayList<ProductNomalInsertDTO> normalSmallCtr(String saNum) throws SQLException
	{
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DPNAME, PRC FROM CMPNY_PRO_SMALLCTR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			
			dto.setDpname(rs.getString("DPNAME"));
			dto.setPrc(rs.getString("PRC"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	@Override
	public String[] bigItem(String saNum) throws SQLException
	{
		// 배열 선언하기 위한 변수 선언
		int i = 0;
		String str = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT PTNAME FROM CMPNY_PRO_BIGCTR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{	
			str = str + rs.getString("PTNAME");
			str = str + ",";
			i++;
		}
		String arr[] = new String[i];
		
		arr = str.split(",");

		rs.close();
		pstmt.close();
		conn.close();
		return arr;
	}
	@Override
	public String[] smallItem(String saNum, String text) throws SQLException
	{
		String str = "";
		text = "%" + text + "%";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DPNAME, PRC FROM CMPNY_PRO_SMALLCTR_VIEW WHERE CMPNY_ID = ? AND DPNAME LIKE ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		pstmt.setString(2, text);
		
		ResultSet rs = pstmt.executeQuery();
		
		String[] arr;
		
		while(rs.next())
		{	
			str = str + rs.getString("DPNAME");
			str = str + ",";
			str = str + rs.getString("PRC");
			str = str + ",";
		}
		System.out.println(str);
		arr = str.split(",");	
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return arr;
	}
	
	
	
	@Override
	public ArrayList<ProductNomalInsertDTO> normalBigItem (String saNum) throws SQLException
	{
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT PTNAME FROM CMPNY_PRO_BIGCTR_VIEW WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			
			dto.setPtname(rs.getString("PTNAME"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return result;
	}
	@Override
	public ArrayList<ProductNomalInsertDTO> normalSmallItem (String saNum, String text) throws SQLException
	{
		// 배열 선언하기 위한 변수 선언
		ArrayList<ProductNomalInsertDTO> result = new ArrayList<ProductNomalInsertDTO>();
		text = "%" + text + "%";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DPNAME, PRC FROM CMPNY_PRO_SMALLCTR_VIEW WHERE CMPNY_ID = ? AND PTNAME LIKE ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		pstmt.setString(2, text);
		
		ResultSet rs = pstmt.executeQuery();
		ProductNomalInsertDTO dto = null;
		
		while(rs.next())
		{
			dto = new ProductNomalInsertDTO();
			dto.setDpname(rs.getString("DPNAME"));
			dto.setPrc(rs.getString("PRC"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return result;
	}
	
	@Override
	public int productDown(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE PROD_TBL SET POST_CD = 3 WHERE CMPNY_ID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	/////////////////////////////상품입력 쿼리문///////////////////////////
	// 등록된 상품이 있는지 체크하는 쿼리문
	@Override
	public int prod_check(String saNum) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM PROD_TBL WHERE CMPNY_ID = ? AND STRT IS NULL";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	
	// 등록된 상품이 없다면 인설트를 해야겠죠
	// 상품등록 테이블
	@Override
	public String prod_tbl_Insert(String saNum, String subject, String img) throws SQLException
	{
		// 상품등록 테이블 (PROD_TBL)에 데이터를 입력함.
		int result = 0;
		String str = "";
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO PROD_TBL(PROD_CD, CMPNY_ID, POST_CD, NAME, IMG) VALUES (PROD_TBL_SEQ.NEXTVAL, ?, '2', ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, saNum);
		pstmt.setString(2, subject);
		pstmt.setString(3, img);
		
		result = pstmt.executeUpdate();

		// 만약 데이터가 정상적으로 입력이 되었다면 
		// PROD_TBL 에서 PROD_CD 값을 찾아내라.
		if (result >= 1)
		{
			sql = "SELECT PROD_CD FROM PROD_TBL WHERE CMPNY_ID = ? AND STRT IS NULL";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{	
				str = rs.getString("PROD_CD");
			}
		}
		else 
		{
			System.out.println("PROD_TBL Error!! 정상적으로 입력되지 않았습니다.");
		}
		
		pstmt.close();
		conn.close();
		
		// PROD_TBL의 PK를 반환하라. (1개 고정)
		return str;
	}

	
	// 상품 종류 테이블
	// PROD_TP_TBL 음냐음냐                  // 이거는 폼에 입력된 카테고리를 받아라.
	@Override
	public String[] prod_tp_tbl_Insert(String cd, String[] bigCtr) throws SQLException
	{
		int result = 0;
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = null;
		// 입력된 큰 카테고리 수 만큼 반복문을 돌려서 입력해라.
		for (int i = 0; i < bigCtr.length; i++)
		{
			String sql = "INSERT INTO PROD_TP_TBL (PROD_TP_CD, PROD_CD, NAME) VALUES (PROD_TP_TBL_SEQ.NEXTVAL, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cd);
			pstmt.setString(2, bigCtr[i]);
			
			result = result + pstmt.executeUpdate();
		}
		
		System.out.println(result + "개의 행이 입력되었습니다.");
		
		// 반환 자료형 선언 크기는 나중에 지정함.
		String[] str = null;
		
		if (result >= 1)
		{
			// 배열 크기를 지정하기 위해서 레코드의 카운트를 알아낸다.
			String sql = "SELECT COUNT(PROD_TP_CD) AS COUNT FROM PROD_TP_TBL WHERE PROD_CD = ? ORDER BY 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cd);
			
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next())
			{	
				count = rs.getInt("COUNT");
			}
			
			// 알아낸 레코드의 크기만큼 배열방을 생성한다.
			str = new String[count];
			

			// 매개변수 PROD_CD를 이용하여 PROD_TP_CD 를 알아낸다.
			sql = "SELECT PROD_TP_CD FROM PROD_TP_TBL WHERE PROD_CD = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cd);
			
			rs = pstmt.executeQuery();
			int i = 0;
			while(rs.next())
			{	
				str[i] = rs.getString("PROD_TP_CD");
				i++;
			}

			for (String string : str)
			{
				System.out.println("str = " + string);
			}
		}
		else 
		{
			System.out.println("PROD_TP_TBL Error!! 정상적으로 입력되지 않았습니다.");
		}
		
		pstmt.close();
		conn.close();
		
		// PROD_TP_CD를 배열에 담아서 반환
		return str;
	}

	// 상세 상품 테이블
	// DTL_PROD_TBL (상세 상품 테이블)
	@Override
	public String[] dtl_prod_Insert(String cd, String[] smallCtr, String[] prc, String[] pth) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = null;
		// 입력된 작은 카테고리 수 만큼 반복문을 돌려서 입력해라.
		for (int i = 0; i < smallCtr.length; i++)
		{
			String sql = "INSERT INTO DTL_PROD_TBL (DTL_PROD_CD, PROD_TP_CD, NAME, PRC, PTH) VALUES (DTL_PROD_TBL_SEQ.NEXTVAL, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cd);
			pstmt.setString(2, smallCtr[i]);
			pstmt.setString(3, prc[i]);
			pstmt.setString(4, pth[i]);
			
			result = result + pstmt.executeUpdate();
		}
		
		System.out.println(result + "개의 행이 입력되었습니다.");
		
		// 반환 자료형 선언 크기는 나중에 지정함.
		String[] str = null;
		
		if (result >= 1)
		{
			// 배열 크기를 지정하기 위해서 레코드의 카운트를 알아낸다.
			String sql = "SELECT COUNT(DTL_PROD_CD) AS COUNT FROM DTL_PROD_TBL WHERE DTL_PROD_CD = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cd);
			
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next())
			{	
				count = rs.getInt("COUNT");
			}
			
			
			// 알아낸 레코드의 크기만큼 배열방을 생성한다.
			str = new String[count];
			
			for (int i = 0; i < str.length; i++)
			{
				// 매개변수 PROD_CD를 이용하여 PROD_TP_CD 를 알아낸다.
				sql = "SELECT PROD_TP_CD FROM PROD_TP_TBL WHERE PROD_CD = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cd);
				
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{	
					str[i] = rs.getString("PROD_TP_CD");
				}
			}
		}
		else 
		{
			System.out.println("PROD_TP_TBL Error!! 정상적으로 입력되지 않았습니다.");
		}
		
		
		pstmt.close();
		conn.close();
		
		return str;
	}
	
	// 이미지 테이블
	@Override
	public int img_tbl_Insert(String cd, String[] img) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		for (int i = 0; i < img.length; i++)
		{
			String sql = "INSERT INTO 'TRY'.'IMG_TBL' (IMG_CD, DTL_PROD_CD, PTH) VALUES (IMG_TBL_SEQ.NEXTVAL, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cd);
			pstmt.setString(2, img[i]);
			result = result + pstmt.executeUpdate();
		}
		
		System.out.println(result + "개의 행이 입력되었습니다.");
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 등록된 상품이 있다면 업데이트를 해야겠죠
	// 상품등록 테이블
	@Override
	public String[] prod_tbl_Update(String subject, String img, String saNum) throws SQLException
	{
		System.out.println("prod_tbl_Update 시작");
		// 상품등록 테이블 (PROD_TBL)에 데이터를 입력함.
		int result = 0;
		String str = "";
		String arr[] = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE PROD_TBL SET NAME = ?, IMG = ? WHERE CMPNY_ID = ? AND STRT IS NULL";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, subject);
		pstmt.setString(2, img);
		pstmt.setString(3, saNum);
		
		result = pstmt.executeUpdate();
		System.out.println("prod_tbl_Update 업데이트 성공 : " + result);
		// 만약 데이터가 정상적으로 입력이 되었다면 
		// PROD_TBL 에서 PROD_CD 값을 찾아내라.
		if (result >= 1)
		{
			
			sql = "SELECT PROD_CD FROM PROD_TBL WHERE CMPNY_ID = ? AND STRT IS NULL";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{	
				str = rs.getString("PROD_CD");
			}
			
			sql = "SELECT PROD_TP_CD FROM PROD_TP_TBL WHERE PROD_CD = ? ORDER BY 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, str);
			
			rs = pstmt.executeQuery();
			str = "";
			while(rs.next())
			{	
				str = str + rs.getString("PROD_TP_CD") + ",";	
			}
			
			arr = str.split(",");

		}
		else 
		{
			System.out.println("PROD_TBL Error!! 정상적으로 입력되지 않았습니다.");
		}
		
		pstmt.close();
		conn.close();
		
		
		// PROD_TP_TBL의 프라이머리키를 반환하라.
		return arr;
	}

	
	// 상품 종류 테이블
	// PROD_TP_TBL 음냐음냐                       // 이거는 폼에 입력된 카테고리를 받아라.
	@Override
	public String prod_tp_tbl_Update(String[] cd, String[] bigCtr, String saNum) throws SQLException
	{
		System.out.println("prod_tp_tbl_Update 메소드 시작");
		int result = 0;

		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = null;
		// 입력된 큰 카테고리 수 만큼 반복문을 돌려서 입력해라.
		for (int i = 0; i < bigCtr.length; i++)
		{
			String sql = "UPDATE PROD_TP_TBL SET NAME = ? WHERE PROD_TP_CD = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bigCtr[i]);
			pstmt.setString(2, cd[i]);
			
			
			result = pstmt.executeUpdate();
		}
		
		System.out.println(result + "개의 행이 입력되었습니다.");
		
		// 반환 자료형 선언 크기는 나중에 지정함.
		String str = "";
		String[] arr = null;
		if (result >= 1)
		{
			
			// 입력된 데이터의 PROD_TP_CD를 알아낸다.
			String sql = "SELECT PROD_TP_CD " +
						"FROM CMPNY_TBL C, PROD_TBL P, PROD_TP_TBL PT " +
						"WHERE C.CMPNY_ID =	P.CMPNY_ID " +
						"AND P.PROD_CD = PT.PROD_CD " +	
						"AND C.CMPNY_ID = ? " +
						"ORDER BY 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, saNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{	
				str = str + rs.getString("PROD_TP_CD") + ",";
			}
			
			arr = str.split(",");			
			
			/////////////////////////////////////////////////////////////////
			str = "";
			
			for (int i = 0; i < arr.length; i++)
			{
				// 입력된 데이터의 PTL_PROD_CD를 알아낸다.
				sql = "SELECT DTL_PROD_CD " + 
						"FROM DTL_PROD_TBL " +
						"WHERE PROD_TP_CD = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, arr[i]);
				
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{	
					str = str + rs.getString("DTL_PROD_CD") + ",";
				}
				str = str + "/";
			}
			System.out.println(str);
			
			/////////////////////////////////////////////////////////////////
		}
		else 
		{
			System.out.println("PROD_TP_TBL Error!! 정상적으로 입력되지 않았습니다.");
		}
		
		pstmt.close();
		conn.close();
		
		// PROD_TP_CD를 배열에 담아서 반환
		return str;
	}

	// 상세 상품 테이블
	// DTL_PROD_TBL (상세 상품 테이블)
	@Override
	public String[] dtl_prod_Update(String[] cd, String[] smallCtr, String[] prc, String[] pth) throws SQLException
	{
		System.out.println("dtl_prod_Update 진입 성공");
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = null;
		// 입력된 작은 카테고리 수 만큼 반복문을 돌려서 입력해라.
		for (int i = 0; i < smallCtr.length; i++)
		{
			String sql = "UPDATE DTL_PROD_TBL SET NAME = ?, PRC = ?, PTH = ? WHERE DTL_PROD_CD = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, smallCtr[i]);
			pstmt.setString(2, prc[i]);
			pstmt.setString(3, pth[i]);
			pstmt.setString(4, cd[i]);
			
			result = result + pstmt.executeUpdate();
		}
		
		System.out.println("총 " + result + " 개의 행이 입력되었습니다.");
		
		// 반환 자료형 선언 크기는 나중에 지정함.
		String[] str = null;
		/*
		if (result >= 1)
		{
			
			String sql = "UPDATE IMG_TBL SET PTH = ? WHERE IMG_CD = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cd);
			
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next())
			{	
				count = rs.getInt("COUNT");
			}
			
			
			// 알아낸 레코드의 크기만큼 배열방을 생성한다.
			str = new String[count];
			
			for (int i = 0; i < str.length; i++)
			{
				// 매개변수 PROD_CD를 이용하여 PROD_TP_CD 를 알아낸다.
				sql = "SELECT PROD_TP_CD FROM PROD_TP_TBL WHERE PROD_CD = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cd);
				
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{	
					str[i] = rs.getString("PROD_TP_CD");
				}
			}
		
		}
		else 
		{
			System.out.println("PROD_TP_TBL Error!! 정상적으로 입력되지 않았습니다.");
		}
			*/
		
		pstmt.close();
		conn.close();
		
		return str;
	}
	
	// 이미지 테이블
	@Override
	public int img_tbl_Update(String cd, String[] img) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		PreparedStatement pstmt = null;
		for (int i = 0; i < img.length; i++)
		{
			String sql = "INSERT INTO 'TRY'.'IMG_TBL' (IMG_CD, DTL_PROD_CD, PTH) VALUES (IMG_TBL_SEQ.NEXTVAL, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cd);
			pstmt.setString(2, img[i]);
			result = result + pstmt.executeUpdate();
		}
		
		System.out.println(result + "개의 행이 입력되었습니다.");
		
		pstmt.close();
		conn.close();
		
		return result;
	}
}
