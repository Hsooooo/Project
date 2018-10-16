<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String to_point_ = request.getParameter("to_point");
int to_point = Integer.parseInt(to_point_.trim());

iMemberDao dao = MemberDao.getInstance();
boolean updateS = dao.moneyToPoint(id, to_point);

if(updateS){
	System.out.println("[MEMBER] moneyToPoint 업데이트 완료 ");
} else {
	System.out.println("![MEMBER] moneyToPoint 업데이트 실패!");
}



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>toPoint.jsp</title>
</head>
<body>

</body>
</html>