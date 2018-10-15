package dao;

import java.util.List;

import dto.CommentDto;

public interface iCommentDao {
	public List<CommentDto> getCommentList(int seq);
	public void commentWrite(int seq,String id,String content);
	public int commentCount(int seq);
	public void commentDel(int seq);
}
