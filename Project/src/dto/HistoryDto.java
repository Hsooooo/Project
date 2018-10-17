package dto;
/*
DROP TABLE HISTORY
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_HIS;

CREATE TABLE HISTORY(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	KIND NUMBER(8) NOT NULL,
	BET NUMBER(15),
	EARNED NUMBER(20) NOT NULL,
	WDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_HIS
START WITH 1 INCREMENT BY 1;

ALTER TABLE HISTORY
ADD CONSTRAINT FK_HISTORY_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
*/
public class HistoryDto {
	int seq;
	String id;
	int kind; //1 -> Base// 2-> dice// 3->even// 4->up/down // 5->comment // 6->bbs
	int bet;
	int earned;
	String wdate;
	
	public HistoryDto() {
		
	}

	public HistoryDto(int seq, String id, int kind,int bet, int earned, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.kind = kind;
		this.bet = bet;
		this.earned = earned;
		this.wdate = wdate;
	}

	public int getBet() {
		return bet;
	}

	public void setBet(int bet) {
		this.bet = bet;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getEarned() {
		return earned;
	}

	public void setEarned(int earned) {
		this.earned = earned;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
	
	

}
