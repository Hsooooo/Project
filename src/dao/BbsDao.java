package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;
import dto.PagingBean;
import dto.PagingUtil;

public class BbsDao implements iBbsDao {

	private static BbsDao bbsdao = new BbsDao();

	private BbsDao() {
		DBConnection.initConnect();
	}

	public static BbsDao getInstance() {
		return bbsdao;
	}

	@Override
	public List<BbsDto> getBbsList() {
		String sql = " SELECT SEQ, ID, " + " TITLE, CONTENT, WDATE, " + " DEL, READCOUNT "
				+ " FROM BBS " + "ORDER BY WDATE ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<BbsDto> list = new ArrayList<>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");

			while (rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));

				list.add(dto);

			}

			System.out.println("4/6 getBbsList Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getBbsList Fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	@Override
	public boolean insertBbs(BbsDto dto) {
		String sql = " INSERT INTO BBS "
				+ " (SEQ, ID, TITLE, CONTENT, WDATE, DEL, READCOUNT) "
				+ " VALUES(SEQ_BBS.NEXTVAL, ?,"
				+ " ?, ?, SYSDATE, 0, 0) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addBbs Succcess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addBbs Succcess");
			System.out.println(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());

			count = psmt.executeUpdate();
			System.out.println("3/6 addBbs Succcess");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("addBbs Fail");
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	@Override
	public BbsDto getBbs(int seq) {
		String sql = "SELECT * FROM BBS WHERE SEQ =" + seq;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		BbsDto dto = null;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbs Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbs Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbs Success");

			while (rs.next()) {
				dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));

			}

			System.out.println("4/6 getBbs Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getBbs Fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
	}

	@Override
	public void addRead(int seq) {
		String sql = "UPDATE BBS SET READCOUNT = READCOUNT +1 WHERE SEQ= " + seq;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		BbsDto dto = null;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addRead Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addRead Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 addRead Success");

			System.out.println("4/6 addRead Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("addRead Fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}

	}

	@Override
	public void delBbs(int seq) {
		String sql = "UPDATE BBS SET DEL = 1 WHERE SEQ= " + seq;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		BbsDto dto = null;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 delBbs Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 delBbs Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 delBbs Success");

			System.out.println("4/6 delBbs Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("delBbs Fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}

	}

	@Override
	public boolean updateBbs(String title, String content, int seq) {
		String sql = "UPDATE BBS SET TITLE = '" + title + "', CONTENT = '" + content + "' WHERE SEQ= " + seq;
		boolean flag = false;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		BbsDto dto = null;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 editBbs Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 editBbs Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 editBbs Success");
			flag = true;

			System.out.println("4/6 editBbs Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("editBbs Fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return flag;

	}

	@Override
	public List<BbsDto> myBbsList(String id) {
		String sql = " SELECT SEQ, ID, " + " TITLE, CONTENT, WDATE, " + " DEL, READCOUNT "
				+ " FROM BBS WHERE ID= '" + id + "' " + "ORDER BY WDATE DESC ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<BbsDto> list = new ArrayList<>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");

			while (rs.next()) {
				BbsDto dto =  new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));

				list.add(dto);

			}

			System.out.println("4/6 getBbsList Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getBbsList Fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	

	@Override
	public List<BbsDto> getBbsPagingList(PagingBean paging, String searchWord) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> bbslist = new ArrayList<>();
		
		String sWord = "%" + searchWord.trim() + "%";
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsPagingList Success");
			
			String totalSql = " SELECT COUNT(SEQ) "
					+ " FROM BBS "
					+ " WHERE TITLE LIKE '" + sWord + "' ";
			
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
					+ " 	(SELECT * FROM BBS"
					+ "		WHERE TITLE LIKE '" + sWord + "' "
					+ "		ORDER BY WDATE) "
					+ " WHERE ROWNUM <=" + paging.getStartNum() + ""
					+ "	ORDER BY WDATE) "
					+ "	WHERE ROWNUM <=" + paging.getCountPerPage();
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsPagingList Success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsPagingList Success");
			
			while(rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7));
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

}
