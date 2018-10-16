<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


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
<head>
<!-- Basic Page Needs
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
<body class="page" oncontextmenu="return false">
<nav id="top-menu" class="navbar navbar-default navbar-fixed-top">
  <div class="container"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
      <a class="navbar-brand" href="index.html"><img src="img/logo-top5.png" class="img-responsive"><span>Gambling!</span></a> </div>
    
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
          <!--search form-->         
          <form method="get" action="/search" id="search">
            <ul class="nav">
               <li><p style="color:white">보유 액수 : <%=mem.getMONEY() %><br>
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
<div id="page-banner" style="background-image: url(img/photo-typo.jpg);">
  <div class="content  wow fdeInUp">
    <div class="container ">
      <h1>Contact</h1>
      </div>
</div>
</div>

<div id="page-body">
  <div class="container">
  <div class="row" align="center"> 
  <div class="col-md-offset-3 col-md-6 page-block" id="cls3">
<button onclick="fun(this)" value="start">게임시작!</button>
<button onclick="fun(this)" value="game_guide">게임방법</button>
<button onclick="fun(this)" value="mian_view">이전으로</button>
		<fieldset>
			<textarea id="messageWindow" rows="10" cols="25" readonly="true"></textarea>
			<br /> 
			<input id="inputMessage" type="text" onkeyup="enterkey()" style="overflow: scroll;"/>
			<!-- <textarea rows="1" cols="1" style="background: white;" id="inputMessage" type="text" onkeyup="enterkey()"></textarea> --> 
			<input type="submit" value="send" onclick="send()""/>
		</fieldset>
		</div>
	    </div>
  </div>
</div>
	<script language='javascript'>
function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;
</script>
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

var objDiv = document.getElementById("messageWindow"); 
var textarea = document.getElementById("messageWindow");
// textarea 변수 안에 area입력값을 넣는다. 
var webSocket = new WebSocket('ws://127.0.0.1:8090/Project/lobe');
// webScoket 안에 서버를넣는다.
var inputMessage = document.getElementById('inputMessage');
webSocket.onerror = function(event) {
onError(event);
};
webSocket.onopen = function(event) { // 처음 server에 연결됬을때 생기는 이벤트
onOpen(event);
};
webSocket.onmessage = function(event) { // 다른 client에서 message를 쏴주면 일로옴
	onMessage(event);
	};
	function onMessage(event) {
		objDiv.scrollTop = objDiv.scrollHeight;
		textarea.value += event.data + "\n";
	}
	
function onOpen(event) {
    textarea.value += "******************************************주의상황******************************************\n1.현재 페이지부터는 새로고침이 불가능합니다.\n2.억지로 새로고침을 할시 자동패배가 될수있으니 주의하시기바랍니다. \n3.가급적이면 버튼시스템을 이용해주세요 .\n4.게임을 시작하면 게임끝날때까지  채팅기능이 제한됩니다.\n5.게임 도중에 나갈시 자동으로 패배하게됩니다. \n6.긴시간 매칭이 안잡히시면 매칭취소후 다시 매칭을 해주시기바랍니다.\n대기실의 채팅방입니다. \n";
    webSocket.send(<%=mem.getId()%>+ "님이 입장하셨습니다.");
}

function onError(event) {
    alert(event.data);
  }
  
  
  
  function send(){
	  objDiv.scrollTop = objDiv.scrollHeight;
	  var message = inputMessage.value;
	  if(message == ""){
		  textarea.value += "내용을 입력해주세요.\n";
	  }else{
	  textarea.value += "나 : " + message + "\n";
	  webSocket.send(<%=mem.getId()%>+" : "+message);
	  inputMessage.value = "";
	  }
  }

	function fun(val){
		if(val.value == "start"){
			location.href="yun_Updown.jsp";
		}else if(val.value == "mian_view"){
			location.href="nologinindex.jsp";
		}else if(val.value == "game_guide"){
			alert("1.랜덤으로 매치된상대와 턴을두고 랜덤으로 정해진 숫자를 먼저 맞춘쪽이 승리합니다.\n2.랜덤볼은 금액수정이 불가능합니다.\n3.정해진 금액은 10000원이고 배당은 1.9배입니다.\n4.게임 도중 나가기누를시 자동으로 패배합니다.\n5.그럼 모두 재밌게 게임을 해주시기바랍니다.");
		}
		
	}
	
	function enterkey(){
		if (window.event.keyCode == 13) {
			send();
       }
	}	
</script>
</body>
</html>