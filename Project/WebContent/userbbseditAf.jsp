
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<%

String title = request.getParameter("title");
String content = request.getParameter("content");
String b_seqS = request.getParameter("b_seq");
int b_seq = Integer.parseInt(b_seqS);

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
System.out.println(title);
System.out.println(content);
boolean isS = dao.updateBbs(title, content, b_seq);

if(isS){
%>
	<script type="text/javascript">
		
		location.href = "userbbsdetail.jsp?seq="+<%=b_seq%>;
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