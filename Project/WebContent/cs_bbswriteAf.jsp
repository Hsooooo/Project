
<%@page import="dto.CsBbsDto"%>
<%@page import="dao.CsBbsDao"%>
<%@page import="dao.iCsBbsDao"%>
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
iCsBbsDao dao = CsBbsDao.getInstance();
boolean isS = dao.insertBbs(new CsBbsDto(id,title,content));

if(isS){
%>
	<script type="text/javascript">
		
		location.href = "cs_bbs.jsp";
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