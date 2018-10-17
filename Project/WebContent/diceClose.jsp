<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
<<<<<<< HEAD

String id = request.getParameter("id");
String totalpoint_ = request.getParameter("totalpoint");
int totalpoint = Integer.parseInt(totalpoint_);

iMemberDao dao = MemberDao.getInstance();
boolean updateS = dao.diceUpdate(id, totalpoint);

if(updateS){
	System.out.println("[MEMBER] diceUpdate : 포인트 동기화 완료(" + totalpoint + " 원)");

=======
String id = request.getParameter("id");
String totalpoint_ = request.getParameter("totalpoint");
int totalpoint = Integer.parseInt(totalpoint_);
iMemberDao dao = MemberDao.getInstance();
boolean updateS = dao.diceUpdate(id, totalpoint);
if(updateS){
	System.out.println("[MEMBER] diceUpdate : 포인트 동기화 완료(" + totalpoint + " 원)");
>>>>>>> refs/remotes/origin/hs2
} else {
	System.out.println("![MEMBER] diceUpdate : 포인트 동기화 실패!");	
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diceClose.jsp</title>
</head>
<body>

</body>
</html>