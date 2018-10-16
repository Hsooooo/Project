<%@page import="dao.DiceDao"%>
<%@page import="dao.iDiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String curpoint = request.getParameter("curpoint");
int cur = Integer.parseInt(curpoint);
iDiceDao dao = DiceDao.getInstance();
boolean addS = dao.diceAdd(id, cur);
if(addS){
	System.out.print("[DICE] diceAdd : 추가/업데이트 성공" );
	
	
} else {
	System.out.print("![DICE] diceAdd : 추가/업데이트 실패!");
}
%>     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diceAdd.jsp</title>
</head>
<body>
 </body>
</html> 