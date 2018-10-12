package dao;

import java.util.List;

import dto.BbsDto;
import dto.PagingBean;

public interface iBbsDao {
	public List<BbsDto> getBbsList();
	public boolean insertBbs(BbsDto dto);
	public BbsDto getBbs(int seq); 
	public void addRead(int seq);
	public void delBbs(int seq);
	public boolean updateBbs(String title,String content, int seq);
	public List<BbsDto> myBbsList(String id);
	public List<BbsDto> getBbsPagingList(PagingBean paging, String searchWord);
}
