package dao;

import dto.MemberDto;

public interface iMemberDao {
	public boolean addMember(MemberDto dto);
	public boolean idCheck(String id);
	public MemberDto login(MemberDto dto);
	public boolean nickCheck(String nick);
	public boolean phoneCheck(String phone);
	public void baseballUpd(String id,int point);
	public MemberDto refreshBet(String id);
	public boolean diceClose(String id, int totalpoint);
	public MemberDto getMember(String id);
}
