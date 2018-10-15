package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CommentDto;

public class CommentDao implements iCommentDao{
private static CommentDao commentdao = new CommentDao();
	
	private CommentDao() {
		DBConnection.initConnect();
	}
	
	public static CommentDao getInstance() {
		return commentdao;
	}

	@Override
	public List<CommentDto> getCommentList(int seq) {
		String sql = "SELECT COM_SEQ, ID, CONTENT, W_DATE "
				+ " FROM COMENT WHERE BBS_SEQ="+seq + " ORDER BY W_DATE ASC";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CommentDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");
			
			while(rs.next()) {
				CommentDto dto = new CommentDto(rs.getInt(1), rs.getString(2), rs.getString(3), seq, rs.getString(4));
				
				list.add(dto);
				
			}
			
			System.out.println("4/6 getBbsList Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getBbsList Fail");
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	@Override
	public void commentWrite(int seq,String id, String content) {
		String sql =" INSERT INTO COMENT "
				+ " (COM_SEQ, ID, CONTENT, BBS_SEQ, W_DATE) "
				+ " VALUES(SEQ_COM.NEXTVAL, '"+id
				+ "', '"+content+"', "+seq+", SYSDATE)";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 addBbs Succcess");
				System.out.println(id);
				System.out.println(content);
				System.out.println(seq);
				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 addBbs Succcess");
				System.out.println(sql);
				
				psmt.executeUpdate();
				System.out.println("3/6 addBbs Succcess");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("addBbs Fail");
			}finally {
				DBClose.close(psmt, conn, null);
			}
	}

	@Override
	public int commentCount(int seq) {
		String sql = "SELECT count(*) "
				+ " FROM COMENT WHERE BBS_SEQ="+seq;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");
			
			while(rs.next()) {
				count = rs.getInt(1);
				
			}
			
			System.out.println("4/6 getBbsList Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getBbsList Fail");
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return count;
	}

	@Override
	public void commentDel(int seq) {
		String sql ="  DELETE FROM COMENT " + 
				"     WHERE COM_SEQ="+seq;
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 addBbs Succcess");
				
				System.out.println(seq);
				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 addBbs Succcess");
				System.out.println(sql);
				
				psmt.executeUpdate();
				System.out.println("3/6 addBbs Succcess");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("addBbs Fail");
			}finally {
				DBClose.close(psmt, conn, null);
			}
		
	}
	
	
}
