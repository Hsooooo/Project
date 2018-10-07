package dao;

import dto.MemberDto;

public interface iMemberDao {
	public boolean addMember(MemberDto dto);
	public boolean idCheck(String id);
	public MemberDto login(MemberDto dto);
	public boolean nickCheck(String nick);
	public boolean phoneCheck(String phone);
}
