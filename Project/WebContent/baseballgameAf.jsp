<%@page import="dao.MemberDao"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.iMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
request.setCharacterEncoding("utf-8");
%>    
<%
int betpoint = Integer.parseInt(request.getParameter("point"));
String id = request.getParameter("id");
int count = Integer.parseInt(request.getParameter("count"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
	%>
	<script type="text/javascript">
		alert("Login Please");
		location.href = "index.jsp";
	</script>
	<%
	return;
}

mem = (MemberDto)ologin;
%>
<%
iMemberDao dao = MemberDao.getInstance();
int point = mem.getPoint();


switch(count){
	case 0:
		point += betpoint * 50;
		break;
	case 1:
		point += betpoint * 20;
		break;
	case 2:
		point += betpoint * 10;
		break;
	case 3:
		point += betpoint * 5;
		break;
	case 4:
		point += betpoint * 2;
		break;
	case 5:
		point += betpoint * 1;
		break;
	case 6:
		point += betpoint / 2;
		break;
	case 7:
		point += betpoint /5;
		break;
	case 8:
		point += betpoint /10;
		break;
	case 9:
		point += betpoint * 20;
		break;
}
dao.baseballUpd(id, point);
MemberDto mem2 = dao.refreshBet(id);
System.out.println(mem2.getPoint());
session.setAttribute("login", mem2);
%>
</body>
</html>