
<%@page import="dto.CsBbsDto"%>
<%@page import="dao.iCsBbsDao"%>
<%@page import="dao.CsBbsDao"%>
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
iCsBbsDao dao = CsBbsDao.getInstance();
CsBbsDto dto = dao.getBbs(seq);
dao.addRead(seq);
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
		location.href = "nologinindex.jsp";
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
        



<div class="center">
<form id="insertFrm" action="bbsEdit.jsp" method="post">
<input type="hidden" id="seq" name="seq" value="<%=dto.getSeq() %>">
<h2>문의글</h2>
<table class="table">
<tr>
	<td><b>아이디</b></td>
	<td>
		<%=dto.getId() %>
	</td>
</tr>
<tr>
	<td><b>작성일</b></td>
	<td>
		<%=dto.getWdate() %>
	</td>
</tr>
<tr>
	<td><b>조회수</b></td>
	<td>
		<%=dto.getReadcount() %>
	</td>
</tr>
<tr>
	<td><b>제목</b></td>
	<td>
		<%=dto.getTitle() %>
	</td>
</tr>


<tr>
	<td colspan="2"><b>내용</b></td>
</tr>
<tr>
	<td colspan="2">
		<textarea rows="25" cols="65" id="content" name="content" readOnly><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		
		
		<button type="button" class="btn btn-default btn-sm" id="editBtn">수정 </button>
		<button type="button" class="btn btn-default btn-sm" id="bbsdelBtn">삭제</button>
		<button type="button" class="btn btn-default btn-sm" id="answerBtn">답글</button>
	</td>
</tr>
</table>




</form>
</div>

<div>
<div class="fl">
	
      <button type="button" class="btn btn-default btn-sm" onclick="location.href='cs_bbs.jsp'">Go List</button>
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
    	var c = '<%=mem.getAuth()%>';
    	
    	if(a != b){
    		$("#editBtn").hide();
    		$("#bbsdelBtn").hide();
    	}else{
    		
    		$("#editBtn").show();
    		$("#bbsdelBtn").show();
    		
    	}
    	if(c == '3'){
    		$("#answerBtn").show();
    	}else{
    		$("#answerBtn").hide();
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
        });
        $("#bbsdelBtn").click(function(){
        	location.href = "userbbsdelAf.jsp?b_seq="+<%=dto.getSeq()%>;
        });
        $("#answerBtn").click(function(){
        	var seq = $("#seq").val();
        	location.href = "answer.jsp?seq="+seq;
        });
    });
</script> 
<script>
new WOW().init();
</script>
</body>
</html>