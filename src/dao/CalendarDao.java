package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.CalendarDto;

public class CalendarDao implements iCalendar {
	private static CalendarDao calendarDao = new CalendarDao();
	
	private CalendarDao() {
		DBConnection.initConnect();
	}
	
	public static CalendarDao getInstance() {
		return calendarDao;
	}

	@Override
	public List<CalendarDto> getCalendarList(String id, String yyyyMM) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				+ " FROM ( "
				+ " 	   SELECT ROW_NUMBER() OVER(PARTITION BY SUBSTR(RDATE, 1, 8) ORDER BY RDATE ASC) RN, "
				+ " 		SEQ, ID, TITLE, CONTENT, RDATE, WDATE "
				+ "			FROM CALENDAR "
				+ "			WHERE ID=? AND SUBSTR(RDATE, 1, 6)=?) "
				+ " WHERE RN BETWEEN 1 AND 5 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CalendarDto> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getCalendarList Success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id.trim());
			psmt.setString(2, yyyyMM.trim());
			System.out.println("2/6 getCalendarList Success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getCalendarList Success");
			
			while(rs.next()) {
				CalendarDto dto = new CalendarDto();
				dto.setSeq(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setRdate(rs.getString(5));
				dto.setWdate(rs.getString(6));
				
				list.add(dto);
			}
			System.out.println("4/6 getCalendarList Success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			System.out.println("getCalendarList Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}

	@Override
	public boolean insertPro(CalendarDto dto) {
		String sql = " INSERT INTO CALENDAR "
				+ " (SEQ, ID, TITLE, CONTENT, RDATE, WDATE) "
				+ " VALUES(SEQ_CAL.NEXTVAL, ?, ?, ? , ?, SYSDATE) ";

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
			psmt.setString(4, dto.getRdate());

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
}
