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

	
	
	private String id; 	// ����  ȯ�� ��û�� ���� ID
	private String up_date;	// ��������(���� ��û�� -> �����ڰ� ���� ��ư Ŭ���� ���� ���ڷ� ������Ʈ)
	private int fill_money;	// ������ MONEY
	private int to_money;	// POINT -> MONEY�� ȯ���� �ݾ�
	private int status;	// status =9 �ʱ�ȭ(ó�� ���Խ�) =0 �����,  =1 ����,  =-1 ����
	
	
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