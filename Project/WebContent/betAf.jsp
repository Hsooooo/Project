<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="dao.BaseBallDao"%>
<%@page import="dao.iBaseBallDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<%
int point = Integer.parseInt(request.getParameter("point"));
String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
<%
System.out.println(point);
iMemberDao dao = MemberDao.getInstance();
dao.baseballUpd(id, point);
MemberDto mem = dao.refreshBet(id);


session.setAttribute("login", mem);
session.setMaxInactiveInterval(30*60);

%>
</script>
</body>
</html>