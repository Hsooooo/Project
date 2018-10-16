<%@page import="dao.AuthorizeDao"%>
<%@page import="dao.iAuthorizeDao"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_authorize_ok.jsp</title>
</head>
<body>
<%
////////////status를 1 or 2로 update하기.
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String fill_money_ = request.getParameter("fill_money");
int fill_money = Integer.parseInt(fill_money_);

String to_money_ = request.getParameter("to_money");
int to_money = Integer.parseInt(to_money_);

System.out.println("###authorize_ok### id : " + id + ", fill_money : " + fill_money + " , to_money : " +  to_money );


iAuthorizeDao auth = AuthorizeDao.getInstance();
iMemberDao mem = MemberDao.getInstance();

int status = 0;

if(to_money == 0){ // 환전요청금액이 0이다 = 충전하겠다. status = 0 ----> 1로 바꾸고, 금액을 0으로 리셋.

	status = 1;
	boolean okS = auth.authOk(id, status); // status = 1로 바꾸고  금액 0으로 리셋
	
		if(okS){  // 1. status = 1로 바꾸고  금액 0으로 리셋됐으면
		
		boolean fill_moneyS = mem.fillMoneyUpdate(id, fill_money); // 2. [MEMBER]로  money 업데이트.
		
			if(fill_moneyS){ // [MEMBER]에 MONEY 업데이트 완료시
				System.out.println("[AUTHORIZE] authOk status:" + status + ", fill_money : " + fill_money + ", to_money : "+ to_money );
				System.out.println("[MEMBER] fillMoneyUpdate 완료");
			} else {
				System.out.println("![MEMBER] fillMoneyUpdate 실패!");
			}
	
		} else { // status = 1로 바꾸고  금액 0으로 리셋 실패
		System.out.println("[AUTHORIZE] authOk 실패");
		}


} else if(fill_money == 0){ // 충전요청금액이 0이다 = 환전하겠다. status = 0 -----> 2로 바꾸고, 금액을 0으로 리셋.
	
	status = 2;
	boolean okS = auth.authOk(id, status); // 1. status =2로 바꾸고  금액 0으로 리셋
	System.out.println(okS);

	if(okS){
		
		
		boolean to_moneyS = mem.toMoneyUpdate(id, to_money); // 2. [MEMBER]로 money 업데이트.
			
			if(to_moneyS){ // [MEMBER]에 MONEY 업데이트 완료시
				System.out.println("[AUTHORIZE] authOk status:" + status + ", fill_money : " + fill_money + ", to_money : "+ to_money );
				System.out.println("[MEMBER] toMoneyUpdate 완료");
			} else {
				System.out.println("![MEMBER] toMoneyUpdate 실패!");
			} 
			
	} else { // status = 2로 바꾸고  금액 0으로 리셋 실패
			System.out.println("[AUTHORIZE] authOk 실패");
	}
			
}

	
%>
</body>
</html>