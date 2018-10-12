package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBClose;
import db.DBConnection;
import dto.MemberDto;

public class MemberDao implements iMemberDao {
	private static MemberDao memberDao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnect();
	}
	
	public static MemberDao getInstance() {
		return memberDao;
	}

	@Override
	public boolean addMember(MemberDto dto) {
		String sql =" INSERT INTO MEMBER "
			+ " (ID, PWD, NICKNAME, PHONE, AUTH) "
			+ " VALUES(?, ?, ?, ?, 0) ";
		System.out.println("sql");
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addMember Succcess");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addMember Succcess");
			System.out.println(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getNickname());
			psmt.setString(4, dto.getPhone());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addMember Succcess");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("addMember Fail");
		}finally {
			DBClose.close(psmt, conn, null);
		}
		
		
		return count>0?true:false;
	}

	@Override
	public boolean idCheck(String id) {
		String sql =" SELECT ID FROM MEMBER "
				+ " WHERE ID= '" + id+"'";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			int count = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 chkMember Succcess");
				System.out.println(id);
				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 chkMember Succcess");
				
				
				
				
				count = psmt.executeUpdate();
				System.out.println("3/6 chkMember Succcess");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("chkMember Fail");
			}finally {
				DBClose.close(psmt, conn, null);
			}
			
			
			return count>0?true:false;
	}

	@Override
	public MemberDto login(MemberDto dto) {
		String sql = " SELECT ID, NICKNAME, PHONE, AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=? AND PWD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println("1/6 login Success");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			
			System.out.println("2/6 login Success");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString(1);
				String nick = rs.getString(2);
				String phone = rs.getString(3);
				int auth = rs.getInt(4);
				
				mem = new MemberDto(id, null, nick, phone, auth);
			}
			
			System.out.println("3/6 login Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("login Fail");
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return mem;
	}

	@Override
	public boolean nickCheck(String nick) {
		String sql =" SELECT NICKNAME FROM MEMBER "
				+ " WHERE NICKNAME= '" + nick+"'";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			int count = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 chkMember Succcess");
				System.out.println(nick);
				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 chkMember Succcess");
				
				
				
				
				count = psmt.executeUpdate();
				System.out.println("3/6 chkMember Succcess");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("chkMember Fail");
			}finally {
				DBClose.close(psmt, conn, null);
			}
			
			
			return count>0?true:false;
	}

	@Override
	public boolean phoneCheck(String phone) {
		String sql =" SELECT PHONE FROM MEMBER "
				+ " WHERE PHONE= '" + phone+"'";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			int count = 0;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6 chkMember Succcess");
				System.out.println(phone);
				psmt = conn.prepareStatement(sql);
				System.out.println("2/6 chkMember Succcess");
				
				
				
				
				count = psmt.executeUpdate();
				System.out.println("3/6 chkMember Succcess");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("chkMember Fail");
			}finally {
				DBClose.close(psmt, conn, null);
			}
			
			
			return count>0?true:false;
	}
	
	
	
	
}
