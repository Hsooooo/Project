<%@page import="dao.iMemberDao"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

iMemberDao dao = MemberDao.getInstance();
MemberDto mem = dao.login(new MemberDto(id,pwd,null,null,0));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(mem != null && !mem.getId().equals("")){
	session.setAttribute("login", mem);
	session.setMaxInactiveInterval(30*60);
%>
<script type="text/javascript">
	
	location.href = "bbslist.jsp";
</script>
<% 
}else{
%>
	<script type="text/javascript">
		alert("ID or Password Check Please");
		location.href = "index.jsp";
	</script>

<%
}
%>
</body>
</html>