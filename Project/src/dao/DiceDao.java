package dao;
 import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 import db.DBClose;
import db.DBConnection;
import dto.DiceDto;
import dto.MemberDto;
 public class DiceDao implements iDiceDao {
 private static DiceDao diceDao = new DiceDao();
	
	private DiceDao() {
		DBConnection.initConnect();
	}
	
	public static DiceDao getInstance() {
		return diceDao;
	}
 	@Override
	public boolean DiceAdd(String id, int curpoint) { // 금액 입력하고 배팅 버튼 누르면(1) dice 테이블에 신규 행 추가 . 레코드 없으면 insert, 있으면 CURPOINT만 업데이트됨.
 		int count = 0;
		String sql = " MERGE INTO DICE USING DUAL ON(ID = ?) WHEN MATCHED THEN "
				+ " UPDATE SET CURPOINT = ? "
				+ " WHEN NOT MATCHED THEN "
				+ " INSERT(ID, ROUND, BET, WIN, LOSE, EARNED, CURPOINT) "
				+ " VALUES(?, 0, 0, 0, 0, 0, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
	
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 DiceAdd Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 DiceAdd Success");
			
			psmt.setString(1, id);
			psmt.setInt(2, curpoint);
			psmt.setString(3, id);
			psmt.setInt(4, curpoint);
			
			System.out.println("3/6 DiceAdd Success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 DiceAdd Success");
			
		} catch (Exception e) {
			System.out.println("DiceAdd failed : " + e);
			
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false ;
	}
 	@Override
	public boolean DiceBet(String id, int bet) { // 금액 입력하고 배팅 버튼 누르면(2) BET, CURPOINT 항목 업데이트
		int count = 0;
		
		String sql = " UPDATE DICE SET BET = ?, CURPOINT = CURPOINT-? WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 DiceAdd success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 DiceAdd success");
 			psmt.setInt(1, bet);
			psmt.setInt(2, bet);
			psmt.setString(3, id);
			
			System.out.println("3/6 DiceAdd success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 DiceAdd success");
 			
		} catch (Exception e) {
 			System.out.println("DiceAdd failed : " + e);
 		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false ;
	}
 	
	@Override
	public boolean DiceAf(String id, int win, int lose, int earned) { // ROLL IT 버튼 누르면  회차, 결과, 포인트 업데이트
		
		int count = 0;
		String sql = " UPDATE DICE SET ROUND = ROUND+1, WIN = ?, LOSE = ?, EARNED = ?, CURPOINT = CURPOINT+? WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
	
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 DiceAf success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 DiceAf success");
 			psmt.setInt(1, win);
			psmt.setInt(2, lose);
			psmt.setInt(3, earned);
			psmt.setInt(4, earned);
			psmt.setString(5, id);
			
			System.out.println("3/6 DiceAf success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 DiceAf success");
 			
		} catch (Exception e) {
 			System.out.println("DiceAf failed : " + e);
 		} finally {
			DBClose.close(psmt, conn, null);
		}
	
		return count > 0  ? true : false;
	}
 	@Override
	public DiceDto ReDice(String id) { // 새로고침이나 reset 버튼 누르면  가용포인트 갱신 위해서 해당 유저의 dice 테이블 레코드 불러옴
		
		String sql = " SELECT * FROM DICE WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		DiceDto dice = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 ReDice success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 ReDice success");
			
			psmt.setString(1, id);
			System.out.println("3/6 ReDice success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 ReDice success");
			
			if(rs.next()) {
				dice = new DiceDto(rs.getString(1), 
						rs.getInt(2), 
						rs.getInt(3), 
						rs.getInt(4), 
						rs.getInt(5), 
						rs.getInt(6), 
						rs.getInt(7));
						
			}
			System.out.println("5/6 ReDice success");
			
		} catch (Exception e) {
			
			System.out.println("ReDice failed :" + e);
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		
		return dice;
	}
 }