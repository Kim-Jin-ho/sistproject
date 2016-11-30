/*=======================
     BoardDAO.java
=======================*/

package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO
{
   private Connection conn;
   BoardDTO dto = null;
   
   public BoardDAO(Connection conn)
   {
      this.conn = conn;      
   }
   
   // 번호의 최대값 얻기
   public int getMaxNum()
   {
      int result = 0;
      
      Statement stmt = null;
      ResultSet rs= null;
      String sql = "";
      
      try
      {
         sql = "SELECT NVL(MAX(NUM),0) AS NUM FROM TBL_BOARD";
         stmt = conn.createStatement();
         
         rs = stmt.executeQuery(sql);
         
         if (rs.next())
            result = rs.getInt(1);
         rs.close();
         stmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
      return result;
   }
   
   // 게시물 작성
   public int insertDate(BoardDTO dto)
   {
      int result = 0;
      
      PreparedStatement pstmt = null;      
      
      String sql="";
      
      try
      {
         // hitCount 는 기본값 (default) 0
         // created 는 기본값 (default) sysdate
         sql = "INSERT INTO TBL_BOARD"
               + "(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR) VALUES "
               + "(?, ?, ?, ?, ?, ?, ?)";
         
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, dto.getNum());
         pstmt.setString(2, dto.getName());
         pstmt.setString(3, dto.getPwd());
         pstmt.setString(4, dto.getEmail());
         pstmt.setString(5, dto.getSubject());
         pstmt.setString(6, dto.getContent());
         pstmt.setString(7, dto.getIpAddr());
         
         result = pstmt.executeUpdate();
         
         pstmt.close();
      }
      catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
      return result;
   }
   
   
   // DB 의 레코드 갯수를 가져오기 → 전체 데이터의 갯수를 구한다.
   // 검색 기능 추가 전~!!
   /*
   public int getDataCount()
   {
      int result = 0;
      
      Statement stmt = null;      
      String sql = "";
      ResultSet rs;
      
      try
      {
         sql = "SELECT NVL(COUNT(*), 0) AS COUNT FROM TBL_BOARD";
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         if(rs.next())
            result = rs.getInt("COUNT");      
      } 
      catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
      return result;
   }
   */
   
   // DB의 레코드 갯수를 가져오기 ~ !! 전체 데이터의  갯수를 구한다.
   // 검색 기능 추가 이후!!
   public int getDataCount(String searchKey, String searchValue)
   {
	   int result =0 ;
	   
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   String sql = "";
		try
		{
			searchValue = "%"+searchValue+"%";	//- 검색어 추가
			sql = "SELECT NVL(COUNT(*), 0) AS COUNT FROM TBL_BOARD WHERE " + searchKey + " LIKE ?";
			//-- searchKey 로 넘겨받을 수 있는 내용은
			//	 content, subject, name 만 가능한 상황
			//	 『?』 로 처리할 수 없음
			
			
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, searchKey);
			pstmt.setString(1, searchValue);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				result = rs.getInt("COUNT");
			rs.close();
			pstmt.close();
				
		}catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return result;
   }
  
   
   
   
   // 리스트 형태로 읽어오기
   // 검색기능 추가 이전!!
   /*
   public List<BoardDTO> getLists(int start, int end)
   {
      List<BoardDTO> lists = new ArrayList<BoardDTO>();
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "";
      
      try
      {
         sql = "SELECT * FROM ( SELECT ROW_NUMBER() OVER (ORDER BY NUM DESC) AS RNUM, DATA.* FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ) DATA) WHERE RNUM >= ? AND RNUM <= ?";
         
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1,  start);
         pstmt.setInt(2, end);
         
         rs = pstmt.executeQuery();
         
         while (rs.next())
         {
            dto = new BoardDTO();
            dto.setNum(rs.getInt("NUM"));
            dto.setName(rs.getString("NAME"));
            dto.setSubject(rs.getString("SUBJECT"));
            dto.setHitCount(rs.getInt("HITCOUNT"));
            dto.setCreated(rs.getString("CREATED"));
            lists.add(dto);               
         }
         rs.close();
         pstmt.close();
      } 
      catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return lists;
   }
   */
   // 리스트 형태로 읽어오기
   // 검색기능 추가 이후!!
   
   public List<BoardDTO> getLists(int start, int end, String searchKey, String searchValue, int cnt)
   {
      List<BoardDTO> lists = new ArrayList<BoardDTO>();
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "";
      BoardDTO dto = null;
      
      int total = cnt + 1;
      
      try
      {
         searchValue = "%"+searchValue+"%";
         sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY NUM DESC) "
               + "AS RNUM,DATA.* FROM (SELECT NUM,NAME,SUBJECT,HITCOUNT,TO_CHAR(CREATED,'YYYY-MM-DD') "
               + "AS CREATED FROM TBL_BOARD WHERE "+searchKey+" LIKE ? ) DATA) WHERE RNUM>=? AND RNUM<=?";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, searchValue);
         pstmt.setInt(2, start);
         pstmt.setInt(3, end);
         
         rs = pstmt.executeQuery();
         int totalCnt=0;
         while (rs.next())
         {
            dto = new BoardDTO();
            dto.setNum(rs.getInt("NUM"));
            
            totalCnt = total-rs.getInt("RNUM");
            
            dto.setRnum(totalCnt);
            dto.setName(rs.getString("NAME"));
            dto.setSubject(rs.getString("SUBJECT"));
            dto.setHitCount(rs.getInt("HITCOUNT"));
            dto.setCreated(rs.getString("CREATED"));
            lists.add(dto);         
            
         }
         rs.close();
         pstmt.close();      
               
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }   
      
      return lists;
   }  
   
   // 게시물에 대한 조회 횟수 증가 시키기
   public int updateHitCount(int num)
   {
	   int result = 0;
	   
	   PreparedStatement pstmt = null;
	   String sql = "";
	   
	   try
	   {
		   sql = "UPDATE TBL_BOARD SET HITCOUNT = NVL(HITCOUNT,0)+1 WHERE NUM=?";
		
		   pstmt= conn.prepareStatement(sql);
		
		   pstmt.setInt(1, num);
		
		   result = pstmt.executeUpdate();
		
		   pstmt.close();
		
	   } catch (Exception e)
	   {
		   System.out.println(e.toString());
	   }
	   return result;
   }
   
   // 특정 게시물의 데이터 읽어오기
   public BoardDTO getReadData(int num)
   {
	   BoardDTO dto = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   String sql = "";
	   
	   	try
		{
	   		sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD HH24:MI:SS') AS CREATED FROM TBL_BOARD WHERE NUM=?";
	   		pstmt = conn.prepareStatement(sql);
	   		pstmt.setInt(1, num);
	   		
	   		rs = pstmt.executeQuery();
	   		
	   		if(rs.next())
	   		{
	   			dto = new BoardDTO();
	   			dto.setNum(rs.getInt("NUM"));
	   			dto.setName(rs.getString("NAME"));
	   			dto.setPwd(rs.getString("PWD"));
	   			dto.setEmail(rs.getString("EMAIL"));
	   			dto.setSubject(rs.getString("SUBJECT"));
	   			dto.setContent(rs.getString("CONTENT"));
	   			dto.setIpAddr(rs.getString("IPADDR"));
	   			dto.setHitCount(rs.getInt("HITCOUNT"));
	   			dto.setCreated(rs.getString("CREATED"));
	   		}
	   		
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		   
	   return dto;
   }
   
   // 특정 게시물 삭제하기
   public int deleteData(int num)
   {
	   int result = 0;
	   
	   PreparedStatement pstmt = null;
	   String sql = "";
	   
	   try
	   {
		sql = "DELETE FROM TBL_BOARD WHERE NUM=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		
		result = pstmt.executeUpdate();
		   
	} catch (Exception e)
	{
		System.out.println(e.toString());
	}
	   
	   return result;
   }
   
   // 게시물 수정하기
   public int updateData(BoardDTO dto)
   {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		try
		{
			sql = "UPDATE TBL_BOARD SET NAME=?"
					+ ", PWD=?,EMAIL=?"
					+ ", SUBJECT=?"
					+ ", CONTENT=?"
					+ " WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getSubject());
			pstmt.setString(5, dto.getContent());
			pstmt.setInt(6, dto.getNum());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	   return result;
   }
   
   
   // 검색기능 추가
   
   // 이전글 
   public List<BoardDTO> nextText(int num)
   {
	   List<BoardDTO> lists = new ArrayList<BoardDTO>();
	   PreparedStatement pstmt = null;
	   String sql = "";
	   ResultSet rs = null;
	   BoardDTO dto = null;
	   try
	   {
		   sql = "SELECT NUM, SUBJECT, NAME, HITCOUNT, CREATED WHERE NUM IN ((SELECT MAX(num) FROM TBL_BOARD  WHERE num < ?))";
		   pstmt = conn.prepareStatement(sql);
		   
		   pstmt.setInt(1, num);
		   
		   rs = pstmt.executeQuery();
		   
		   while(rs.next())
		   {
			   dto = new BoardDTO();
			   
			   dto.setNum(rs.getInt("NUM"));
			   dto.setName(rs.getString("NAME"));
			   dto.setSubject(rs.getString("SUBJECT"));
			   dto.setHitCount(rs.getInt("HITCOUNT"));
			   dto.setCreated(rs.getString("CREATE"));
			   
			   lists.add(dto);
		   }
	   }catch(Exception e)
	   {
		   System.out.println(e.toString());
	   }
	   
	   
	   return lists;
   }
   
   
   public String preNum(int num) {

	      String result = "";

	      PreparedStatement pstmt = null;

	      ResultSet rs = null;

	      String sql = "";

	      try {

	         sql = "SELECT MAX(NUM) AS NUM FROM TBL_BOARD WHERE NUM < ?";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, num);

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            result = rs.getString("NUM");
	         }

	      } catch (Exception e) {

	         System.out.println(e.toString());

	      }

	      return result;

	   }

	   public String nextNum(int num) {

	      String result = "";

	      PreparedStatement pstmt = null;

	      ResultSet rs = null;

	      String sql = "";

	      try {

	         sql = "SELECT MIN(NUM) AS NUM FROM TBL_BOARD WHERE NUM > ?";

	         pstmt = conn.prepareStatement(sql);

	         pstmt.setInt(1, num);

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            result = rs.getString("NUM");
	         }

	      } catch (Exception e) {

	         System.out.println(e.toString());

	      }

	      return result;

	   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
}