<%@page import="dao.DiceDao"%>
<%@page import="dao.iDiceDao"%>
<%@page import="model.MemberDto"%>
<%@page import="model.DiceDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

String win_ = request.getParameter("win");
int win = Integer.parseInt(win_);

String lose_ = request.getParameter("lose");
int lose = Integer.parseInt(lose_);

String earned_ = request.getParameter("earned");
int earned = Integer.parseInt(earned_);

iDiceDao dice = DiceDao.getInstance();
boolean b = dice.diceAf(id, win, lose, earned);


if(b){
	System.out.println("[DICE] diceAf : 회차 업데이트 성공 ! (id : " + id + " win : " + win + " lose : " + lose + " earned : " + earned +")" );

	
} else {
	System.out.println("!![DICE] diceAf : 회차 업데이트 실패 !!");
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diceBetAf.jsp</title>
</head>
<body>

</body>
</html>