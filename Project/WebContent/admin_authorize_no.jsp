<%@page import="dao.AuthorizeDao"%>
<%@page import="dao.iAuthorizeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_authorize_no.jsp</title>
</head>
<body>
<%
//////////// status를 -1로 update하기.
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");


iAuthorizeDao dao = AuthorizeDao.getInstance();
boolean authNoS = dao.authNo(id);

if(authNoS){
	System.out.println("[AUTHORIZE] authNo update 성공");
} else {
	System.out.println("![AUTHORIZE] authNo update 실패!");

}

%>
</body>
</html>