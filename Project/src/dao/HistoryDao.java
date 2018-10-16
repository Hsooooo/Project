package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;
import dto.HistoryDto;

public class HistoryDao implements iHistoryDao{
   private static HistoryDao history = new HistoryDao();

   private HistoryDao() {
      DBConnection.initConnect();
   }

   public static HistoryDao getInstance() {
      return history;
   }
   
   @Override
   public boolean insertHis(HistoryDto dto) {
      String sql = " INSERT INTO HISTORY "
            + " (SEQ, ID, KIND, BET, EARNED, WDATE) "
            + " VALUES(SEQ_HIS.NEXTVAL, ?, ?,"
            + " ?, ?, SYSDATE) ";

      Connection conn = null;
      PreparedStatement psmt = null;
      int count = 0;

      try {
         conn = DBConnection.getConnection();
         System.out.println("1/6 addHis Succcess");

         psmt = conn.prepareStatement(sql);
         System.out.println("2/6 addHis Succcess");
         System.out.println(sql);
         psmt.setString(1, dto.getId());
         psmt.setInt(2, dto.getKind());
         psmt.setInt(3, dto.getBet());
         psmt.setInt(4, dto.getEarned());

         count = psmt.executeUpdate();
         System.out.println("3/6 addHis Succcess");
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
         System.out.println("addHis Fail");
      } finally {
         DBClose.close(psmt, conn, null);
      }

      return count > 0 ? true : false;
   }
   
   
}