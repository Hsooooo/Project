package dto;

public class PagingUtil {
	public static PagingBean setPagingInfo(PagingBean paging) {
		
		paging.setCountPerPage(10);
		paging.setBlockCount(10);
		
		paging.setStartNum(paging.getTotalCount() -
				(paging.getNowPage()-1) * paging.getCountPerPage());
		
		return paging;
		
		
	}
}
