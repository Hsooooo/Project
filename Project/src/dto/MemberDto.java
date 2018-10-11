package dto;

import java.io.Serializable;

/*DROP TABLE MEMBER CASCADE CONSTRAINTS;

CREATE TABLE MEMBER ( ID VARCHAR2(50) PRIMARY KEY,
				PWD VARCHAR2(50) NOT NULL,
				NICKNAME VARCHAR2(100) NOT NULL,
				PHONE VARCHAR2(70) NOT NULL,
				POINT NUMBER(15),
				MONEY NUMBER(15),
				AUTH NUMBER(2));

SELECT * FROM MEMBER;
*/



	public class MemberDto implements Serializable  {
		
		private String id;
		private String pwd;
		private String nickname;
		private String phone;
		private int point;
		private int money;
		private int auth;
		
		
		public MemberDto(String id, String pwd, String nickname, String phone, int point, int money, int auth) {
			super();
			this.id = id;
			this.pwd = pwd;
			this.nickname = nickname;
			this.phone = phone;
			this.point = point;
			this.money = money;
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


		public int getPoint() {
			return point;
		}


		public void setPoint(int point) {
			this.point = point;
		}


		public int getMoney() {
			return money;
		}


		public void setMoney(int money) {
			this.money = money;
		}


		public int getAuth() {
			return auth;
		}


		public void setAuth(int auth) {
			this.auth = auth;
		}


		@Override
		public String toString() {
			return "MemberDto [id=" + id + ", pwd=" + pwd + ", nickname=" + nickname + ", phone=" + phone + ", point="
					+ point + ", money=" + money + ", auth=" + auth + "]";
		}

		
	}
