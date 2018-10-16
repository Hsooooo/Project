/*
DROP TABLE AUTHORIZE CASCADE CONSTRAINTS;
DROP SEQUENCE AUTHORIZE_SEQ;
CREATE TABLE AUTHORIZE 
(
	ID			VARCHAR2(20)	PRIMARY KEY,		
	UP_DATE		DATE			NOT NULL, 		
	FILL_MONEY	NUMBER			NOT NULL,		
	TO_MONEY	NUMBER			NOT NULL,		
	STATUS		NUMBER			NOT NULL 		
);


CREATE SEQUENCE AUTHORIZE_SEQ
START WITH 1
INCREMENT BY 1;


SELECT * FROM AUTHORIZE ;
*/
package dto;

public class AuthorizeDto {

	
	
	private String id; 	// 충전  환전 신청한 유저 ID
	private String up_date;	// 수정일자(최초 신청일 -> 관리자가 승인 버튼 클릭시 승인 일자로 업데이트)
	private int fill_money;	// 충전할 MONEY
	private int to_money;	// POINT -> MONEY로 환전할 금액
	private int status;	// status =9 초기화(처음 진입시) =0 대기중,  =1 승인,  =-1 거절
	
	
	public AuthorizeDto(String id, String up_date, int fill_money, int to_money, int status) {
		super();

		this.id = id;
		this.up_date = up_date;
		this.fill_money = fill_money;
		this.to_money = to_money;
		this.status = status;
	}


	

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getUp_date() {
		return up_date;
	}


	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}


	public int getFill_money() {
		return fill_money;
	}


	public void setFill_money(int fill_money) {
		this.fill_money = fill_money;
	}


	public int getTo_money() {
		return to_money;
	}


	public void setTo_money(int to_money) {
		this.to_money = to_money;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "AuthorizeDto [id=" + id + ", up_date=" + up_date + ", fill_money=" + fill_money
				+ ", to_money=" + to_money + ", status=" + status + "]";
	}
	
	
	
	
}
