<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bbswrite.jsp</title>

<!-- <style type="text/css">
.center{
	margin: auto;
	width: 60%;
	border: 3px solid #8ac007;
	padding: 10px;
}
input{
	size:50;
}
</style> -->

<link rel="stylesheet" type="text/css" href="./css/style3.css">

</head>
<body>

<%
Object ologin = session.getAttribute("login");
MemberDto mem = (MemberDto)ologin;
%>
<a href="logout.jsp">로그아웃</a>

<h1>글쓰기</h1>

<div class="center">

<form action="bbswriteAf.jsp" method="post">

<table border="1" class="specalt">
<col width="200"><col width="500"> 

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50" 
			value="<%=mem.getId() %>">
	</td>
</tr>	
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50" name="content"></textarea>		
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="글쓰기">
	</td>
</tr>

</table>

</form>

</div>

<a href="bbslist.jsp">글목록</a>


</body>
</html>












