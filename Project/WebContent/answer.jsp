<%@page import="dto.CsBbsDto"%>
<%@page import="dao.CsBbsDao"%>
<%@page import="dao.iCsBbsDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    
<%
request.setCharacterEncoding("utf-8");
%>    
<!doctype html>
<html>
<head>
<!-- Basic Page Needs
    ================================================== -->
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>유저 게시판</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="css/bootstrap.css?ver=1"> 

<link rel="stylesheet" type="text/css" href="css/font-awesome.css">

<!-- Slider
    ================================================== -->
<link href="css/owl.carousel.css" rel="stylesheet" media="screen">
<link href="css/owl.theme.css" rel="stylesheet" media="screen">
<link href="css/animate.css" rel="stylesheet" media="screen">

<style type="text/css">
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
.bd .bg_f_f9 {
    background: -webkit-gradient(linear,0% 0%,0% 100%,from(#FFF),to(#F9F9F9));
    background: linear-gradient(to bottom,#FFF 0%,#F9F9F9 100%);
}
.fr{
	float: right;
}
.fl{
	float: left;
}

</style>
<!-- Stylesheet
    ================================================== -->
 <link rel="stylesheet" type="text/css"  href="style.css?ver=2">
<link href='https://fonts.googleapis.com/css?family=PT+Serif:400,400i,700|Montserrat:100,200,300,300i,400,500,600,700,800,900' rel='stylesheet' type='text/css'>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
<!-- Navigation
    ==========================================-->
<nav id="top-menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="loginindex.jsp"><img src="img/logo-top.png" class="img-responsive"><span>Grit</span></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
      
      <!--nav icon--> 
      <a id="nav-icon"> <span></span> <span></span> <span></span> </a> 
      <!--nav icon end-->
      
      <ul id="nav-top" class="nav navbar-nav navbar-right">
        <li><a href="#" class="page-scroll">Home</a></li>
        <li><a href="mypage.jsp" class="page-scroll">MyPage</a></li>
        <li><a href="userbbs.jsp" class="page-scroll">Community</a></li>
        <!-- <li><a href="#" id="accountBtn" class="page-scroll" data-target="myModal">Account</a></li> --><!--  <-- 모달 창 띄우는 줄 -->
        <li><a href="logout.jsp" class="page-scroll">Logout</a></li>
      
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<!-- banner Page
    ==========================================-->
<div id="page-banner" style="background-image: url(img/photo-typo2.jpg);">
  <div class="content  wow fdeInUp">
    <div class="container ">
      <h1>유저 게시판</h1>
    </div>
  </div>
</div>
<!--page body-->

<div id="page-body">
  <div class="container">
  <div class="row"> 
      <!--blog posts container-->
      <div class="col-md-offset-1 col-md-9 page-block">
        

<h2>목록</h2>



<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

iCsBbsDao dao = CsBbsDao.getInstance();
CsBbsDto dto = dao.getBbs(seq);

request.setAttribute("dto", dto);
%>
<h1>부모글</h1><br>
<br>

<table class="table">
<col width="200"><col width="500">

<tr>
	<td>Writer</td>
	<td><%=dto.getId() %></td>
<tr>
<tr>
	<td>Title</td>
	<td><%=dto.getTitle() %></td>
</tr>
<tr>
	<td>작성일</td>
	<td><%=dto.getWdate() %></td>
</tr>
<tr>
	<td>조회수</td>
	<td><%=dto.getReadcount() %></td>
</tr>
<tr>
	<td>info</td>
	<td><%=dto.getRef() %>-<%=dto.getStep() %>-<%=dto.getDepth() %></td>
</tr>
<tr>
	<td colspan="2">Content</td>
</tr>
<tr>
	<td colspan="2">
		<textarea rows="25" cols="45" id="content" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>
</table>
</div>
</div>
</div>
</div>
<hr>


<!--page body-->

<div id="page-body">
  <div class="container">
  <div class="row"> 
      <!--blog posts container-->
      <div class="col-md-offset-1 col-md-9 page-block">
<div class="center">
<form id="insertFrm" action="answerAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
<h3>답글</h3>
<table class="table">
<col width="200"><col width="500">
<tr>
	<td>ID</td>
	<td>
		<input type="text" class="input-sm" id="id" name="id" size="50" value="<%=mem.getId() %>" readOnly>
	</td>
</tr>
<tr>
	<td>Title</td>
	<td>
		<input type="text" class="input-sm" id="title" name="title" size="50">
	</td>
</tr>
<tr>
	<td colspan="2">Content</td>
</tr>
<tr>
	<td colspan="2">
		<textarea rows="25" cols="45" id="content" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="답글 추가">
	</td>
</tr>
</table>
<input type="hidden" id="chk">
</form>
</div>
</div>
</div>
</div>
</div>
<a href="bbslist.jsp">글목록</a>

</body>
</html>