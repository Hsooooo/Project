package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.AuthorizeDto;

public class AuthorizeDao implements iAuthorizeDao {

private static AuthorizeDao authorizeDao = new AuthorizeDao();
	
private AuthorizeDao() {
		DBConnection.initConnect();
	}
	
	public static AuthorizeDao getInstance() {
		return authorizeDao;
	}
	
	@Override
<<<<<<< HEAD
	public boolean addRow(String id) { // ë§ˆì´íŽ˜ì´ì§€ ë“¤ì–´ì™”ì„ ë•Œ
		
		int count = 0;
		String sql =   " MERGE INTO AUTHORIZE USING DUAL ON(ID = ?) WHEN MATCHED THEN "
				+ " UPDATE SET UP_DATE=SYSDATE "
				+ " WHEN NOT MATCHED THEN "
				+ " INSERT (ID, UP_DATE, FILL_MONEY, TO_MONEY, STATUS) "
				+ " VALUES(?, SYSDATE, 0, 0, 9) ";
		
				
				/*" INSERT INTO AUTHORIZE(ID, UP_DATE, FILL_MONEY, TO_MONEY, STATUS) "
				+ " VALUES(?, SYSDATE, 0, 0, 9) ";
		*/
		 
		Connection conn = null;
		PreparedStatement psmt = null;
	
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 rowAdd Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 rowAdd Success");
			psmt.setString(1, id);
			psmt.setString(2, id);
			
			System.out.println("3/6 rowAdd Success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 rowAdd Success");
			
		} catch (Exception e) {
			System.out.println("rowAdd failed : " + e);
			
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false ;
	
	}
	
	@Override
	public boolean fillMoney(String id, int fill_money) { // í…Œì´ë¸”ì— FILL_MONEY ë„£ê¸°. status=0(ëŒ€ê¸°ì¤‘)ìœ¼ë¡œ ë°”ê¾¸ê³  ì¶©ì „ìš”ì²­ê¸ˆì•¡ë§Œ ì—…ë°ì´íŠ¸.
	
		int count =0;
		
		String sql = " UPDATE AUTHORIZE SET UP_DATE=SYSDATE, FILL_MONEY=?, STATUS=0  WHERE ID=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 update fillMoney (AUTHORIZE) success"); 
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 update fillMoney (AUTHORIZE) success"); 
			
			psmt.setInt(1, fill_money);
			psmt.setString(2, id);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 update fillMoney (AUTHORIZE) success"); 
			
			
		} catch (Exception e) {

			System.out.println("update fillMoney (AUTHORIZE) failed : " + e); 
			
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	@Override
	public boolean toMoney(String id, int to_money) { // í…Œì´ë¸”ì— TO_MONEY ë„£ê¸°. status=0(ëŒ€ê¸°ì¤‘)ìœ¼ë¡œ ë°”ê¾¸ê³  í™˜ì „ìš”ì²­ê¸ˆì•¡ë§Œ ì—…ë°ì´íŠ¸.
		
		int count =0;
		
		String sql = " UPDATE AUTHORIZE SET UP_DATE=SYSDATE, TO_MONEY=?, STATUS=0  WHERE ID=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 update toMoney(AUTHORIZE) success"); 
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 update toMoney(AUTHORIZE) success"); 
			
			psmt.setInt(1, to_money);
			psmt.setString(2, id);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 update toMoney(AUTHORIZE) success"); 
			
			
		} catch (Exception e) {

			System.out.println("update toMoney(AUTHORIZE) failed : " + e); 
			
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	
}

	@Override
	public List<AuthorizeDto> getBbsList() {
		
		String sql = " SELECT * FROM AUTHORIZE ORDER BY UP_DATE ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AuthorizeDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Succes");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");
			
			while (rs.next()) {
				AuthorizeDto dto = new AuthorizeDto(
						rs.getString(1), 
						rs.getString(2), 
						rs.getInt(3), 
						rs.getInt(4), 
						rs.getInt(5));
				
				list.add(dto);
			}
			System.out.println("4/6 getBbsList Success");
			
		} catch (Exception e) {
			System.out.println("getBbsList failed : " + e) ;
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}

	@Override
	public boolean authNo(String id) { // ê±°ì ˆ
		
		String sql = " UPDATE AUTHORIZE SET STATUS = -1 WHERE ID = ? ";
		
		int count = 0 ;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 authNo success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 authNo success");

			psmt.setString(1, id);
			System.out.println("3/6 authNo success");

			count = psmt.executeUpdate();
			System.out.println("4/6 authNo success");

		} catch (Exception e) {
			System.out.println("authNo failed : " + e);

		} finally {
			DBClose.close(psmt, conn, null);
		}
	
	
		return count > 0 ? true : false;
	}

	@Override
	public boolean authOk(String id, int status) { // ìŠ¹ì¸í•˜ê³   ê¸ˆì•¡ 0ìœ¼ë¡œ ë¦¬ì…‹. ì™„ë£Œì‹œ [MEMBER]ë¡œ MONEY ì—…ë°ì´íŠ¸. 
	
		String sql = " UPDATE AUTHORIZE SET UP_DATE=SYSDATE, FILL_MONEY = 0, TO_MONEY = 0, STATUS = ? WHERE ID = ? ";
		
		int count = 0 ;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 authOk success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 authOk success");

			psmt.setInt(1, status);
			psmt.setString(2, id);
			System.out.println("3/6 authOk success");

			count = psmt.executeUpdate();
			System.out.println("4/6 authOk success");

		} catch (Exception e) {
			System.out.println("authOk failed : " + e);

		} finally {
			DBClose.close(psmt, conn, null);
		}
	
	
		return count > 0 ? true : false;
	}

	@Override
	public AuthorizeDto getRow(String id) { // ì¡°íšŒ
		
		String sql = " SELECT * FROM AUTHORIZE WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs= null;
		AuthorizeDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getStatus success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getStatus success");
			
			psmt.setString(1, id);
			System.out.println("3/6 getStatus success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getStatus success");
		
			if(rs.next()) {
				dto = new AuthorizeDto(rs.getString(1), 
						rs.getString(2), 
						rs.getInt(3), 
						rs.getInt(4), 
						rs.getInt(5));
			}
		} catch (Exception e) {
			System.out.println("getStatus failed : " + e);
			
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}

	
}
=======
	public boolean addRow(String id) { // ¸¶ÀÌÆäÀÌÁö µé¾î¿ÔÀ» ¶§
		
		int count = 0;
		String sql =   " MERGE INTO AUTHORIZE USING DUAL ON(ID = ?) WHEN MATCHED THEN "
				+ " UPDATE SET UP_DATE=SYSDATE "
				+ " WHEN NOT MATCHED THEN "
				+ " INSERT (ID, UP_DATE, FILL_MONEY, TO_MONEY, STATUS) "
				+ " VALUES(?, SYSDATE, 0, 0, 9) ";
		
				
				/*" INSERT INTO AUTHORIZE(ID, UP_DATE, FILL_MONEY, TO_MONEY, STATUS) "
				+ " VALUES(?, SYSDATE, 0, 0, 9) ";
		*/
		 
		Connection conn = null;
		PreparedStatement psmt = null;
	
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 rowAdd Success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 rowAdd Success");
			psmt.setString(1, id);
			psmt.setString(2, id);
			
			System.out.println("3/6 rowAdd Success");
			
			count = psmt.executeUpdate();
			System.out.println("4/6 rowAdd Success");
			
		} catch (Exception e) {
			System.out.println("rowAdd failed : " + e);
			
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
		return count > 0 ? true : false ;
	
	}
	
	@Override
	public boolean fillMoney(String id, int fill_money) { // Å×ÀÌºí¿¡ FILL_MONEY ³Ö±â. status=0(´ë±âÁß)À¸·Î ¹Ù²Ù°í ÃæÀü¿äÃ»±Ý¾×¸¸ ¾÷µ¥ÀÌÆ®.
	
		int count =0;
		
		String sql = " UPDATE AUTHORIZE SET UP_DATE=SYSDATE, FILL_MONEY=?, STATUS=0  WHERE ID=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 update fillMoney (AUTHORIZE) success"); 
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 update fillMoney (AUTHORIZE) success"); 
			
			psmt.setInt(1, fill_money);
			psmt.setString(2, id);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 update fillMoney (AUTHORIZE) success"); 
			
			
		} catch (Exception e) {

			System.out.println("update fillMoney (AUTHORIZE) failed : " + e); 
			
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	@Override
	public boolean toMoney(String id, int to_money) { // Å×ÀÌºí¿¡ TO_MONEY ³Ö±â. status=0(´ë±âÁß)À¸·Î ¹Ù²Ù°í È¯Àü¿äÃ»±Ý¾×¸¸ ¾÷µ¥ÀÌÆ®.
		
		int count =0;
		
		String sql = " UPDATE AUTHORIZE SET UP_DATE=SYSDATE, TO_MONEY=?, STATUS=0  WHERE ID=? " ;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 update toMoney(AUTHORIZE) success"); 
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 update toMoney(AUTHORIZE) success"); 
			
			psmt.setInt(1, to_money);
			psmt.setString(2, id);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 update toMoney(AUTHORIZE) success"); 
			
			
		} catch (Exception e) {

			System.out.println("update toMoney(AUTHORIZE) failed : " + e); 
			
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	
}

	@Override
	public List<AuthorizeDto> getBbsList() {
		
		String sql = " SELECT * FROM AUTHORIZE ORDER BY UP_DATE ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<AuthorizeDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Succes");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");
			
			while (rs.next()) {
				AuthorizeDto dto = new AuthorizeDto(
						rs.getString(1), 
						rs.getString(2), 
						rs.getInt(3), 
						rs.getInt(4), 
						rs.getInt(5));
				
				list.add(dto);
			}
			System.out.println("4/6 getBbsList Success");
			
		} catch (Exception e) {
			System.out.println("getBbsList failed : " + e) ;
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return list;
	}

	@Override
	public boolean authNo(String id) { // °ÅÀý
		
		String sql = " UPDATE AUTHORIZE SET STATUS = -1 WHERE ID = ? ";
		
		int count = 0 ;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 authNo success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 authNo success");

			psmt.setString(1, id);
			System.out.println("3/6 authNo success");

			count = psmt.executeUpdate();
			System.out.println("4/6 authNo success");

		} catch (Exception e) {
			System.out.println("authNo failed : " + e);

		} finally {
			DBClose.close(psmt, conn, null);
		}
	
	
		return count > 0 ? true : false;
	}

	@Override
	public boolean authOk(String id, int status) { // ½ÂÀÎÇÏ°í  ±Ý¾× 0À¸·Î ¸®¼Â. ¿Ï·á½Ã [MEMBER]·Î MONEY ¾÷µ¥ÀÌÆ®. 
	
		String sql = " UPDATE AUTHORIZE SET UP_DATE=SYSDATE, FILL_MONEY = 0, TO_MONEY = 0, STATUS = ? WHERE ID = ? ";
		
		int count = 0 ;
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 authOk success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 authOk success");

			psmt.setInt(1, status);
			psmt.setString(2, id);
			System.out.println("3/6 authOk success");

			count = psmt.executeUpdate();
			System.out.println("4/6 authOk success");

		} catch (Exception e) {
			System.out.println("authOk failed : " + e);

		} finally {
			DBClose.close(psmt, conn, null);
		}
	
	
		return count > 0 ? true : false;
	}

	@Override
	public AuthorizeDto getRow(String id) { // Á¶È¸
		
		String sql = " SELECT * FROM AUTHORIZE WHERE ID = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs= null;
		AuthorizeDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getStatus success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getStatus success");
			
			psmt.setString(1, id);
			System.out.println("3/6 getStatus success");
			
			rs = psmt.executeQuery();
			System.out.println("4/6 getStatus success");
		
			if(rs.next()) {
				dto = new AuthorizeDto(rs.getString(1), 
						rs.getString(2), 
						rs.getInt(3), 
						rs.getInt(4), 
						rs.getInt(5));
			}
		} catch (Exception e) {
			System.out.println("getStatus failed : " + e);
			
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		
		return dto;
	}

	
}
>>>>>>> refs/remotes/origin/hs2
