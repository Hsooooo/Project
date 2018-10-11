package dao;

import dto.MemberDto;

public interface iMemberDao {
	public boolean addMember(MemberDto dto);
	public boolean idCheck(String id);
	public MemberDto login(MemberDto dto);
	public boolean nickCheck(String nick);
	public boolean phoneCheck(String phone);
	
	///////////////////////게임 종료시  member 테이블로 dice 게임 결과(최종 현재포인트) 업데이트 하기 위함
	public boolean diceClose(String id, int totalpoint);
}
