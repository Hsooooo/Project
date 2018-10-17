<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8" />
<title> 숫자 야구 게임 </title>
<style type="text/css">



#formArea * { margin-bottom: 20px; } 
#formArea br { margin-bottom: 0px; } 
#formArea input.text { margin-right: 10px; width: 30px; text-align: center; } 

#tbodyArea td { padding: 2px 5px; text-align: center; } 

#check_Correct { margin-top: 10px } 

</style>
<script type="text/javascript">



var question = []; 
var count = 0; 

/*  ─────────────────────  메세지 설정  ─────────────────────  */ 

var notice = { 
		 notOne: "한 칸에 숫자를 하나씩 입력하세요.", // Enter each digit into each input field. 
		 notNumber: "숫자가 아닙니다.", 			 // It's not digit. 
		 repeated: "같은 숫자가 이미 있습니다. 다른 숫자를 입력하세요.", // No digits can be duplicated. 
		 correct: "정답입니다.", 				 // Congratulations. Your answer is correct. 
		 incorrect: "틀렸습니다. 새 게임을 진행하세요." // Your answer is incorrect. Start a new game. 
}; 


/*  ────────────────────  메세지 팝업창  ────────────────────  */ 

function alertWindow ( message ) { // "alert()" 대신에, 팝업창을 만듦

	 var text   = "<p>" + message + "</p><br />"; 
	      text += "<button onclick=' self.close() '> 창 닫기 </button>"; // Close button. 

	 var bodyStyle = "font-family: sans-serif; font-size: 12px; text-align: center;"; 

	 var winStyle = "width=300,height=100,resizable=0,status=0,toolbar=0,menubar=0,location=0,scrollbars=0"; 

	 var alertWin = window.open( "" , "_blank" , winStyle ); 
	      alertWin.document.body.innerHTML = text; 
	      alertWin.document.body.style.cssText = bodyStyle; 
} 


/*  ───────────────────   문제 출제용 함수   ───────────────────  */ 

function setQuestion ( lengths ) { 

	 var array = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]; 
	 var number = [];
	 for(var i=0; i<4; i++){
		 var select = Math.floor(Math.random() * array.length);
		 number[i] = array.splice(select, 1)[0];
	 }

	 return number; 
} 


/*  ─────────────────────  재시작용  ─────────────────────  */  

function reStarting () {  question = []; } 

/* ─────────────────────  시간별 라운드 재시작  ─────────────────────  */
function timeRound(){
	var d = new Date();
	
	var mm = d.getMinutes();
	var ss = d.getSeconds();
	
	
	if(mm % 5 == 0 && ss == "00"){
		var dbqArr = setQuestion(4);
		var dbqS = "";
		for(var i = 0; i< dbqArr.length; i++){
			dbqS += dbqArr[i];
		}
		location.href = "baseballgameAf.jsp?str="+dbqS;
		question = dbqArr;
	}
	
	
}

/*  ───────────────────   게임 진행할 함수   ───────────────────  */ 


	function playOneRound(tagList) {

		var lengths = tagList.length;

		if (count == 0) {
			while (question.length < lengths)
				question = setQuestion(lengths);
		}

		var guess = [];
		var bulls = cows = 0;
		var final2;

		for (var x = 0; x < lengths; x++) {
			guess[x] = tagList[x].value;
		}

		var questionText = question.join().replace(/,/g, "");
		var guessText = guess.join().replace(/,/g, "");

		for (var x = 0; x < lengths; x++) {

			var tag = tagList[x];
			var value = tag.value.replace(/ /g, "");

			var position = guessText.search(value);

			if (!value || value > 9) {
				tag.select();
				return alertWindow(notice.notOne);
			} else if (isNaN(value)) {
				tag.select();
				return alertWindow(notice.notNumber);
			} else if (position > -1 && position != x) {
				tag.select();
				return alertWindow(notice.repeated);
			}

			position = questionText.search(value);

			if (position == x) {
				bulls += 1;
			} else if (position > -1) {
				cows += 1;
			}
		}

		if (bulls < lengths && count == 8) {
			final2 = "모두 잃었습니다.";
		} else if (bulls == lengths) {
			final2 = "정답입니다.";
		}

		questionText = question.join(", ");
		guessText = guess.join(", ");

		var score = {
			count : count,
			bulls : bulls,
			cows : cows,
			question : questionText,
			guess : guessText,
			final2 : final2
		};

		if (final2 == "정답입니다.") {
			reStarting();
		} else {
			count++;
		}

		return score;
	}
</script>
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
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
int point = mem.getPoint();
iMemberDao dao = MemberDao.getInstance();
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
<!-- <section id="home-banner" style="background-image: url(img/b-1.jpg);">
  <div class="content wow fdeInUp">
    <div class="container"  data-wow-duration="1s"> <span class="wow fadeIn">Dcrazed says</span>
      <h1 class="wow fadeInUp"><span>TOTO</span> </h1>
    </div>
  </div>
  <div class="arrow bounce"> <i class="fa fa-arrow-down fa-2x"></i> </div>
</section> -->

<div id="page-banner" style="background-image: url(img/baseball.jpg);">
  <div class="content  wow fdeInUp">
    <div class="container ">
      <h1>Play Baseball!</h1>
      
    </div>
  </div>
</div>
<div id="page-body">
  <div class="container">
  <h2>숫자 야구 게임</h2>
  <div class="row"> 
  
      <!--blog posts container-->
      
<div class ="col-md-6 col-sm-6">
	<p><b>금액을 베팅 한뒤 0 ~ 9 중에서 숫자를 입력한 후, "결과 보기" 버튼을 누르세요. </b></p>
	
	<span>내 보유 포인트 :<span id="pointHtml"> <%=point %></span></span>
	<br>
	<span>베팅 후 잔액 :<span id="pointAfHtml"></span></span><br><br>
	


	 
	 <p>베팅 포인트 </p>
		<select id="betSel">
			<option value="500">500</option>
			<option value="1000">1000</option>
			<option value="2000">2000</option>
			<option value="5000">5000</option>
			<option value="10000">10000</option>
			<option value="20000">20000</option>
			<option value="50000">50000</option>
		</select>
		<button id="betBtn" name="betBtn"  class="btn btn-default btn-sm">베팅하기</button>
		<br>
	 <!-- ──────────────── 입력 부분 ──────────────── --> 
	 <form id="formArea">
		 <input type="text" class="text" disabled/><input type="text" class="text" disabled/>
		 <input type="text" class="text" disabled/><input type="text" class="text" disabled />
	 </form>
	 <h6 style="color:red"><span class="glyphicon glyphicon-ban-circle"></span>&nbsp;금액을 베팅하고 나면 되돌릴수 없습니다!</h6>
	
	
	<br>
	 
	 
	<button class="btn btn-default" id="newGame" name="newGame" disabled> 새로 시작하기 </button> 

	 <p id="check_Correct"></p>
	 
</div>
<div class="col-md-6 col-sm-6">
<section class="widget widget_categories  wow fdeInUp">
          <table  class="table table-bordered">
	 <thead><tr><th colspan="3"> SCORE BOARD </th></tr></thead>

	 <!-- ──────────────── 출력 부분 ──────────────── --> 
	 <tbody id="tbodyArea">
		 <tr><td style="width: 10px;"> 50배 </td><td style="width: 60px;">&nbsp;</td><td style="width: 125px;">&nbsp;</td></tr>
		 <tr><td> 30배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 20배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 10배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 5배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 2배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 원금 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 0.5배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 실패</td><td>&nbsp;</td><td>&nbsp;</td></tr>
	 </tbody>

</table>
        </section>
</div>
<div align="center">
<button id="resultBtn" name="resultBtn" onclick="bullsAndCows()" class="btn btn-default" disabled> 결과 보기 </button>
</div>
</div>
</div>
</div>
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

<p style="clear: both"><p>

<script type="text/javascript">
jQuery(function(){
	$("#betBtn").click(function(){
		if(<%=mem.getPoint()%> >= $("#betSel").val()){
			$("#resultBtn").attr('disabled',false);
			$("#betBtn").attr('disabled',true);
			$("#betSel").attr('disabled',true);
			$(".text").attr('disabled',false);
			var betMinus = <%=mem.getPoint() %> - $("#betSel").val();
			$("#pointAfHtml").html(betMinus);
			var id = "<%=mem.getId() %>";
			$.ajax({
				url:"betAf.jsp",
				type:"get",
				data:"point=" + $("#pointAfHtml").html() + "&id=" + id,
				success : function(){ 
	 	           alert('성공!');
				}, 
				error : function(){ 
	 	        	alert('실패 ㅠㅠ'); 
				}
			});
		}else{
			alert("보유금액보다 베팅금액이 큽니다.");
		}
	});
	$("#newGame").click(function(){
		location.href="baseballgame.jsp";
	});
});
/*  ─────────────────────  관련 태그들  ─────────────────────  */ 

var formArea = document.getElementById( "formArea" ); 
var inputList = formArea.getElementsByTagName( "input" ); 

var tbodyArea = document.getElementById( "tbodyArea" ); 
var trList = tbodyArea.getElementsByTagName( "tr" ); 

var check_Correct = document.getElementById( "check_Correct" ); 


/*  ───────────────────   게임 실행 & 결과 출력  ──────────────────  */ 

function bullsAndCows () { 

	 var result = playOneRound( inputList ); 

	 if ( result == undefined ) return; 

	 var strikes = result.bulls; 
	 var balls = result.cows; 
	 var roundScore =  strikes + " 스트라이크 │ " + balls + " 볼"; 


	 var count = result.count; 
	 if ( count == 0 ){ deleteText(); } 

	 var question = result.question; 
	 var guess = result.guess; 

	 var tr = trList [ count ]; 

	 var td1 = tr.getElementsByTagName( "td" )[ 1 ]; 
	 var td2 = tr.getElementsByTagName( "td" )[ 2 ]; 

	 td1.innerHTML = guess; 
	 td2.innerHTML = roundScore; 


	 var text = ""; 
	 var final2 = result.final2; 

	 if ( final2 ) { 
		 if ( strikes == 4 ){ 
			 alert("정답! 정답은 " +question+ "입니다.");
			 var id = "<%=mem.getId() %>";
			 $.ajax({
					url:"baseballgameAf.jsp",
					type:"get",
					data:"point=" + $("#betSel").val() + "&id=" + id +"&count=" + count,
					success : function(){
						<%
						ologin = session.getAttribute("login");
						mem = (MemberDto)ologin;
						%>
		 	           	
		 	           	$("#newGame").attr('disabled',false);
		 	            $("#resultBtn").attr('disabled',true);
		 				$("#betBtn").attr('disabled',true);
		 				$("#betSel").attr('disabled',true);
		 				$(".text").attr('disabled',true);
					}, 
					error : function(){ 
		 	        	alert('실패 ㅠㅠ'); 
					}
				});
			 text = final2 + "정답은 " + question + " 입니다."; 
		 } 
		 else { 
			 alert("정답을 맞추지 못했습니다.");
			 alert("정답은 " + question);
			 var id = "<%=mem.getId() %>";
			 count = 9;
			 $.ajax({
					url:"baseballgameAf.jsp",
					type:"get",
					data:"point=" + $("#betSel").val() + "&id=" + id +"&count="+count,
					success : function(){
						<%
						ologin = session.getAttribute("login");
						mem = (MemberDto)ologin;
						%>
						$("#newGame").attr('disabled',false);
						$("#resultBtn").attr('disabled',true);
		 				$("#betBtn").attr('disabled',true);
		 				$("#betSel").attr('disabled',true);
		 				$(".text").attr('disabled',true);
					}, 
					error : function(){ 
		 	        	alert('실패 ㅠㅠ'); 
					}
				});
		 } 
	 } 

	 check_Correct.innerHTML = ""; 

	 formArea.reset(); 
	 inputList[0].focus(); 
} 


/*  ──────────────────  마우스 커서, 자동 이동  ──────────────────  */ 

function changeFocus ( tag , next , event ){ 

	 event = event || window.event; 

	 var keyCode = event.which || event.keyCode;

	 if ( keyCode == 8 || keyCode == 46 ){ return; } 

	 else if ( tag.value.length == 1 ){ inputList[ next ].select(); } 
} 

inputList[ 0 ].onkeyup = function( e ){ changeFocus ( this , 1 , e ) }; 
inputList[ 1 ].onkeyup = function( e ){ changeFocus ( this , 2 , e ) }; 

if ( inputList[ 3 ] != undefined ){ 
	 inputList[ 2 ].onkeyup = function( e ) { changeFocus( this , 3 , e ) }; 
} 


/*  ─────────────────────    리셋 효과   ─────────────────────  */ 

function deleteText () { 

	 inputList[0].focus(); 

	 for ( var x = 0; x < trList.length; x++ ) { 

		 var tr = trList [ x ]; 
		 var tdList = tr.getElementsByTagName( "td" ); 

		 tdList[ 1 ].innerHTML = "&nbsp;"; 
		 tdList[ 2 ].innerHTML = "&nbsp;"; 
	 } 
} 



</script>
</body>
</html>