package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;
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
<<<<<<< HEAD
			+ " (ID, PWD, NICKNAME, PHONE, POINT, MONEY, AUTH) "
			+ " VALUES(?, ?, ?, ?, 0, 0, 3) ";
=======
			+ " (ID, PWD, NICKNAME, PHONE, AUTH, MONEY, POINT) "
			+ " VALUES(?, ?, ?, ?, 0, ?, ?) ";
>>>>>>> refs/remotes/origin/hs2
		
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
			psmt.setInt(5, dto.getMoney());
			psmt.setInt(6, dto.getPoint());
			
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
<<<<<<< HEAD
				int money = rs.getInt(5);
				int auth = rs.getInt(6);
=======
>>>>>>> refs/remotes/origin/hs2
				
<<<<<<< HEAD
				mem = new MemberDto(id, null, nick, phone, point, money, auth);
=======
				int money = rs.getInt(5);
				int auth = rs.getInt(6);
				
				mem = new MemberDto(id, null, nick, phone, auth, point, money);
>>>>>>> refs/remotes/origin/hs2
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

	@Override
	public void pointUpd(String id, int point) {
		String sql = "UPDATE MEMBER SET POINT = "+point+" WHERE ID= '" + id + "'";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MemberDto mem = null;
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
	public MemberDto refreshBet(String id) {
		String sql = " SELECT ID, NICKNAME, PHONE, POINT, MONEY, AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println("1/6 login Success");
			
			psmt.setString(1, id);
			
			System.out.println("2/6 login Success");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id2 = rs.getString(1);
				String nick = rs.getString(2);
				String phone = rs.getString(3);
				int point = rs.getInt(4);
				
				int money = rs.getInt(5);
				int auth = rs.getInt(6);
				
				mem = new MemberDto(id2, null, nick, phone, auth, point, money);
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
	public boolean diceClose(String id, int totalpoint) {
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

	@Override
	public MemberDto getMember(String id) {
		String sql = " SELECT ID, NICKNAME, PHONE, POINT, MONEY, AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mem = null;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			
			System.out.println("1/6 login Success");
			
			psmt.setString(1, id);
			
			System.out.println("2/6 login Success");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id2 = rs.getString(1);
				String nick = rs.getString(2);
				String phone = rs.getString(3);
				int point = rs.getInt(4);
				
				int money = rs.getInt(5);
				int auth = rs.getInt(6);
				
				mem = new MemberDto(id2, null, nick, phone, auth, point, money);
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
	public boolean diceUpdate(String id, int totalpoint) {
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
	@Override
	public MemberDto money_Update(MemberDto dto) {
	      System.out.println("===== money_Update start =======");
	      //update
	      String update_sql = " UPDATE MEMBER "
	            + " SET point = ? "
	            + " WHERE ID = ? ";
	      //select
	      String select_sql = " SELECT * "
	            + " FROM MEMBER "
	            + " WHERE ID = ? ";
	      
	      System.out.println("update_sql = " + update_sql);
	      System.out.println("select_sql = " + select_sql);
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      int count = 0;
	      
	      try {
	         System.out.println("1/6 money_Update sesstion");
	         conn = DBConnection.getConnection();
	         System.out.println("2/6 money_Update sesstion");
	         psmt = conn.prepareStatement(update_sql);
	         psmt.setInt(1, dto.getPoint());
	         psmt.setString(2, dto.getId());
	         psmt.executeQuery();
	         System.out.println("3/6 money_Update sesstion");
	         psmt.clearParameters();
	         System.out.println("4/6 money_Update sesstion");
	         psmt = conn.prepareStatement(select_sql);
	         System.out.println("5/6 money_Update sesstion");
	         psmt.setString(1, dto.getId());
	         rs = psmt.executeQuery();
	         System.out.println("6/6 money_Update sesstion");
	         while(rs.next()) {
	            int i = 1;
	            dto = new MemberDto(rs.getString(i++),
	                  rs.getString(i++),
	                  rs.getString(i++),
	                  rs.getString(i++),
	                  rs.getInt(i++),
	                  rs.getInt(i++),
	                  rs.getInt(i++));
	         }
	         System.out.println("OK~ money_Update sesstion");
	         
	      }catch(Exception e) {
	         System.out.println("money_Update fail");
	      }finally {
	         DBClose.close(psmt, conn, null);
	      }
	      System.out.println("===== money_Update END =======");
	      return dto;
	   }
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
			System.out.println(to_point + "," + id);
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
