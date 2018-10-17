package dao;

import java.util.List;

import dto.CsBbsDto;
import dto.PagingBean;

public interface iCsBbsDao {

	public List<CsBbsDto> getBbsList();

	public 	boolean insertBbs(CsBbsDto dto);

	public CsBbsDto getBbs(int seq);

	public void addRead(int seq);

	public void delBbs(int seq);

	public boolean updateBbs(String title, String content, int seq);

	public List<CsBbsDto> myBbsList(String id);

	public List<CsBbsDto> getBbsPagingList(PagingBean paging, String searchWord);

	public boolean answer(int seq, CsBbsDto bbs);
	public int getMyCsCount(String id);

}
