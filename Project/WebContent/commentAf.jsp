<%@page import="dao.iCommentDao"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<%
String id = request.getParameter("id");
String sb_seq = request.getParameter("b_seq");
int b_seq = Integer.parseInt(sb_seq);
String content = request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
iCommentDao dao = CommentDao.getInstance();
dao.commentWrite(b_seq, id, content);
%>
<script type="text/javascript">
	location.href = "userbbsdetail.jsp?seq="+<%=b_seq%>;
</script>


</body>
</html>