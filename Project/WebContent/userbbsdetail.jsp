
<%@page import="dto.CommentDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.CommentDao"%>
<%@page import="dao.iCommentDao"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dto.PagingBean"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<%
int seq = Integer.parseInt(request.getParameter("seq"));
%>    
<%
iBbsDao dao = BbsDao.getInstance();
BbsDto dto = dao.getBbs(seq);
dao.addRead(seq);
iCommentDao c_dao = CommentDao.getInstance();
List<CommentDto> c_dto = c_dao.getCommentList(seq);
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
<link rel="stylesheet" type="text/css"  href="css/bootstrap.css"> 

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
<body class="page">
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
      <a class="navbar-brand" href="nologinindex.jsp"><img src="img/logo-top.png" class="img-responsive"><span>Grit</span></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
      
      <!--nav icon--> 
      <a id="nav-icon"> <span></span> <span></span> <span></span> </a> 
      <!--nav icon end-->
      
      <ul id="nav-top" class="nav navbar-nav navbar-right">
		   <li><a href="index.html" class="page-scroll">Home</a></li>
			<li><a href="page.html" class="page-scroll">Page</a></li>
			<li><a href="blog.html" class="page-scroll">Blog</a></li>
			<li><a href="contact.html" class="page-scroll">Contact</a></li>
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
        



<div class="center">
<form id="insertFrm" action="bbsEdit.jsp" method="post">
<input type="hidden" id="seq" name="seq" value="<%=dto.getSeq() %>">
<h2>게시글</h2>
<table class="table">
<tr>
	<td><b>아이디</b></td>
	<td>
		<input type="text" class="input-sm" id="id" name="id" size="20" value="<%=dto.getId() %>" readOnly>
	</td>
</tr>
<tr>
	<td><b>작성일</b></td>
	<td>
		<input type="text" class="input-sm" id="id" name="id" size="20" value="<%=dto.getWdate() %>" readOnly>
	</td>
</tr>
<tr>
	<td>조회수</td>
	<td>
		<input type="text" class="input-sm" id="id" name="id" size="20" value="<%=dto.getReadcount() %>" readOnly>
	</td>
</tr>
<tr>
	<td>제목</td>
	<td>
		<input type="text" class="input-sm col-xs-4" id="title" name="title" size="20" value="<%=dto.getTitle() %>"  style="width:450px" readOnly>
	</td>
</tr>


<tr>
	<td colspan="2">내용</td>
</tr>
<tr>
	<td colspan="2">
		<textarea rows="25" cols="65" id="content" name="content" readOnly><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		
		
		<button type="button" class="btn btn-default btn-sm" id="editBtn">수정 </button>
		<button type="button" class="btn btn-default btn-sm" id="delBtn">삭제</button>
	</td>
</tr>
</table>




</form>
</div>
<div class="center">
<table class="table">
<col width="50"><col width="500"><col width="250"><col width="150">

<%
if(c_dto ==null || c_dto.size() == 0){
	%>
	<tr>
		<td colspan="4">작성된 댓글이 없습니다.</td>
	</tr>
	<%
}else{
	for(int i=0;i<c_dto.size();i++){
		CommentDto c_dt = c_dto.get(i);
		%>
		<tr>
			<td><b><%=c_dt.getId() %></b></td>
			<td>
				<input type="hidden" id="comseq" name="comseq" value="<%=c_dt.getSeq() %>">
				<%=c_dt.getContent() %>
			</td>
			<td><%=c_dt.getWdate() %></td>
			<td>
				<%if(c_dt.getId().equals(mem.getId())){ %>
				<a href="delcomment.jsp?c_seq=<%=c_dt.getSeq() %>&b_seq=<%=dto.getSeq() %>" id="delBtn"><span class="glyphicon glyphicon-remove" id="delBtn"></span></a>
				<%} %>
			</td>
		</tr>
		<%
	}
}
%>
<tr>
	<td><%=mem.getId() %></td>
	<td colspan="2"><input type="text" class="input-sm col-5" id="comment" name="comment" style="width:350px"></td>
	
	<td><button type="button" id="com_send" name="com_send" class="btn btn-default btn-sm">작성</button>
</tr>

</table>
</div>
<div>
<div class="fl">
	
      <button type="button" class="btn btn-default btn-sm" onclick="location.href='userbbs.jsp'">Go List</button>
</div>
		
</div>
	<div class="fr">
		<button id="writeBtn" name="writeBtn"  class="btn btn-default btn-sm">
				<span class="glyphicon glyphicon-pencil"></span>글쓰기
		</button>
	</div>
</div>
<div>

</div>
</div>
</div>
</div>


   <div class="clearfix"></div>
<footer id="bottom-footer">
  <div class="container">
    <div class="row wow fdeInUp">
      <div class="col-md-4 col-sm-4 col-xs-12"> 
        <!--copyright-->
        <p class="copyright">© 2018 <a href="https://dcrazed.com/">Grit</a>. All rights reserved</p>
        <!--/copyright--> 
      </div>
      <!--bottom nav-->
      <div class="col-md-4 col-sm-4 col-xs-12">
        <nav class="bottom-nav">
          <ul>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Pricing</a></li>
          </ul>
        </nav>
      </div>
      <!--/bottom nav--> 
      
      <!--powered by-->
      <div class="col-md-4 col-sm-4 col-xs-12">
        <ul class="social-link">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-instagram"></i></a></li>
          <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
        </ul>
      </div>
      <!--/powered by--> 
      
    </div>
  </div>
</footer>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script type="text/javascript" src="js/bootstrap.js"></script> 

<script type="text/javascript" src="js/SmoothScroll.js"></script> 
<script type="text/javascript" src="js/jquery.isotope.js"></script> 
<script src="js/owl.carousel.js"></script> 

<script src="js/jquery.waypoints.min.js"></script> 
<!-- Javascripts
    ================================================== --> 
<script type="text/javascript" src="js/main.js"></script> 
<script src="js/wow.min.js"></script> 
<script>
    jQuery(document).ready(function( $ ) {
    	var a = '<%=dto.getId() %>';
    	var b = '<%=mem.getId() %>';
    	
    	if(a != b){
    		$("#editBtn").hide();
    		$("#delBtn").hide();
    	}else{
    		
    		$("#editBtn").show();
    		$("#delBtn").show();
    		
    	}
    	
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
        
        $("#writeBtn").click(function(){
        	location.href="userbbswrite.jsp";
        });
        
        $("#com_send").click(function(){
        	var b_seq = $("#seq").val();
        	var c_id = "<%=mem.getId() %>"; 
        	var content = $("#comment").val();
        	location.href="commentAf.jsp?b_seq="+b_seq+"&id="+c_id+"&content="+content;
        });
        $("#delBtn").click(function(){
        	var c_seq = $("#comseq").val();
        	var b_seq = $("#seq").val();
        	location.href = "delcomment.jsp?c_seq="+c_seq+"&b_seq=" + b_seq;
        });
        $("#editBtn").click(function(){
        	location.href = "userbbsedit.jsp?seq="+<%=dto.getSeq()%>;
        })
    });
</script> 
<script>
new WOW().init();
</script>
</body>
</html>