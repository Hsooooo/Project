package dao;

import dto.MemberDto;

public interface iMemberDao {
	public boolean addMember(MemberDto dto);
	public boolean idCheck(String id);
	public MemberDto login(MemberDto dto);
	public boolean nickCheck(String nick);
	public boolean phoneCheck(String phone);
	
	///////////////////////게임 종료시  member 테이블로 dice 게임 결과(최종 현재포인트) 업데이트 하기 위함
	public boolean diceUpdate(String id, int totalpoint);
	
	//////////////////////관리자가 충전/환전 리스트에서 충전요청금액 승인시 money만 업데이트
	public boolean fillMoneyUpdate(String id, int fill_money);
	
	//////////////////////마이페이지 - 포인트로 전환하기 버튼 누르면 money, point 항목 업데이트
	public boolean moneyToPoint(String id, int to_point);
	
	/////////////////////관리자가 충전/환전 리스트에서 환전요청금액 승인 누르면 money 더하고, point 차감
	public boolean toMoneyUpdate(String id, int to_money);
}
