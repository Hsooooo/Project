
<%@page import="java.util.ArrayList"%>
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
<!--  페이징 정보 교환 -->
<%
PagingBean paging = new PagingBean();
String nowPage = request.getParameter("nowPage");
if(nowPage == null){ /* 처음으로 들어온페이지. */
	//System.out.println("bbslist = 1");
	paging.setNowPage(1);
	//System.out.println(paging.getNowPage());
}else{
	paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
	//System.out.println("bbslist = 2");
	//System.out.println(paging.getNowPage());
}
%>
<%
iBbsDao dao = BbsDao.getInstance();
//List<BbsDto> bbslist = dao.getBbsList();
List<BbsDto> bbslist = new ArrayList<>();
String search = request.getParameter("search");
System.out.println("bbslist search = " +  search);
if(search==null){
	bbslist = dao.getBbsPagingList(paging, "");
//bbslist = (List<BbsDto>)request.getAttribute("bbslist");		
}else{
	bbslist = dao.getBbsPagingList(paging, search);
//List<BbsDto> bbslist = dao.getBbsList();
}

iCommentDao c_dao = CommentDao.getInstance();

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
        

<h2>목록</h2>
<table class="table">
<thead>
<tr class="table-primary">
	<th scope="col">Num</th><th scope="col">Title</th><th scope="col">Writer</th><th scope="col">Read</th>
</tr>
</thead>
<tbody>
<%
int count = 0;
if(bbslist ==null || bbslist.size() == 0){
	%>
	
	<tr>
		<td colspan="3">No Item</td>
	</tr>
	<%
}else{
	for(int i=0;i<bbslist.size();i++){
		BbsDto bbs = bbslist.get(i);
		%>
		<tr>
			<td><%=i+1%></td>
			<td style="text-align: left;">
			<%
				count = c_dao.commentCount(bbs.getSeq());
			%>
				<%
				if(bbs.getDel() == 0){
				%>
					<a href="userbbsdetail.jsp?seq=<%=bbs.getSeq() %>"><%=bbs.getTitle() %></a>[<%=count %>]
				<%
				}else{
				%>
					Deleted Item
				<%
				}
				%>
				
			</td>
			<td><%=bbs.getId() %></td>
			<td><%=bbs.getReadcount() %></td>
		</tr>
		
		<%
	}
}
%>
</tbody>
</table>
<jsp:include page="paging.jsp">
	<jsp:param value="userbbs.jsp" name="actionPath"/>
	<jsp:param value="<%=String.valueOf(paging.getNowPage()) %>" name="nowPage"/>
	<jsp:param value="<%=String.valueOf(paging.getTotalCount()) %>" name="totalCount"/>
	<jsp:param value="<%=String.valueOf(paging.getCountPerPage()) %>" name="countPerPage"/>
	<jsp:param value="<%=String.valueOf(paging.getBlockCount()) %>" name="blockCount"/>
	
</jsp:include>
<div>
<div class="fl">
	<nav>
    <div class="input-group">
      <select class="custom-select custom-select-sm">
      	<option value="제목">제목</option>
      	<option value="작성자">작성자</option>
      	<option value="내용">내용</option>
      </select>
      <input type="text" class=" input-sm" aria-label="..." id="searchStr">
      <button id="searchBtn" name="searchBtn"  class="btn btn-default btn-sm">
			<span class="glyphicon glyphicon-pencil"></span>검색
	  </button>
    </div><!-- /input-group -->
	</nav>	
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
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
        
        $("#writeBtn").click(function(){
        	location.href="userbbswrite.jsp";
        });
        $("#searchBtn").click(function(){
        	var search = $("#searchStr").val();
        	location.href="userbbs.jsp?search="+ search;
        });
    });
</script> 
<script>
new WOW().init();
</script>
</body>
</html>