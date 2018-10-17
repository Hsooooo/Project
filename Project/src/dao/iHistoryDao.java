package dao;

import java.util.List;

import dto.HistoryDto;
import dto.PagingBean;

public interface iHistoryDao {

	public boolean insertHis(HistoryDto dto);

	public List<HistoryDto> getBbsPagingList(PagingBean paging, String id);
	
	public List<HistoryDto> getRanklist();

}
