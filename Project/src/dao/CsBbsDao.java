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
import dto.CsBbsDto;
import dto.PagingBean;
import dto.PagingUtil;

public class CsBbsDao implements iCsBbsDao {
	private static CsBbsDao csbbsdao = new CsBbsDao();

	private CsBbsDao() {
		DBConnection.initConnect();
	}

	public static CsBbsDao getInstance() {
		return csbbsdao;
	}

	@Override
	public List<CsBbsDto> getBbsList() {
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, " + " TITLE, CONTENT, WDATE, PARENT, " + " DEL, READCOUNT "
				+ " FROM CS_BBS " + "ORDER BY REF DESC, STEP ASC ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<CsBbsDto> list = new ArrayList<>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");

			while (rs.next()) {
				CsBbsDto dto = new CsBbsDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getInt(11));

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
	public boolean insertBbs(CsBbsDto dto) {
		String sql = " INSERT INTO CS_BBS "
				+ " (SEQ, ID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, PARENT, DEL, READCOUNT) "
				+ " VALUES(SEQ_CS.NEXTVAL, ?," + " ( SELECT NVL(MAX(REF), 0)+1 FROM CS_BBS), " // ref
				+ "0, 0," // step, depth
				+ " ?, ?, SYSDATE, 0, 0, 0) ";

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
	public CsBbsDto getBbs(int seq) {
		String sql = "SELECT * FROM CS_BBS WHERE SEQ =" + seq;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		CsBbsDto dto = null;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbs Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbs Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbs Success");

			while (rs.next()) {
				dto = new CsBbsDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getInt(11));

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
		String sql = "UPDATE CS_BBS SET READCOUNT = READCOUNT +1 WHERE SEQ= " + seq;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		CsBbsDto dto = null;

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
		String sql = "UPDATE CS_BBS SET DEL = 1 WHERE SEQ= " + seq;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		CsBbsDto dto = null;

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
		String sql = "UPDATE CS_BBS SET TITLE = '" + title + "', CONTENT = '" + content + "' WHERE SEQ= " + seq;
		boolean flag = false;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		CsBbsDto dto = null;

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
	public List<CsBbsDto> myBbsList(String id) {
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, " + " TITLE, CONTENT, WDATE, PARENT, " + " DEL, READCOUNT "
				+ " FROM CS_BBS WHERE ID= '" + id + "' " + "ORDER BY REF DESC, STEP ASC ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<CsBbsDto> list = new ArrayList<>();

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");

			while (rs.next()) {
				CsBbsDto dto = new CsBbsDto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10), rs.getInt(11));

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
	public boolean answer(int seq, CsBbsDto bbs) {

// update
		String sql1 = " UPDATE CS_BBS " + " SET STEP=STEP+1 " + " WHERE REF=(SELECT REF FROM CS_BBS WHERE SEQ=?) " 
				+ " 	AND STEP>(SELECT STEP FROM CS_BBS WHERE SEQ=?) ";

// insert
		String sql2 = " INSERT INTO CS_BBS " + " (SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, PARENT, DEL, READCOUNT) " + " VALUES(SEQ_CS.NEXTVAL, ?, "
				+ "			(SELECT REF FROM CS_BBS WHERE SEQ=?), " // REF
				+ "			(SELECT STEP FROM CS_BBS WHERE SEQ=?)+1, " // STEP
				+ "			(SELECT DEPTH FROM CS_BBS WHERE SEQ=?)+1, "// DEPTH
				+ "			?, ?, SYSDATE, ?, 0, 0) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			System.out.println("1/6 S answer");

			psmt = conn.prepareStatement(sql1); // update
			psmt.setInt(1, seq);
			psmt.setInt(2, seq);
			System.out.println("2/6 S answer");

			count = psmt.executeUpdate();
			System.out.println("3/6 S answer");

			psmt.clearParameters();

			psmt = conn.prepareStatement(sql2); // insert
			psmt.setString(1, bbs.getId()); // id
			psmt.setInt(2, seq); // ref
			psmt.setInt(3, seq); // step
			psmt.setInt(4, seq); // depth
			psmt.setString(5, bbs.getTitle());
			psmt.setString(6, bbs.getContent());
			psmt.setInt(7, seq);
			System.out.println("4/6 S answer");

			count = psmt.executeUpdate();
			conn.commit();
			System.out.println("5/6 S answer");
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} finally {

			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DBClose.close(psmt, conn, null);
			System.out.println("6/6 S answer");
		}

		return count > 0 ? true : false;
	}

	@Override
	public List<CsBbsDto> getBbsPagingList(PagingBean paging, String searchWord) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CsBbsDto> bbslist = new ArrayList<>();
		
		String sWord = "%" + searchWord.trim() + "%";
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsPagingList Success");
			
			String totalSql = " SELECT COUNT(SEQ) "
					+ " FROM CS_BBS "
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
					+ " 	(SELECT * FROM CS_BBS"
					+ "		WHERE TITLE LIKE '" + sWord + "' "
					+ "		ORDER BY REF ASC, STEP DESC) "
					+ " WHERE ROWNUM <=" + paging.getStartNum() + ""
					+ "	ORDER BY REF DESC, STEP ASC) "
					+ "	WHERE ROWNUM <=" + paging.getCountPerPage();
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsPagingList Success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsPagingList Success");
			
			while(rs.next()) {
				CsBbsDto dto = new CsBbsDto(rs.getInt(1),
										rs.getString(2),
										rs.getInt(3),
										rs.getInt(4),
										rs.getInt(5),
										rs.getString(6),
										rs.getString(7),
										rs.getString(8),
										rs.getInt(9),
										rs.getInt(10),
										rs.getInt(11));
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
	public int getMyCsCount(String id) {
		String sql = " SELECT count(*) "
				+ " FROM CS_BBS WHERE ID= '" + id + "'";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbs Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbs Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbs Success");

			while (rs.next()) {
				count = rs.getInt(1);

			}

			System.out.println("4/6 getBbs Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getBbs Fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return count;
	}
	
	
}
