package dto;

public class PagingBean {
	private int nowPage;		//���� ������ [1][2][3][4]
	private int startNum;		//���� �������� row number << [5][6] 7 [8][9] >>
	private int totalCount;		//�Խ����� �� �� ����
	private int countPerPage;	//�������� ������ �� ����
	private int blockCount;		//page ������ ��� ī��Ʈ		[1][2][3]
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public int getBlockCount() {
		return blockCount;
	}
	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}
	
	

}
