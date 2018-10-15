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
<h6>현재내정보:<%=mem.toString() %></h6>
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
  <div class="row"> 
<button onclick="fun(this)" value="start">게임시작!</button>
<button>게임방법</button>
<button>나가기</button>
		<fieldset>
			<textarea id="messageWindow" rows="10" cols="50" readonly="true" style="overflow-y: "></textarea>
			<br /> <input id="inputMessage" type="text" /> <input type="submit"
				value="send" onclick="send()" />
		</fieldset>
	    </div>
  </div>
</div>
	
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
    textarea.value += "*********************주의상황*********************\n1.현재 페이지부터는 새로고침은 자제해주시기바랍니다.\n2.가급적이면 버튼시스템을 이용해주세요 .\n3.게임을 시작하면 게임끝날때까지  채팅기능이 제한됩니다./n4.게임 도중에 나갈시 자동으로 패배하게됩니다. \n대기실의 채팅방입니다. \n";
    webSocket.send(<%=mem.getId()%>+ "님이 입장하셨습니다.");
}

function onError(event) {
    alert(event.data);
  }
  function send(){
	  objDiv.scrollTop = objDiv.scrollHeight;
	  var message = inputMessage.value;
	  textarea.value += "나 : " + message + "\n";
	  webSocket.send(<%=mem.getId()%>+" : "+message);
	  inputMessage.value = "";
	  
  }

	function fun(val){
		if(val.value == "start"){
			location.href="yun_Updown.jsp";
		}
	}
	
		
	
</script>
</body>
</html>