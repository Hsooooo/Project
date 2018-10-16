package dao;

import java.util.List;

import dto.AuthorizeDto;

public interface iAuthorizeDao {
	
	public boolean addRow(String id);
	
	public boolean fillMoney(String id, int fill_money); // 충전 금액 입력 후 충전 버튼 누르면 행 추가 + status 0(승인대기중)으로 셋팅. 

	public boolean toMoney(String id, int to_money); // 충전 금액 입력 후 충전 버튼 누르면 행 추가 + status 0(승인대기중)으로 셋팅. 

	
	public List<AuthorizeDto> getBbsList(); // 관리자모드 충전/환전 뷰에 리스트 뿌리기
	
	public boolean authNo(String id); 
	
	public boolean authOk(String id, int status);
	
	public AuthorizeDto getRow(String id); // 승인상태 조회용
	
	
	////////////////
	/// 처음 로드했을때 9로 셋팅. 충전 , 환전 버튼 누르면 FILL_MONEY, TO_MONEY에 값 들어가고, STATUS 0으로 바뀜.
	
	/// 관리자가 FILL_MONEY 승인하면  STATUS 1로 바꾼 후 MEMBER에 금액 업데이트하고 FILL_MONEY 0으로 리셋, 
	//        TO_MONEY 승인하면 STATUS 2로 바꾼 후 금액 업데이트하고 TO_MONEY 0으로 리셋, 
	//        거절하면 -1로 셋팅. 
	
}
