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
			+ " (ID, PWD, NICKNAME, PHONE, POINT, MONEY, AUTH) "
			+ " VALUES(?, ?, ?, ?, 0, 0, 3) ";
		
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
		String sql = " SELECT ID, NICKNAME, PHONE, POINT, MONEY, AUTH "
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
				int point = rs.getInt(4);
				int money = rs.getInt(5);
				int auth = rs.getInt(6);
				
				mem = new MemberDto(id, null, nick, phone, point, money, auth);
			}
			
			System.out.println("3/6 login Success");
	
		} catch (Exception e) {
		
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
	
	
	//////////////////////////////////////////////////////////////////
	//게임 종료시 member 테이블로 dice 게임 결과(최종 현재포인트) 업데이트 하기 위함
	@Override
	public boolean diceUpdate(String id, int totalpoint) { // diceGame 뷰에서 '그만하기'버튼 누르면 Dice 테이블의 curpoint가 여기로 동기화됨.
		
		String sql = " UPDATE MEMBER SET POINT = ? WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 diceClose Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 diceClose Success");
			
			psmt.setInt(1, totalpoint);
			psmt.setString(2, id);
			System.out.println("3/6 diceClose Success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 diceClose Success");
			
		} catch (Exception e) {
			System.out.println("diceClose failed : " + e);
			
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		
		return count > 0 ? true : false;
	}
	//////////////////////////////////////////////////////////////////

	
    //////////////////////////////////////////////////////////////////
	/// 마이페이지 - 충전하기 관리자 승인 후 money에 더해주기
	@Override
	public boolean fillMoneyUpdate(String id, int fill_money) {
		
	String sql = " UPDATE MEMBER SET MONEY=MONEY+? WHERE ID=? ";
		
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 moneyToPoint success");	
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 moneyToPoint success");	

			psmt.setInt(1, fill_money);
			psmt.setString(2, id);
			System.out.println("3/6 moneyToPoint success");	

			count = psmt.executeUpdate();
			System.out.println("4/6 moneyToPoint success");	

		} catch (Exception e) {
			System.out.println("moneyToPoint failed :" + e);	

		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0 ? true : false;
	}

	

	
	
	
	//////////////////////////////////////////////////////////////////
	//마이페이지 - 포인트로 전환하기 버튼 누르면 (승인 없이 바로) money에서 빠지고, point에 더하도록 업데이트.
	@Override
	public boolean moneyToPoint(String id, int to_point) {
		
		String sql = " UPDATE MEMBER SET MONEY=MONEY-?, POINT=POINT+? WHERE ID=? ";
		
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 moneyToPoint success");	
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 moneyToPoint success");	

			psmt.setInt(1, to_point);
			psmt.setInt(2, to_point);
			psmt.setString(3, id);
			System.out.println("3/6 moneyToPoint success");	

			count = psmt.executeUpdate();
			System.out.println("4/6 moneyToPoint success");	

		} catch (Exception e) {
			System.out.println("moneyToPoint failed :" + e);	

		} finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0 ? true : false;
	}

	
	//////////////////////////////////////////////////////////////////
	//마이페이지 - 환전하기 관리자 승인 후  money에 더해주고, POINT에서 빼야됨.
	@Override
	public boolean toMoneyUpdate(String id, int to_money) {
	
		String sql = " UPDATE MEMBER SET MONEY=MONEY+?, POINT=POINT-? WHERE ID=? ";
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 moneyUpdate success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 moneyUpdate success");
			
			psmt.setInt(1, to_money);
			psmt.setInt(2, to_money);
			psmt.setString(3, id);
			
			System.out.println("3/6 moneyUpdate success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 moneyUpdate success");
			
		} catch (Exception e) {
			System.out.println("moneyUpdate failed : " + e);
			
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		
		return count > 0 ? true : false ;
	}

	
	
	
}
