package dao;

import dto.DiceDto;

public interface iDiceDao {
	public boolean diceAdd(String id, int curpoint); //  ���� ��ư ������ (1) merge. ���� ù���� ���� �� ���ڵ� ����, �̹� �����ϴ� ��� curpoint�� ������Ʈ��. 
 	public boolean diceBet(String id, int bet); // ���� ��ư ������ (2) update. curpoint���� betpoint ���� + bet �׸� ������Ʈ
	
	public boolean diceAf(String id, int win, int lose, int earned); // roll ��ư ������ update. ȸ�� ���� �� ���  ������Ʈ��
	
	public DiceDto reDice(String id); // ���� �� ���ΰ�ħ or reset ��ư Ŭ���� ���� ���� ����Ʈ ���ſ�.
}
