package dao;

import dto.DiceDto;

public interface iDiceDao {
	public boolean diceAdd(String id, int curpoint); //  베팅 버튼 누르면 (1) merge. 게임 첫판일 때만 새 레코드 생성, 이미 존재하는 경우 curpoint만 업데이트됨. 
 	public boolean diceBet(String id, int bet); // 베팅 버튼 누르면 (2) update. curpoint에서 betpoint 차감 + bet 항목 업데이트
	
	public boolean diceAf(String id, int win, int lose, int earned); // roll 버튼 누르면 update. 회차 종료 후 결과  업데이트용
	
	public DiceDto reDice(String id); // 게임 뷰 새로고침 or reset 버튼 클릭시 현재 가용 포인트 갱신용.
}
