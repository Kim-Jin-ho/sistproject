package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.SreBoard;

public interface SreBoardDMenu
{
   public ArrayList<SreBoard> list(int start, int end, int dataCount) throws SQLException;
   public ArrayList<SreBoard> lists(int start, int end, int dataCount, String searchKey, String searchValue) throws SQLException;
   public int getDataCount(String searchKey, String searchValue) throws SQLException;   // 게시글정보 조회 메소드

   public ArrayList<SreBoard> lists2(int start, int end, int dataCount, String searchKey, String searchValue) throws SQLException;   
   public ArrayList<SreBoard> view(int srId) throws SQLException;   // 글정보 메소드
   public int hitUp(int srId) throws SQLException;   // 조회수 메소드

   public int sreCreate(SreBoard sreboard) throws SQLException;   // 글작성 메소드
   public ArrayList<SreBoard> sreList(String srId) throws SQLException;   // 글정보 조회 메소드
   public int sreUpdate(SreBoard sreboard) throws SQLException;   // 수정 메소드
   public int sreDelete(String srId) throws SQLException;      // 삭제 메소드
   
   public int memberId(String nickname) throws SQLException;   // 회원번호 조회 메소드
   public double bukWi(String shopId) throws SQLException;      // 북위 조회 메소드
   public double dongKyung(String shopId) throws SQLException;   // 동경 조회 메소드
   
   public String getSave(String nickname) throws SQLException;   // 마일리지 조회 메소드
   public int insertSave(String mid) throws SQLException;             // 마일리지 적립 메소드
   public String getMid(String nickname) throws SQLException;         // 회원번호 조회 메소드
   
   // 추천목록 갯수 불러오기
      public int recommendCount() throws SQLException;
      // 추천목록 불러오기
      public String[] recommendList() throws SQLException;
      // 추천수 불러오기
      public int recommend(int srId) throws SQLException;
      // 추천하기
      public int recommendInsert(String recommendList, int srId, int mid) throws SQLException;
      // 추천여부 체크
      public int recommendCheck(int srId, int mid) throws SQLException;
      // 추천 취소하기
      public int recommendDelete(int srId) throws SQLException;

      // 신고수 불러오기
      public int report(int srId) throws SQLException;
      // 신고하기
      public int reportInsert(int srId, int mid) throws SQLException;
      // 신고여부 체크
      public int reportCheck(int srId, int mid) throws SQLException;
      // 신고 취소하기
      public int reportDelete(int srId) throws SQLException;
      // nickname 으로 srId 찾기
      public int searchNum(String nickname) throws SQLException;
      
      // 리플 불러오기
      public ArrayList<SreBoard> reList(int srId) throws SQLException;
      // 리플 작성하기
      public int reInsert(int srId, int mid, String srcontent, String nickname) throws SQLException;
      // 리플 수정하기
      public int reUpdate(int scid, String updateSrcontent) throws SQLException;
      // 리플 삭제하기
      public int reDelete(int scid) throws SQLException;
      // 리플 추천하기
      public int repleRecommend(int scid) throws SQLException;
   
}