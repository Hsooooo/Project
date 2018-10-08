<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dto.MemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Needs
ㅋㅋ
    ================================================== -->
    
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HANSOO - Home</title>
<meta name="description" content="">
<meta name="author" content="">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">


</script>
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

<body>
 <%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
String nav_bar = "";
if(ologin == null){
	nav_bar = "";
	%>
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			location.href="index.jsp";
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
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
      <a class="navbar-brand" href="index.html"><img src="img/logo-top.png" class="img-responsive"><span>TOTO</span></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
   
      <!--nav icon--> 
      <a id="nav-icon"> <span></span> <span></span> <span></span> </a> 
      <!--nav icon end-->
      
      <ul id="nav-top" class="nav navbar-nav navbar-right">
        <li><a href="#" class="page-scroll">Home</a></li>
        <li><a href="userbbs.jsp" class="page-scroll">MyPage</a></li>
        <li><a href="#" class="page-scroll">Blog</a></li>
        <!-- <li><a href="#" id="accountBtn" class="page-scroll" data-target="myModal">Account</a></li> --><!--  <-- 모달 창 띄우는 줄 -->
        <li><a href="logout.jsp" class="page-scroll">Logout</a></li>
      
      </ul>        
          <!--search form-->         
          <form method="get" action="/search" id="search">
            <input name="q" type="text" size="40" placeholder="Search..." />
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
<section id="home-banner" style="background-image: url(img/b-1.jpg);">
  <div class="content">
    <div class="container"  data-wow-duration="1s"> <span class="wow fadeIn">Dcrazed says</span>
      <h1 class="wow fadeInUp"><span>TOTO</span> </h1>
    </div>
  </div>
  <div class="arrow bounce"> <i class="fa fa-arrow-down fa-2x"></i> </div>
</section>


<!--  Modal login Page
======================================================== -->
<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i></button>
            <h4 class="modal-title" id="myModalLabel">Login</h4>
          </div>
          <div class="modal-body">
          	<div class="form-group">
       			 <label for="exampleInputId">ID</label>
       			 <input type="text" class="form-control" id="id" name="id">
      		</div>
      		<div class="form-group">
       			 <label for="exampleInputPass">Password</label>
       			 <input type="password" class="form-control" id="pw" name="pw">
      		</div> 
		  </div>
          <div class="modal-footer ">
            <button type="button" id="loginBtn" class="btn btn-outline-secondary" data-dismiss="modal">Login</button>
            <button type="button" id="joinBtn" class="btn btn-outline-secondary" data-dismiss="modal">Join</button>
          </div>
        </div>
      </div>
</div> -->

<!-- latest news block
    ==========================================-->

<section id="latest-news-block">
  <div class="container">
    <div class="row"> 
      <!--section-title-->
      <div class="section-title text-center wow fadeInUp">
        <h2>GAME</h2>
        <a href="blog.html">See the blog</a></div>
      <!--/section-title--> 
      
      <!--home article-->
      <article class="col-md-3 col-sm-6 col-xs-12">
        <header class="entry-header"> <a href="baseballgame.jsp"><img src="img/04-screenshot.jpg" alt="image 1"></a>
          <a href="blog-post.html"><h6>BASEBALL 숫자 맞추기 게임으로 돈을 벌어보세요!</h6></a>
           <a href="#">Web-design</a> , <a href="#">Front-end</a> </header></a>
      </article>
      <!--/home article --> 
      
      <!--home article-->
      <article class="col-md-3 col-sm-6 col-xs-12">
        <header class="entry-header"> <img src="img/02-screenshot.jpg" alt="image 1"> <a href="#">
          <h6>Responsive Website in 2017 – 
            Step by Step Guide</h6>
          </a> <a href="#">Web-design</a> </header>
      </article>
      <!--/home article --> 
      
      <!--home article-->
      <article class="col-md-3 col-sm-6 col-xs-12">
        <header class="entry-header"> <img src="img/03-screenshot.jpg" alt="image 1"> <a href="#">
          <h6>10 Incredible Quotes To Guide Your Life</h6>
          </a> <a href="#">Web-design</a> , <a href="#">Front-end</a> </header>
      </article>
      <!--/home article --> 
      
      <!--home article-->
      <article class="col-md-3 col-sm-6 col-xs-12">
        <header class="entry-header"> <img src="img/01-screenshot.jpg" alt="image 1"> <a href="#">
          <h6>HEADING 6 in use here</h6>
          </a> <a href="#">Web-design</a> </header>
      </article>
      <!--/home article --> 
      
    </div>
  </div>
</section>



<!-- contact us Page
    ==========================================-->
<section id="home-contact-block">
  <div class="container">
    <div class="row wow fadeInUp">
      <p>게임을 하기 위해선 포인트 충전이 필요합니다.</p>
      <a href="#">포인트 충전하기</a> </div>
  </div>
</section>



<!-- the process block
    ==========================================-->

<section id="process-block">
  <div class="container">
    <div class="row"> 
      <!--section-title-->
      <div class="section-title text-center wow fadeInUp">
        <h2>The process</h2>
      </div>
      <!--/section-title--> 
      <!--process tab-->
      <div> 
        <!--tab nav-->
        <ul class="nav nav-tabs">
            <li class="active"><a href="#concept" data-toggle="tab"><i class="fa fa-star-o"></i>
                <h5>01. Concept</h5>
                </a>
            </li>
            <li><a href="#prototype" data-toggle="tab"><i class="fa fa-copy"></i>
                <h5>02. Prototyping</h5>
                </a>
            </li>
            <li><a href="#design" data-toggle="tab"><i class="fa fa-laptop"></i>
                <h5>03. Design</h5>
                </a>
            </li>
            <li><a href="#development" data-toggle="tab"><i class="fa fa-code"></i>
                <h5>04. Development</h5>
                </a>
            </li>
        </ul>
        <!--/tab nav--> 
        <!--tab container-->
        <div class="tab-content"> 
          
          <!--tab nav item 1-->
          <div id="concept" class="tab-pane active"> 
            <!--tab img-->
            <div class="col-md-5 process-img"> <img src="img/tab-1.jpg" class="img-responsive"> </div>
            <!--/tab img--> 
            <!--tab content-->
            <div class="col-md-7 process-content">
              <h6>Professional website design</h6>
              <p>Apes and spider monkeys move theirbody from branch to branch by swaying hands, but most monkeys do not. They just run and jump from branch to branch.</p>
              <a href="#">Read More</a> </div>
            <!--/tab content-->             
          </div>
          <!--/tab nav item 1--> 
          
          <!--tab nav item 2-->
          <div id="prototype" class="tab-pane"> 
            <!--tab img-->
            <div class="col-md-5 process-img"> <img src="img/03-screenshot.jpg" class="img-responsive"> </div>
            <!--/tab img--> 
            <!--tab content-->
            <div class="col-md-7 process-content">
              <h6>Sketch like a PRO</h6>
              <p>Apes and spider monkeys move theirbody from branch to branch by swaying hands, but most monkeys do not. They just run and jump from branch to branch.</p>
              <a href="#">Read More</a> </div>
            <!--/tab content-->             
          </div>
          <!--/tab nav item 2--> 
		  
           <!--tab nav item 3-->
          <div id="design" class="tab-pane"> 
            <!--tab img-->
            <div class="col-md-5 process-img"> <img src="img/02-screenshot.jpg" class="img-responsive"> </div>
            <!--/tab img--> 
            <!--tab content-->
            <div class="col-md-7 process-content">
              <h6>Make the design</h6>
              <p>Apes and spider monkeys move theirbody from branch to branch by swaying hands, but most monkeys do not. They just run and jump from branch to branch.</p>
              <a href="#">Read More</a> </div>
            <!--/tab content-->             
          </div>
          <!--/tab nav item 3-->     
		  
          <!--tab nav item 4-->
          <div id="development" class="tab-pane"> 
            <!--tab img-->
            <div class="col-md-5 process-img"> <img src="img/01-screenshot.jpg" class="img-responsive"> </div>
            <!--/tab img--> 
            <!--tab content-->
            <div class="col-md-7 process-content">
              <h6>Code like a star</h6>
              <p>Apes and spider monkeys move theirbody from branch to branch by swaying hands, but most monkeys do not. They just run and jump from branch to branch.</p>
              <a href="#">Read More</a> </div>
            <!--/tab content-->             
          </div>
          <!--/tab nav item 4--> 		  
        </div>
        <!--/tab container--> 
        
      </div>
      <!--\process tab--> 
      
    </div>
  </div>
</section>

<!-- about us Page
    ==========================================-->
<section id="about-us-block" class="text-center">
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <div id="testimonial" class="owl-carousel owl-theme">
          <div class="item"> <img src="img/team/01.jpg">
            <h5>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h5>
            <p><strong>Dean Martin</strong> CEO Acme Inc.</p>
          </div>
          <div class="item"> <img src="img/team/02.jpg">
            <h5>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h5>
            <p><strong>Rima Martin</strong> CEO Food Inc.</p>
          </div>
          <div class="item"> <img src="img/team/03.jpg">
            <h5>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h5>
            <p><strong>Joe Martin</strong> CEO Chat Inc.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Company counter section
    ==========================================-->
<section id="company-counter" style="background-image:url(img/count-bg.jpg);">
  <div class="container">
    <div class="row text-center">
      <div class="col-md-12 wow fadeInDown">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="c-block"><i class="fa fa-heart-o"></i><span class="counter">17</span>
            <p>Clients</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="c-block"><i class="fa fa-envelope-o"></i><span class="counter">456</span>
            <p>Leads</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="c-block"><i class="fa fa-folder-o"></i><span class="counter">8596</span>
            <p>Websites</p>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="c-block"><i class="fa fa-coffee"></i><span class="counter">456</span>
            <p>Coffee</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /Company counter section --> 

<!-- Testimonials Section
    ==========================================-->
<section id="testimonials-block" class="text-center">
  
</section>
<!-- our works block
    ==========================================-->
<section id="our-work-block">
  <div class="container">
    <div class="row"> 
      <!--section-title-->
      <div class="section-title text-center wow fadeInUp">
        <h2>GAME</h2>
        <a href="portfolio.html">go to portfolio</a></div>
      <!--/section-title-->
      <div class="clearfix"></div>
      <div class="works">
        <ul class="grid">
          <li>
            <figure><img src="img/01-screenshot.jpg" alt="Screenshot 01">
              <figcaption>
                <div class="caption-content">
                  <h6>Codetowp branding</h6>
                  <hr>
                  <a href="#">Design</a>/ <a href="#">brand</a>
                  <ul class="work-more">
                    <li><a href="img/01-screenshot.jpg"><i class="fa fa-search"></i></a></li>
                    <li><a href="portfolio-inner.html"><i class="fa fa-link"></i></a></li>
                  </ul>
                </div>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure><img src="img/02-screenshot.jpg" alt="Screenshot 01">
              <figcaption>
                <div class="caption-content">
                  <h6>Optimised For Design</h6>
                  <hr>
                  <a href="#">Design</a>/ <a href="#">brand</a>
                  <ul class="work-more">
                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                    <li><a href="#"><i class="fa fa-link"></i></a></li>
                  </ul>
                </div>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure><img src="img/03-screenshot.jpg" alt="Screenshot 01">
              <figcaption>
                <div class="caption-content">
                  <h6>Optimised For Design</h6>
                  <hr>
                  <a href="#">Design</a>/ <a href="#">brand</a>
                  <ul class="work-more">
                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                    <li><a href="#"><i class="fa fa-link"></i></a></li>
                  </ul>
                </div>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure><img src="img/04-screenshot.jpg" alt="Screenshot 01">
              <figcaption>
                <div class="caption-content">
                  <h6>Optimised For Design</h6>
                  <hr>
                  <a href="#">Design</a>/ <a href="#">brand</a>
                  <ul class="work-more">
                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                    <li><a href="#"><i class="fa fa-link"></i></a></li>
                  </ul>
                </div>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure><img src="img/05-screenshot.jpg" alt="Screenshot 01">
              <figcaption>
                <div class="caption-content">
                  <h6>Optimised For Design</h6>
                  <hr>
                  <a href="#">Design</a>/ <a href="#">brand</a>
                  <ul class="work-more">
                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                    <li><a href="#"><i class="fa fa-link"></i></a></li>
                  </ul>
                </div>
              </figcaption>
            </figure>
          </li>
          <li>
            <figure><img src="img/06-screenshot.jpg" alt="Screenshot 01">
              <figcaption>
                <div class="caption-content">
                  <h6>Optimised For Design</h6>
                  <hr>
                  <a href="#">Design</a>/ <a href="#">brand</a>
                  <ul class="work-more">
                    <li><a href="#"><i class="fa fa-search"></i></a></li>
                    <li><a href="#"><i class="fa fa-link"></i></a></li>
                  </ul>
                </div>
              </figcaption>
            </figure>
          </li>
        </ul>
      </div>
    </div>
  </div>
</section>


<footer id="bottom-footer">
  <div class="container">
    <div class="row wow fadeInUp">
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
      
      <!--Social Links-->
      <div class="col-md-4 col-sm-4 col-xs-12">
        <ul class="social-link">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-instagram"></i></a></li>
          <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
        </ul>
      </div>
      <!--/Social Links--> 
      
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
<!-- Custom Javascripts
    ================================================== --> 
<script type="text/javascript" src="js/main.js"></script> 
<script src="js/wow.min.js"></script> 

<script type="text/javascript">

$(function(){
	$("#accountBtn").click(function(){
		$("#myModal").modal();
	});
	$("#loginBtn").click(function(){
		location.href="login.jsp?id="+$("#id").val() + "&pw="+$("#pw").val();
	});
	$("#joinBtn").click(function(){
		location.href="regi.jsp";
	})
});

</script>
<script>
    jQuery(document).ready(function( $ ) {
        $('.counter').counterUp({
            delay: 10,
            time: 1000
        });
    });
</script> 
<script>
new WOW().init();
</script>
</body>
</html>