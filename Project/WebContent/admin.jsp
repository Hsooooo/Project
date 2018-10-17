<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
<<<<<<< HEAD

Object ologin = session.getAttribute("login");
MemberDto mem = (MemberDto)ologin;


int auth = mem.getAuth();

if(auth==3){
	%>
	
	<script type="text/javascript">
	alert( "<%=mem.getId() %>님이 관리자모드로 접속했습니다.")
	</script>
	
	<% 
	} else {
	%>

	<script type="text/javascript">
	alert("!권한이 없습니다!");
	location.href = "index.jsp";
	</script>

<%
}
%>  


<h1>관리자모드</h1>

<button onclick = "location.href='admin_memberinfo.jsp'">회원정보 관리</button>
<br><br>
<button onclick = "location.href='admin_authorize.jsp'">충전/환전 관리</button>
<br><br>
<button>배팅내역 관리</button>
<br><br>
<button onclick = "location.href='index.jsp'">로그인 화면으로</button>
</body>
</html>
=======
 Object ologin = session.getAttribute("login");
MemberDto mem = (MemberDto)ologin;
 int auth = mem.getAuth();
 if(auth==3){
	%>
	
	
	<% 
	} else {
	%>
 	<script type="text/javascript">
	alert("!권한이 없습니다!");
	location.href = "index.jsp";
	</script>
 <%
}
%>  
 <h1>관리자모드</h1>
 <button onclick = "location.href='admin_memberinfo.jsp'">회원정보 관리</button>
<br><br>
<button onclick = "location.href='admin_authorize.jsp'">충전/환전 관리</button>
<br><br>
<button>배팅내역 관리</button>
<br><br>
<button onclick = "location.href='loginindex.jsp'">로그인 화면으로</button>
</body>
</html> 
>>>>>>> refs/remotes/origin/hs2
