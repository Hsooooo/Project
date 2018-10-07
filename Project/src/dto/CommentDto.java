package dto;

public class CommentDto {
	private int seq;
	private String id;
	private String content;
	private int b_seq;
	private String wdate;
	
	
	public CommentDto() {
	}
	
	
	public CommentDto(int seq, String id, String content, int b_seq, String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.b_seq = b_seq;
		this.wdate = wdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	
	
}
