<%@page import="dao.DiceDao"%>
<%@page import="dao.iDiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

String betpoint = request.getParameter("betpoint");
int bet = Integer.parseInt(betpoint);


iDiceDao dao = DiceDao.getInstance();
boolean betS = dao.DiceBet(id, bet);


if(betS){
	System.out.print("id : " + id + " betpoint : " + bet + "원 업데이트 성공" );
	
	
} else {
	System.out.print("!!주사위 배팅 실패!!");
}
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diceBet.jsp</title>
</head>
<body>

</body>
</html>