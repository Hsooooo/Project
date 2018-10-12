<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String nick = request.getParameter("name");

boolean find = false;
String findNick = "";

iMemberDao dao = MemberDao.getInstance();
boolean isS = dao.nickCheck(nick);
String msg;
if(isS == true){
	msg = "NO";
}else {
	msg = "OK";
}

%>

<%=msg%>