package dao;

import dto.DiceDto;

public interface iDiceDao {
	public boolean DiceAdd(String id, int curpoint); //  ���� ��ư ������ (1) merge. ���� ù���� ���� �� ���ڵ� ����, �̹� �����ϴ� ��� curpoint�� ������Ʈ��. 
 	public boolean DiceBet(String id, int bet); // ���� ��ư ������ (2) update. curpoint���� betpoint ���� + bet �׸� ������Ʈ
	
	public boolean DiceAf(String id, int win, int lose, int earned); // roll ��ư ������ update. ȸ�� ���� �� ���  ������Ʈ��
	
	public DiceDto ReDice(String id); // ���� �� ���ΰ�ħ or reset ��ư Ŭ���� ���� ���� ����Ʈ ���ſ�.
}
