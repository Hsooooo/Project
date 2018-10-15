<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
String _result = request.getParameter("result");
System.out.println("yun_Updown.DB.jsp _result = " + _result);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(_result.equals("win")){
	mem.setPoint(mem.getPoint()+9000);
	System.out.println("win mem.tostring" + mem.toString());
}else if(_result.equals("defeated")){
	mem.setPoint(mem.getPoint()-10000);
	System.out.println("defeated mem.tostring" + mem.toString());
}
iMemberDao dao = MemberDao.getInstance();
mem = dao.money_Update(mem);

//System.out.println("yun_update.DB mem = " + mem.toString());



session.removeAttribute("login");
System.out.println("삭제가안되나");
// 기존에있는 내정보 를 삭제하고
session.setAttribute("login", mem);
// 새롭게 가져온 내저옵를 다시 쏴준다.

%>
</body>
</html>