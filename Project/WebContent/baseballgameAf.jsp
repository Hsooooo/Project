<%@page import="dao.HistoryDao"%>
<%@page import="dto.HistoryDto"%>
<%@page import="dao.iHistoryDao"%>
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
iHistoryDao hdao = HistoryDao.getInstance();
MemberDto mem2 = dao.getMember(mem.getId());
int point = mem.getPoint();
int rate = 0;
int earend;
switch(count){
	case 0:
		rate = 50;	//1회차 50배
		break;
	case 1:
		rate = 30;	//2회차 30배
		break;
	case 2:
		rate = 20;	//3회차 20배
		break;
	case 3:
		rate = 10;	//4회차 10배
		break;
	case 4:
		rate = 5;	//5회차 5배
		break;
	case 5:
		rate =  2;	//6회차 2배
		break;
	case 6:
		rate =  1;	//7회차 원금
		break;
	
	case 9:
		rate = 0;	//원금 손실
		break;
}
int originMoney = mem2.getPoint();
earend = 0;
if(count == 7){
	earend = (betpoint / 2) - betpoint;
}else if(count ==8){
	earend = (betpoint / 5) - betpoint;
}else{
	if(rate == 0){
		earend = (betpoint * rate) - betpoint;
	}else{
		earend = (betpoint * rate);
	}
}
originMoney += earend;
dao.pointUpd(id, originMoney);
hdao.insertHis(new HistoryDto(0,mem.getId(),1,betpoint,earend,""));
mem2 = dao.refreshBet(id);
System.out.println(mem2.getPoint());
session.setAttribute("login", mem2);
%>
</body>
</html>