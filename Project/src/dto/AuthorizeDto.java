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
<<<<<<< HEAD


CREATE SEQUENCE AUTHORIZE_SEQ
START WITH 1
INCREMENT BY 1;


SELECT * FROM AUTHORIZE ;
*/
package dto;

public class AuthorizeDto {

	
	
	private String id; 	// ì¶©ì „  í™˜ì „ ì‹ ì²­í•œ ìœ ì € ID
	private String up_date;	// ìˆ˜ì •ì¼ìž(ìµœì´ˆ ì‹ ì²­ì¼ -> ê´€ë¦¬ìžê°€ ìŠ¹ì¸ ë²„íŠ¼ í´ë¦­ì‹œ ìŠ¹ì¸ ì¼ìžë¡œ ì—…ë°ì´íŠ¸)
	private int fill_money;	// ì¶©ì „í•  MONEY
	private int to_money;	// POINT -> MONEYë¡œ í™˜ì „í•  ê¸ˆì•¡
	private int status;	// status =9 ì´ˆê¸°í™”(ì²˜ìŒ ì§„ìž…ì‹œ) =0 ëŒ€ê¸°ì¤‘,  =1 ìŠ¹ì¸,  =-1 ê±°ì ˆ
	
	
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
=======
CREATE SEQUENCE AUTHORIZE_SEQ
START WITH 1
INCREMENT BY 1;
SELECT * FROM AUTHORIZE ;
*/
package dto;

public class AuthorizeDto {

	
	
	private String id; 	// ÃæÀü  È¯Àü ½ÅÃ»ÇÑ À¯Àú ID
	private String up_date;	// ¼öÁ¤ÀÏÀÚ(ÃÖÃÊ ½ÅÃ»ÀÏ -> °ü¸®ÀÚ°¡ ½ÂÀÎ ¹öÆ° Å¬¸¯½Ã ½ÂÀÎ ÀÏÀÚ·Î ¾÷µ¥ÀÌÆ®)
	private int fill_money;	// ÃæÀüÇÒ MONEY
	private int to_money;	// POINT -> MONEY·Î È¯ÀüÇÒ ±Ý¾×
	private int status;	// status =9 ÃÊ±âÈ­(Ã³À½ ÁøÀÔ½Ã) =0 ´ë±âÁß,  =1 ½ÂÀÎ,  =-1 °ÅÀý
	
	
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
>>>>>>> refs/remotes/origin/hs2
