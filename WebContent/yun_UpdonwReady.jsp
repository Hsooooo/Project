<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%

MemberDto mem = (MemberDto)session.getAttribute("login");

if(mem == null) {
%>
<script type="text/javascript">
alert("로그아웃됬습니다. 다시로그인해주세요.");
location.href="index.jsp";
</script>
<%}else{
System.out.println("yun_UdonwReady.jsp dto = " + mem.toString());
}
%>
<h6>현재내정보:<%=mem.toString() %></h6>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<button onclick="fun(this)" value="start">게임시작!</button>
<button>게임방법</button>
<button>나가기</button>

<script type="text/javascript">
	function fun(val){
		if(val.value == "start"){
			alert("dd");
			location.href="yun_Updown.jsp";
		}
	}
</script>
</body>
</html>