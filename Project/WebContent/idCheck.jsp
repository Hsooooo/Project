<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = request.getParameter("id");

boolean find = false;
String findId = "";

iMemberDao dao = MemberDao.getInstance();
boolean isS = dao.idCheck(id);
String msg;
if(isS == true){
	msg = "NO";
}else {
	msg = "OK";
}

%>

<%=msg%>