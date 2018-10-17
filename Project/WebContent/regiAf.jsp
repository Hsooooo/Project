<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
    
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pw");
String nick = request.getParameter("name");
String phone = request.getParameter("phone");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regiAf.jsp</title>
</head>
<body>

<%
iMemberDao dao = MemberDao.getInstance();
System.out.println(id+","+pwd+","+nick+","+phone);
<<<<<<< HEAD
boolean isS = dao.addMember(new MemberDto(id,pwd,nick,phone,0,0,0));
=======
boolean isS = dao.addMember(new MemberDto(id,pwd,nick,phone,0,500,0));
>>>>>>> refs/remotes/origin/hs2

if(isS){
%>
	<script type="text/javascript">
		alert("성공적으로 가입했습니다.");
		location.href = "nologinindex.jsp";
	</script>

<% 
}else{
%>
	<script type="text/javascript">
		alert("다시 기입해주십시오");
		location.href = "regi.jsp";
	</script>
<%
}
%>

</body>
</html>