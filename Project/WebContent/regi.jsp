
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
<title>Contact</title>
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
        <li><a href="#" class="page-scroll">Home</a></li>
        <li><a href="mypage.jsp" class="page-scroll">MyPage</a></li>
        <li><a href="userbbs.jsp" class="page-scroll">Community</a></li>
        <!-- <li><a href="#" id="accountBtn" class="page-scroll" data-target="myModal">Account</a></li> --><!--  <-- 모달 창 띄우는 줄 -->
        <li><a href="#" id="accountBtn" class="page-scroll" data-target="myModal">Account</a></li>
      
      </ul> 
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<!-- banner Page
    ==========================================-->
<div id="page-banner" style="background-image: url(img/photo-typo.jpg);">
  <div class="content  wow fdeInUp">
    <div class="container ">
      <h1>Contact</h1>
    </div>
  </div>
</div>

<!--page body-->

<div id="page-body">
  <div class="container">
  <div class="row"> 
      <!--blog posts container-->
      <div class="col-md-offset-3 col-md-6 page-block">
        <h1>Join Us!</h1>
<form id="joinFrm" action="regiAf.jsp" method="post">
	<div id="idDiv"  class="form-group has-feedback">
      <label class="control-label" for="inputError2">ID</label>
      <input type="text" class="form-control" id="id" name="id" aria-describedby="inputError2Status">
      <span id="idChk" class="glyphicon form-control-feedback" aria-hidden="true"></span> 
      <span id="inputError2Status" class="sr-only">(error)</span> 
    </div>
    <div id="pwDiv"  class="form-group has-feedback">
      <label class="control-label" for="inputError2">Password</label>
      <input type="password" class="form-control" id="pw" name="pw" aria-describedby="inputError2Status">
      <span id="pwChk" class="glyphicon form-control-feedback" aria-hidden="true"></span> 
      <span id="inputError2Status" class="sr-only">(error)</span> 
    </div>
    <div id="repwDiv"  class="form-group  has-feedback">
      <label class="control-label" for="inputError2">rePassword</label>
      <input type="password" class="form-control" id="repw" aria-describedby="inputError2Status">
      <span id="repwChk" class="glyphicon form-control-feedback" aria-hidden="true"></span> 
      <span id="inputError2Status" class="sr-only">(error)</span> 
    </div>
    <div id="nameDiv"  class="form-group  has-feedback">
      <label class="control-label" for="inputError2">nickname</label>
      <input type="text" class="form-control" id="name" name="name" aria-describedby="inputError2Status">
      <span id="nameChk" class="glyphicon  form-control-feedback" aria-hidden="true"></span> 
      <span id="inputError2Status" class="sr-only">(error)</span> 
    </div>
    <div id="phoneDiv"  class="form-group has-feedback">
      <label class="control-label" for="inputError2">phone</label>
      <input type="text" class="form-control" id="phone" name="phone" aria-describedby="inputError2Status" maxlength="11">
      <span id="phoneChk" class="glyphicon form-control-feedback" aria-hidden="true"></span> 
      <span id="inputError2Status" class="sr-only">(error)</span> 
    </div>
    <button type="submit" id="submit" class="btn btn-primary" disabled>Join</button>
<input type="hidden" id="chk">
</form>
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
<script type="text/javascript">
function valOkdiv(e){
	e.removeClass('has-error');
	e.addClass('has-success');
};

function valNodiv(e){
	e.removeClass('has-success');
	e.addClass('has-error');
};

function valOkchk(e){
	e.removeClass('glyphicon-remove');
	e.addClass('glyphicon-ok');
};

function valNochk(e){
	e.removeClass('glyphicon-ok');
	e.addClass('glyphicon-remove');
};

function validateEmail(sEmail) {
	var filter =  /[^0-9]/g;
	
	if (filter.test(sEmail)) {
		return false;
	}
	else {
		return true;
	}
};

function btnUse(){
	var flag = $("#idDiv").hasClass('has-success');
	var flag1 = $("#pwDiv").hasClass('has-success');
	var flag2 = $("#repwDiv").hasClass('has-success');
	var flag3 = $("#nameDiv").hasClass('has-success');
	var flag4 = $("#phoneDiv").hasClass('has-success');
	if(flag && flag1 && flag2 && flag3 && flag4){
		$("#submit").removeAttr('disabled');
	}
	else{
		$("#submit").attr('disabled',true);
	}
};
jQuery(function(){
	
	$("#chkBtn").click(function(){
		$.ajax({
			url:"idCheck.jsp",
			type:"get",
			data:"id=" + $("#id").val(),
			success:function(data){
				alert(data.trim());
				
				if(data.trim() == "OK"){
					$("#chk").attr('value',1);
				}else if(data.trim() == "NO"){
					$("#chk").attr('value',0);
					$("#id").val("");
				}else{
					$("#chk").attr('value',2);
				}
			},
			error:function(){
				alert("Fail");
			}
		});
	});
	
	$("#id").keyup(function(){
		var idContent = $(this).val();
		var flag = $("#idDiv").hasClass('has-error');
		
		if(idContent.length >= 6){
			valOkdiv($('#idDiv'));
			valOkchk($('#idChk'));
			$.ajax({
				url:"idCheck.jsp",
				type:"get",
				data:"id=" + $("#id").val(),
				success:function(data){
					if(data.trim() == "OK"){
						
					}else if(data.trim() == "NO"){
						valNodiv($('#idDiv'));
						valNochk($('#idChk'));
					}else{
						
					}
				},
				error:function(){
					alert("Fail");
				}
			});
		}else if(idContent.length <6){
			valNodiv($('#idDiv'));
			valNochk($('#idChk'));
		}
		
		btnUse();
	});
	
	
	$("#pw").keyup(function(){
		var content = $(this).val();
		if(content.length >=8){
			valOkdiv($('#pwDiv'));
			valOkchk($('#pwChk'));
		}else{
			valNodiv($('#pwDiv'));
			valNochk($('#pwChk'));
		}
		btnUse();
	});
	
	$("#repw").keyup(function(){
		var content = $(this).val();
		if($("#pw").val() == $("#repw").val()){
			valOkdiv($('#repwDiv'));
			valOkchk($('#repwChk'));
		}else{
			valNodiv($('#repwDiv'));
			valNochk($('#repwChk'));
		}
		btnUse();
	});
	
	$("#name").keyup(function(){
		var content = $(this).val();
		if(content.length >=2){
			valOkdiv($('#nameDiv'));
			valOkchk($('#nameChk'));
			$.ajax({
				url:"nickCheck.jsp",
				type:"get",
				data:"name=" + $("#name").val(),
				success:function(data){
					if(data.trim() == "OK"){
						
					}else if(data.trim() == "NO"){
						valNodiv($('#nameDiv'));
						valNochk($('#nameChk'));
					}else{
						
					}
				},
				error:function(){
					alert("Fail");
				}
			});
		}else{
			valNodiv($('#nameDiv'));
			valNochk($('#nameChk'));
		}
		btnUse();
	});
	
	$("#phone").keyup(function(){
		var content = $(this).val();
		if(validateEmail($("#phone").val()) && $("#phone").val() != "" ){
			valOkdiv($('#phoneDiv'));
			valOkchk($('#phoneChk'));
			$.ajax({
				url:"phoneCheck.jsp",
				type:"get",
				data:"phone=" + $("#phone").val(),
				success:function(data){
					if(data.trim() == "OK"){
						
					}else if(data.trim() == "NO"){
						valNodiv($('#phoneDiv'));
						valNochk($('#phoneChk'));
					}else{
						
					}
				},
				error:function(){
					alert("Fail");
				}
			});
		}else{
			valNodiv($('#phoneDiv'));
			valNochk($('#phoneChk'));
		}
		btnUse();
	});
	
	/* $('#joinFrm').submit(function(){
		if($("#chk").val() = 1){
			
			
		}else {
			alert('아이디 중복체크 필수');
			if($('#id').val() == '') {
				$('#id').focus();
			}else {
				$('#confirmId').focus();
			}
			return false;
		}
	}); */
});



</script>
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
    });
</script> 
<script>
new WOW().init();
</script>
</body>
</html>