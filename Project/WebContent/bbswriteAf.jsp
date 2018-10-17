
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="dto.HistoryDto"%>
<%@page import="dao.HistoryDao"%>
<%@page import="dao.iHistoryDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<%
String id = request.getParameter("id");
String title = request.getParameter("title");
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
iBbsDao dao = BbsDao.getInstance();
iHistoryDao hdao = HistoryDao.getInstance();
iMemberDao mdao = MemberDao.getInstance();

boolean isS = dao.insertBbs(new BbsDto(id,title,content));
boolean isS2 = hdao.insertHis(new HistoryDto(0,id,6,0,10,""));
MemberDto dto = mdao.getMember(id);
System.out.println(dto.getPoint());
mdao.pointUpd(id, dto.getPoint() + 10);
dto = mdao.getMember(id);
session.setAttribute("login", dto);
session.setMaxInactiveInterval(30*60);
if(isS && isS2){
%>
	<script type="text/javascript">
		alert("10포인트가 적립되었습니다.")
		location.href = "userbbs.jsp";
	</script>

<% 
}else{
%>
	<script type="text/javascript">
		alert("다시 기입해주십시오");
		location.href = "userbbswrite.jsp";
	</script>
<%
}
%>

</body>
</html>