package dao;

import dto.MemberDto;

public interface iMemberDao {
	public boolean addMember(MemberDto dto);
	public boolean idCheck(String id);
	public MemberDto login(MemberDto dto);
	public boolean nickCheck(String nick);
	public boolean phoneCheck(String phone);
	public void pointUpd(String id,int point);
	public MemberDto refreshBet(String id);
	public boolean diceClose(String id, int totalpoint);
	public MemberDto getMember(String id);
	public boolean diceUpdate(String id, int totalpoint);
	public MemberDto money_Update(MemberDto dto);
	public boolean toMoneyUpdate(String id, int to_money);
	public boolean fillMoneyUpdate(String id, int fill_money);
	public boolean moneyToPoint(String id, int to_point);
}
