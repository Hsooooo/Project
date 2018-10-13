package dto;

import java.io.Serializable;

/*DROP TABLE MEMBER
CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
	ID VARCHAR2(50) PRIMARY KEY,
	PWD VARCHAR2(50) NOT NULL,
	NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) UNIQUE,
	AUTH NUMBER(1) NOT NULL
)*/


public class MemberDto implements Serializable {
	private String id;
	private String pwd;
	private String nickname;
	private String phone;
	private int auth;
	
	
	
	
	public MemberDto(String id, String pwd, String nickname, String phone, int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.phone = phone;
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", nickname=" + nickname + ", phone=" + phone + ", auth=" + auth
				+ "]";
	}
	
	
	
}
