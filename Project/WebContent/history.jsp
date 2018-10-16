<%@page import="java.util.ArrayList"%>
<%@page import="dao.iHistoryDao"%>
<%@page import="dao.HistoryDao"%>
<%@page import="dto.HistoryDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.PagingBean"%>
<%@page import="dao.CsBbsDao"%>
<%@page import="dao.iCsBbsDao"%>
<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE HTML>
<html>
<head>
<!-- Basic Page Needs
    ================================================== -->
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
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

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css"  href="style.css">
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
iMemberDao mDao = MemberDao.getInstance();

String id = request.getParameter("id");
mem = (MemberDto)ologin;
iBbsDao bDao = BbsDao.getInstance();
int bCount = bDao.getMyBbsCount(mem.getId());
iCsBbsDao cDao = CsBbsDao.getInstance();
int cCount = cDao.getMyCsCount(mem.getId());
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
iHistoryDao hdao = HistoryDao.getInstance();
List<HistoryDto> bbslist = new ArrayList<>();
//List<BbsDto> bbslist = dao.getBbsList();
if(id == null || id.equals("")){
	
	bbslist = hdao.getBbsPagingList(paging,mem.getId());
}else{
	
	bbslist = hdao.getBbsPagingList(paging,id);
}
%>
<!-- Navigation
    ==========================================-->
<nav id="top-menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
      <a class="navbar-brand" href="loginindex.jsp"><img src="img/logo-top5.png" class="img-responsive"><span>Gambling!</span></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
   
      <!--nav icon--> 
      <a id="nav-icon"> <span></span> <span></span> <span></span> </a> 
      <!--nav icon end-->
      
      <ul id="nav-top" class="nav navbar-nav navbar-right">
        <li><a href="#" class="page-scroll">Home</a></li>
        <li><a href="mypage.jsp" class="page-scroll">MyPage</a></li>
        <li><a href="userbbs.jsp" class="page-scroll">Community</a></li>
        <li><a href="cs_bbs.jsp" class="page-scroll">Q&A</a></li>
        <!-- <li><a href="#" id="accountBtn" class="page-scroll" data-target="myModal">Account</a></li> --><!--  <-- 모달 창 띄우는 줄 -->
        <li><a href="logout.jsp" class="page-scroll">Logout</a></li>
      
      </ul>        
          <!--search form-->         
          <form method="get" action="/search" id="search">
            <ul class="nav">
            	<li><p style="color:white">보유 액수 : <%=mem.getMoney() %><br>
            		보유 포인트 : <%=mem.getPoint() %>
            	</li>
            </ul>
          </form>
          <!--/search form--> 
          
           <nav class="bottom-nav">
          <ul>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Pricing</a></li>
          </ul>
        </nav>
          
          <ul class="social-link">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-instagram"></i></a></li>
          <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
        </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>
<!-- banner Page
    ==========================================-->
<div id="page-banner" style="background-image: url(img/photo-1501.jpg);">
  <div class="content  wow fdeInUp">
    <div class="container ">
    <%if(id == null || id.equals("")){ %>
      <h1>My Page</h1>
      <%}else{ %>
      <h1>유저 정보보기</h1>
      <%} %>
    </div>
  </div>
</div>
<div id="page-body">
  <div class="container">
    <div class="row  wow fdeInUp">
      <!--blog page container-->
      <div class="border border-primary col-md-9 col-sm-7 col-xs-12 page-block ">
      <%if(id == null || id.equals("")){ %>
      <h3>나의 적립 내역</h3>
      	<%}else{ %>
      	<h3><%=id %>님의 적립 내역(최근 10건만 표시됩니다.)</h3>
      	<%} %>
      	<table class="table">
<thead>
<tr class="table-primary">
	<th scope="col" width="50">종류</th><th scope="col" width="30">베팅금</th>
	<th scope="col" width="30">수익</th><th scope="col" width="30">시간</th>
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
		HistoryDto bbs = bbslist.get(i);
		%>
		<tr>
			
			<td>
			<%
			int flag = bbs.getKind();
			if(flag == 1){
			%>
				Baseball
			<%	
			}else if(flag == 2){
			%>
				Dice
			<%	
			}else if(flag == 3){
			%>
				홀짝
			<%	
			}else if(flag == 4){
			%>
				업다운
			<%	
			}else if(flag == 5){
			%>
				댓글달기
			<%	
			}else{
			%>
				게시글쓰기
			<%	
			}
			%>
			</td>
			<td><%=bbs.getBet() %></td>
			<td><%=bbs.getEarned() %></td>
			<td><%=bbs.getWdate() %></td>
		</tr>
		
		<%
	}
}
%>
</tbody>
</table>
<%if(id == null || id.equals("")){ %>
<jsp:include page="paging.jsp">
	<jsp:param value="history.jsp" name="actionPath"/>
	<jsp:param value="<%=String.valueOf(paging.getNowPage()) %>" name="nowPage"/>
	<jsp:param value="<%=String.valueOf(paging.getTotalCount()) %>" name="totalCount"/>
	<jsp:param value="<%=String.valueOf(paging.getCountPerPage()) %>" name="countPerPage"/>
	<jsp:param value="<%=String.valueOf(paging.getBlockCount()) %>" name="blockCount"/>
	
</jsp:include>
<%}else{ %>
    	
<%} %>        
        
        <div class="clearfix"></div>
        
        <!--/portfolio page nav-->
        <nav class="navigation posts-navigation  wow fadeInUp"  role="navigation">
         
        </nav>
      </div>
      <!--blog page container--> 
      
      <!--aside-->
      <aside class="col-md-3 col-sm-5" style="padding:0;"> 
        
           
        
        <!--Archives start-->
        
        <section class="widget widget_categories  wow fdeInUp">
          <h2 class="widget-title">category</h2>
          <ul >
          	
            <li ><a href="userbbs.jsp?search=<%=mem.getId() %>&choice=1"> 내가 쓴 글 <span ><%=bCount %></span> </a> </li>
            <li><a href="#"> Q&A<span ><%=cCount%></span> </a></li>
            <li><a href="mypage.jsp"> 내 정보 보기</a></li>
            <li ><a href="history.jsp"> 적립 내역 보기 </a> </li>
            
          </ul>
        </section>
        
        <!--Archives end--> 
        
        <section class="widget widget_social sidebar  wow fdeInUp">
          <h2 class="widget-title">Follow Us</h2>
          <ul >
            <li ><a href="#" title="facebook"><i class="fa fa-facebook"></i></a></li>
            <li ><a href="#" title="twitter"><i class="fa  fa-twitter"></i></a></li>
            <li ><a href="#" title="google-plus"><i class="fa  fa-google-plus"></i></a> </li>
            <li><a href="#" title="Rss Feed"><i class="fa  fa-rss"></i></a></li>
          </ul>
        </section>
        
      </aside>
      <!--aside-->
      
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<!--  Modal RePill Page
======================================================== -->
 <div class="modal fade" id="repillModal" tabindex="-1" role="dialog" aria-labelledby="repillModalLabel" style="display: none;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i></button>
            <h4 class="modal-title" id="myModalLabel">충전하기</h4>
            <br><br><br>
            <h5>머니 충전은 관리자가 승인을 해야 충전이 됩니다.</h5>
          </div>
          <div class="modal-body">
          	<div class="form-group">
       			 <label for="exampleInputId">충전할 금액</label>
       			 <input type="text" class="form-control" id="money" name="money">
      		</div>
		  </div>
          <div class="modal-footer ">
            <button type="button" id="loginBtn" class="btn btn-outline-secondary" data-dismiss="modal">충전</button>
            
          </div>
        </div>
      </div>
</div>
<footer id="bottom-footer">
  <div class="container">
    <div class="row wow fdeInUp">
      <div class="col-md-4 col-sm-4 col-xs-12"> 
        <!--copyright-->
        <a href="loginindex.jsp"><img src="img/logo-top5.png" class="img-responsive"><span>Gambling!</span></a>
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
      
      <!--social by-->
      <div class="col-md-4 col-sm-4 col-xs-12">
        <ul class="social-link">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-instagram"></i></a></li>
          <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
        </ul>
      </div>
      <!--/social by--> 
      
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
        $("#repillBtn").click(function(){
        	$("#repillModal").modal();
        });
    });
</script> 
<script>
new WOW().init();
</script>
</body>
</html>