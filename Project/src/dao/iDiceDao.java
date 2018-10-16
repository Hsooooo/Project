package dao;

import dto.DiceDto;

public interface iDiceDao {

	public boolean diceAdd(String id, int curpoint); 
	// 1. login.jsp(현재)나 메인에서 주사위로 넘어갈 때 member 테이블의 id와 point를 diceInit.jsp로 보냄 -> id와 point 받아서 dice 테이블에 insert or update함.
	// 2. 베팅 버튼 (1) insert or update. 게임 첫판일 때만 새 레코드 생성-이미 Init에서 만들어져서 넘어오므로, 이미 존재하는 경우 curpoint만 업데이트됨. 

	public boolean diceBet(String id, int bet); // 베팅 버튼 (2) update. curpoint에서 betpoint 차감 + bet 항목 업데이트
	
	public boolean diceAf(String id, int win, int lose, int earned); // roll 버튼 update. 회차 종료 후  결과  업데이트용
	
	public DiceDto reDice(String id); // 게임 뷰 새로고침 or reset 버튼 클릭시 현재 가용 포인트 갱신용.
	

	///+ BET, WIN, LOSE, EARNED 금액 누적되게 바꿈
}
