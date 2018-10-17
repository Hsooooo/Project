
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<%


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


dao.delBbs(b_seq);


%>
	<script type="text/javascript">
		
		location.href = "userbbs.jsp";
	</script>



</body>
</html>