<%@page import="dao.AuthorizeDao"%>
<%@page import="dao.iAuthorizeDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
<<<<<<< HEAD

String id = request.getParameter("id");
String fill_money = request.getParameter("fill_money");
int f_money = Integer.parseInt(fill_money);

iAuthorizeDao dao = AuthorizeDao.getInstance();
boolean insertS = dao.fillMoney(id, f_money);
System.out.println(insertS);

if(insertS){
	System.out.println("[AUTHORIZE] fillMoney INSERT 성공");
} else {
	System.out.println("![AUTHORIZE] fillMoney INSERT 실패!");

=======
String id = request.getParameter("id");
String fill_money = request.getParameter("fill_money");
int f_money = Integer.parseInt(fill_money);
iAuthorizeDao dao = AuthorizeDao.getInstance();
boolean insertS = dao.fillMoney(id, f_money);
System.out.println(insertS);
if(insertS){
	System.out.println("[AUTHORIZE] fillMoney INSERT 성공");
} else {
	System.out.println("![AUTHORIZE] fillMoney INSERT 실패!");
>>>>>>> refs/remotes/origin/hs2
}
%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fillMoney.jsp</title>
</head>
<body>




</body>
</html>