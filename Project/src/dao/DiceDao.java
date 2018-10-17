package dao;
<<<<<<< HEAD

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
	public boolean diceAdd(String id, int curpoint) { // ì²˜ìŒ ì§„ìž…ì‹œ dice í…Œì´ë¸”ì— ì‹ ê·œ í–‰ ì¶”ê°€/ì—…ë°ì´íŠ¸ . ë ˆì½”ë“œ ì—†ìœ¼ë©´ insert, ìžˆìœ¼ë©´ CURPOINTë§Œ ì—…ë°ì´íŠ¸ë¨.

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
	public boolean diceBet(String id, int bet) { // ê¸ˆì•¡ ìž…ë ¥í•˜ê³  ë°°íŒ… ë²„íŠ¼ ëˆ„ë¥´ë©´(2) BET, CURPOINT í•­ëª© ì—…ë°ì´íŠ¸
		int count = 0;
		
		String sql = " UPDATE DICE SET BET = BET+?, CURPOINT = CURPOINT-? WHERE ID = ? ";
		
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
	public boolean diceAf(String id, int win, int lose, int earned) { // ROLL IT ë²„íŠ¼ ëˆ„ë¥´ë©´  íšŒì°¨, ê²°ê³¼, í¬ì¸íŠ¸ ì—…ë°ì´íŠ¸
		
		int count = 0;
		String sql = " UPDATE DICE SET ROUND = ROUND+1, WIN = WIN+?, LOSE = LOSE+?, EARNED = EARNED+?, CURPOINT = CURPOINT+? WHERE ID = ? ";
		
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
	public DiceDto reDice(String id) { // ìƒˆë¡œê³ ì¹¨ì´ë‚˜ reset ë²„íŠ¼ ëˆ„ë¥´ë©´  ê°€ìš©í¬ì¸íŠ¸ ê°±ì‹  ìœ„í•´ì„œ í•´ë‹¹ ìœ ì €ì˜ dice í…Œì´ë¸” ë ˆì½”ë“œ ë¶ˆëŸ¬ì˜´
		
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
=======
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
	public boolean diceAdd(String id, int curpoint) { // ±Ý¾× ÀÔ·ÂÇÏ°í ¹èÆÃ ¹öÆ° ´©¸£¸é(1) dice Å×ÀÌºí¿¡ ½Å±Ô Çà Ãß°¡ . ·¹ÄÚµå ¾øÀ¸¸é insert, ÀÖÀ¸¸é CURPOINT¸¸ ¾÷µ¥ÀÌÆ®µÊ.

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
	public boolean diceBet(String id, int bet) { // ±Ý¾× ÀÔ·ÂÇÏ°í ¹èÆÃ ¹öÆ° ´©¸£¸é(2) BET, CURPOINT Ç×¸ñ ¾÷µ¥ÀÌÆ®
		int count = 0;
		
		String sql = " UPDATE DICE SET BET = BET+?, CURPOINT = CURPOINT-? WHERE ID = ? ";
		
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
	public boolean diceAf(String id, int win, int lose, int earned) { // ROLL IT ¹öÆ° ´©¸£¸é  È¸Â÷, °á°ú, Æ÷ÀÎÆ® ¾÷µ¥ÀÌÆ®
		
		int count = 0;
		String sql = " UPDATE DICE SET ROUND = ROUND+1, WIN = WIN+?, LOSE = LOSE+?, EARNED = EARNED+?, CURPOINT = CURPOINT+? WHERE ID = ? ";
		
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
	public DiceDto reDice(String id) { // »õ·Î°íÄ§ÀÌ³ª reset ¹öÆ° ´©¸£¸é  °¡¿ëÆ÷ÀÎÆ® °»½Å À§ÇØ¼­ ÇØ´ç À¯ÀúÀÇ dice Å×ÀÌºí ·¹ÄÚµå ºÒ·¯¿È
		
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
>>>>>>> refs/remotes/origin/hs2
