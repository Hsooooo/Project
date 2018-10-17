<%@page import="dao.AuthorizeDao"%>
<%@page import="dao.iAuthorizeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
<<<<<<< HEAD

String id = request.getParameter("id");
String to_money_ = request.getParameter("to_money");
int to_money = Integer.parseInt(to_money_);

System.out.println( "###toMoney####id : " + id + "to_money" + to_money);

iAuthorizeDao dao = AuthorizeDao.getInstance();

boolean insertS = dao.toMoney(id, to_money);

=======
String id = request.getParameter("id");
String to_money_ = request.getParameter("to_money");
int to_money = Integer.parseInt(to_money_);
System.out.println( "###toMoney####id : " + id + "to_money" + to_money);
iAuthorizeDao dao = AuthorizeDao.getInstance();
boolean insertS = dao.toMoney(id, to_money);
>>>>>>> refs/remotes/origin/hs2
if(insertS){
	System.out.println("[AUTHORIZE] toMoney INSERT 성공");
}else{
	System.out.println("![AUTHORIZE] toMoney INSERT 실패!");
	
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>toMoney.jsp</title>
</head>
<body>

</body>
</html>