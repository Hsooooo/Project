package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BaseBallDao implements iBaseBallDao {

	private static BaseBallDao baseball = new BaseBallDao();

	private BaseBallDao() {
		DBConnection.initConnect();
	}

	public static BaseBallDao getInstance() {
		return baseball;
	}
	@Override
	public void newRound(String str) {
		String sql = " INSERT INTO BASEBALL "
				+ " (ROUND, STR) "
				+ " VALUES(SEQ_BASE.NEXTVAL, ? ) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 addBbs Succcess");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 addBbs Succcess");
			System.out.println(sql);
			psmt.setString(1, str);
			
			count = psmt.executeUpdate();
			System.out.println("3/6 addBbs Succcess");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("addBbs Fail");
		} finally {
			DBClose.close(psmt, conn, null);
		}
		
	}

	@Override
	public String[] getNum(int a) {
		String sql = " SELECT STR "
				+ " FROM BASEBALL " + "WHERE ROUND = "+a;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		String b[] = new String[4];

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getBbsList Success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getBbsList Success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getBbsList Success");
			String c = "";
			while (rs.next()) {
				c = rs.getString(1);
				for(int i=0; i< c.length(); i++) {
					char[] charArray = c.toCharArray();
					b[i] = String.valueOf(charArray[i]);
				}
			}
			

			System.out.println("4/6 getBbsList Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("getBbsList Fail");
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return b;
	}

}
