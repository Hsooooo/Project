package dto;

public class DiceDto {
	private String id; // 세션 id
	private int round; // 참여한 회차 수
	private int bet; // 배팅한 포인트
	private int win; 
	private int lose;
	private int earned; // 배당받은 포인트
	private int curpoint; // 현재 포인트
	
	public DiceDto(String id, int round, int bet, int win, int lose, int earned, int curpoint) {
		super();
		this.id = id;
		this.round = round;
		this.bet = bet;
		this.win = win;
		this.lose = lose;
		this.earned = earned;
		this.curpoint = curpoint;
	}
 	public String getId() {
		return id;
	}
 	public void setId(String id) {
		this.id = id;
	}
 	public int getRound() {
		return round;
	}
 	public void setRound(int round) {
		this.round = round;
	}
 	public int getBet() {
		return bet;
	}
 	public void setBet(int bet) {
		this.bet = bet;
	}
 	public int getWin() {
		return win;
	}
 	public void setWin(int win) {
		this.win = win;
	}
 	public int getLose() {
		return lose;
	}
 	public void setLose(int lose) {
		this.lose = lose;
	}
 	public int getEarned() {
		return earned;
	}
 	public void setEarned(int earned) {
		this.earned = earned;
	}
 	public int getCurpoint() {
		return curpoint;
	}
 	public void setCurpoint(int curpoint) {
		this.curpoint = curpoint;
	}
 	@Override
	public String toString() {
		return "DiceDto [id=" + id + ", round=" + round + ", bet=" + bet + ", win=" + win + ", lose=" + lose
				+ ", earned=" + earned + ", curpoint=" + curpoint + "]";
	}
	
	
	
}
