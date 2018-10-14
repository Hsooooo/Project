<%@page import="dao.iCommentDao"%>
<%@page import="dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<%

String com_seqS = request.getParameter("c_seq");
int com_seq = Integer.parseInt(com_seqS);
String bbs_seqS = request.getParameter("b_seq");
int bbs_seq = Integer.parseInt(bbs_seqS);
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
dao.commentDel(com_seq);

%>
<script type="text/javascript">
	location.href = "userbbsdetail.jsp?seq="+<%=bbs_seq%>;
</script>


</body>
</html>