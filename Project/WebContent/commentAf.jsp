<%@page import="dto.HistoryDto"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="dao.HistoryDao"%>
<%@page import="dao.iHistoryDao"%>
<%@page import="dto.MemberDto"%>
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

iHistoryDao hdao = HistoryDao.getInstance();
iMemberDao mdao = MemberDao.getInstance();

boolean isS2 = hdao.insertHis(new HistoryDto(0,id,5,0,5,""));
MemberDto dto = mdao.getMember(id);
System.out.println(dto.getPoint());
mdao.pointUpd(id, dto.getPoint() + 5);
dto = mdao.getMember(id);
session.setAttribute("login", dto);
session.setMaxInactiveInterval(30*60);
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