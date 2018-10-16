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
	public boolean addRow(String id) { // 마이페이지 들어왔을 때
		
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
	public boolean fillMoney(String id, int fill_money) { // 테이블에 FILL_MONEY 넣기. status=0(대기중)으로 바꾸고 충전요청금액만 업데이트.
	
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
	public boolean toMoney(String id, int to_money) { // 테이블에 TO_MONEY 넣기. status=0(대기중)으로 바꾸고 환전요청금액만 업데이트.
		
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
	public boolean authNo(String id) { // 거절
		
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
	public boolean authOk(String id, int status) { // 승인하고  금액 0으로 리셋. 완료시 [MEMBER]로 MONEY 업데이트. 
	
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
	public AuthorizeDto getRow(String id) { // 조회
		
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