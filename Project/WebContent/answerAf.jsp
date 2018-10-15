<%@page import="dto.CsBbsDto"%>
<%@page import="dao.iCsBbsDao"%>
<%@page import="dao.CsBbsDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");
System.out.println(id + ", " + title + ", " + content);
iCsBbsDao dao = CsBbsDao.getInstance();
boolean isS = dao.answer(seq, new CsBbsDto(id,title,content));
if(isS){
%>
<script type="text/javascript">
	
	location.href = "cs_bbs.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	alert("답글 입력 실패");
	location.href = "cs_bbs.jsp";
</script>

<%} %>
</body>
</html>