package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;
import dto.HistoryDto;
import dto.PagingBean;
import dto.PagingUtil;

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
	
	@Override
	public List<HistoryDto> getBbsPagingList(PagingBean paging,String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<HistoryDto> bbslist = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsPagingList Success");
			String sel = "";
			
			String totalSql = " SELECT COUNT(SEQ) "
					+ " FROM HISTORY "
					+ " WHERE ID= '" + id + "' ";
			
			psmt = conn.prepareStatement(totalSql);
			rs = psmt.executeQuery();
			
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);
			paging.setTotalCount(totalCount);
			paging = PagingUtil.setPagingInfo(paging);
			
			psmt.close();
			rs.close();
			
			String sql = " SELECT * FROM "
					+ " (SELECT * FROM "
					+ " 	(SELECT * FROM HISTORY"
					+ "		WHERE ID='"+ id + "' "
					+ "		ORDER BY WDATE ASC) "
					+ " WHERE ROWNUM <=" + paging.getStartNum() + ""
					+ "	ORDER BY WDATE DESC) "
					+ "	WHERE ROWNUM <=" + paging.getCountPerPage();
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsPagingList Success");
			System.out.println(sql);
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsPagingList Success");
			
			while(rs.next()) {
				HistoryDto dto = new HistoryDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6));
				bbslist.add(dto);
			}
			System.out.println("4/6 getBbsPagingList Success");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return bbslist;
	}
	@Override
	public List<HistoryDto> getRanklist() {
		   
		   System.out.println("============== historyDao getlist start ============");
		   String sql = " SELECT ID, SUM(EARNED) AS TOTAL "
		         + " FROM HISTORY "
		         + " GROUP BY ID "
		         + " ORDER BY TOTAL DESC ";
		   System.out.println("sql = " + sql);
		   /*        SELECT ID, SUM(EARNED)
		            FROM HISTORY
		            GROUP BY ID*/
		   List<HistoryDto> list = new ArrayList<>();

		   Connection conn = null;
		   PreparedStatement psmt = null;
		   ResultSet rs = null;
		   
		   try {
		      conn = DBConnection.getConnection();
		      System.out.println("1/6 getlsit Succcess");
		      psmt = conn.prepareStatement(sql);
		      System.out.println("2/6 getlsit Succcess");
		      rs = psmt.executeQuery();
		      System.out.println("3/6 getlsit Succcess");
		      while(rs.next()) {
		         int i = 1;
		         HistoryDto dto = new HistoryDto();
		         dto.setId(rs.getString(i++));
		         dto.setEarned(rs.getInt(i++));
		         list.add(dto);
		      }
		      System.out.println("6/6 getlsit Succcess");
		      }catch(Exception e ) {
		      System.out.println("getlsit fail");
		      }finally {
		      DBClose.close(psmt, conn, rs);
		      }
		      return list;
		   }  
	
	
}
