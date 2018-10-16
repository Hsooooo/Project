package dao;

import java.util.List;

import dto.AuthorizeDto;

public interface iAuthorizeDao {
	
	public boolean addRow(String id);
	
	public boolean fillMoney(String id, int fill_money); // ���� �ݾ� �Է� �� ���� ��ư ������ �� �߰� + status 0(���δ����)���� ����. 

	public boolean toMoney(String id, int to_money); // ���� �ݾ� �Է� �� ���� ��ư ������ �� �߰� + status 0(���δ����)���� ����. 

	
	public List<AuthorizeDto> getBbsList(); // �����ڸ�� ����/ȯ�� �信 ����Ʈ �Ѹ���
	
	public boolean authNo(String id); 
	
	public boolean authOk(String id, int status);
	
	public AuthorizeDto getRow(String id); // ���λ��� ��ȸ��
	
	
	////////////////
	/// ó�� �ε������� 9�� ����. ���� , ȯ�� ��ư ������ FILL_MONEY, TO_MONEY�� �� ����, STATUS 0���� �ٲ�.
	
	/// �����ڰ� FILL_MONEY �����ϸ�  STATUS 1�� �ٲ� �� MEMBER�� �ݾ� ������Ʈ�ϰ� FILL_MONEY 0���� ����, 
	//        TO_MONEY �����ϸ� STATUS 2�� �ٲ� �� �ݾ� ������Ʈ�ϰ� TO_MONEY 0���� ����, 
	//        �����ϸ� -1�� ����. 
	
}