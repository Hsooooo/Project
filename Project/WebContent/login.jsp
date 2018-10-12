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
	
	location.href = "nologinindex.jsp";
	
	////////////////////////////
	<script type="text/javascript">
	alert("안녕하세요 <%=mem.getId() %> 님");
	var id = "<%=mem.getId() %>" ;
	var point = "<%=mem.getPoint() %>";

	var alldata0 = { "id" : id, "point" : point};

	$.ajax({
		
		url : "diceInit.jsp",
		type : "POST",
		data : alldata0,
		success : function (data) {
			alert("dice db에 추가/업데이트 완료!");
			location.href="diceGame.jsp";
				
		},
		error : function () {
			alert("dice db 추가/업데이트 에러!");
			location.href="index.jsp";
		}
	});
	///////////////////////////////////
	
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