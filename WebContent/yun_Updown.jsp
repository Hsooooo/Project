<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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


<%
	//MemberDto mem = (MemberDto)request.getAttribute("mem");
	MemberDto mem = (MemberDto) session.getAttribute("login");
	System.out.println("yun_Udonw.jsp dto = " + mem.toString());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body class="page">
<%-- <nav id="top-menu" class="navbar navbar-default navbar-fixed-top">
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
  </div> --%>
  <!-- /.container-fluid --> 
</nav>
<div id="page-banner" style="background-image: url(img/photo-typo.jpg); position: absolute;">
  <div class="content  wow fdeInUp">
    <div class="container ">
</div>
</div>
</div>

<body class="page" oncontextmenu="return false">
  <div class="container">
  <div class="row">
    
      <!--blog posts container-->
      <div class="col-md-offset-3 col-md-6 page-block">
      <div style="position: absolute;">
      <img alt="사진없음" src="./image/neco.gif" id="loding">
      <button id="aocldcnlth">매칭 취소</button>
      </div>
      <div id="cls3">
      	<span style="text-align: center;">
		<p>제한 시간</p><h5 id="time"></h5>
	</span>
		<fieldset>
			<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
			<br /> <input id="inputMessage" type="text" onkeyup="enterkey()"/> <input type="submit"
				value="send" onclick="send()" />
					<button id="skrkrl">나가기</button>
			
		</fieldset>
		</div>
		</div>
	</div>
</div>
	<br>

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



<!-- ======================= 기능구현 script css 아님!! ==================================== --> 
<script src="js/wow.min.js"></script> 

	<script type="text/javascript">
	var objDiv = document.getElementById("messageWindow"); 
	var onMesage = ""; //메세지 저장함수
	var my_nmae = <%=mem.getId()%> //닉네임 함수
    var random = ""; //랜덤으로 정해지는 함수를 찾는함수.
    var ten = "내턴입니다 $&*@&$*@$&*@$&@*"; // 상대턴인지 내턴인지 확인하는작업.
    var limit = 7; // 제한시간 30초
    var num_check=0; // 숫자인지 비교해주는 함수.
    var game_END = -1; //게임이 끝낫는지 안끝낫는지 정해주는함수
    var _shbu = setInterval("shbu()",1000);
     			// 제한시간 다됫는지 체크하는함수
    var _timer = "";
     			// 제한시간 지나가게하는 함수
     //	$("#skrkrl").hide();
    //	$(".col-md-offset-1").hide();
    //	$("span").hide();
    	$("#cls3").hide();
    
        var textarea = document.getElementById("messageWindow");
        // textarea 변수 안에 area입력값을 넣는다. 
        var webSocket = new WebSocket('ws://127.0.0.1:8090/Project/broadcast');
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
    	onMesage = event.data;
    	if(game_END ==- 1){
    	limit=30;
    		// 제한시간 초기화
    	if(event.data == "내턴입니다 $&*@&$*@$&*@$&@*" ||event.data == "내턴이 아닐때는 내가 못합니다 !##!%%^&"){
    	ten = event.data;
    	
    	}else if(onMesage == "나가기!$%&@%@$^"){
    		alert("상대방께서 방에서 나갔습니다. 대기실로이동합니다.");
    		win();
    		//location.href="yun_UpdonwReady.jsp"
    	}else if(random ==""){
    		//setInterval("timer()",1000); 한번작동하면 그함수는 계속작동한다.
    		random = event.data;
    		textarea.value += "상대를찾았습니다 \n";
    		_timer = setInterval("timer()",1000)
    		$("#loding").remove();
    		//$(".col-md-offset-1").show();
    		//$("#skrkrl").show();
    	
    		//$("span").show();
    		$("#aocldcnlth").hide();
    		$("#cls3").show();
    	}else if(random !="") {
        	if(Number(random) < Number(onMesage)){
        		textarea.value += onMesage+"보단 작습니다\n"
        	}else if(Number(random) > Number(onMesage)){
        		textarea.value += onMesage+"보단 큽니다.\n"
        	}else if(Number(random) == Number(onMesage)){  
        		// 상대가 보낸수자가 random 숫자가 맞을경우 패배함수에 들어간다.
        		defeated();
        	}
    	}
    	}else if(game_END == 2){
        textarea.value +=event.data + "\n";
    	}
    }
    function onOpen(event) {
        textarea.value += "상대를 찾는중입니다....\n";
    }
    function onError(event) {
      alert(event.data);
    }
    // 나가기버튼 클릭시
    $("button#skrkrl").click(function(){
    	if(game_END == -1){
    	webSocket.send("나가기!$%&@%@$^");
    	defeated();
    	alert("기권패 당하셨습니다. 대기실로이동합니다.");
    	location.href="yun_UpdonwReady.jsp";
    }else if(game_END == 2){
    	alert("대기실로 이동합니다.")
    	location.href="yun_UpdonwReady.jsp";
    }
    });
    //매췽취소 버튼클릭시
    $("button#aocldcnlth").click(function(){
    	webSocket.send("대기실 함수 없애기");
    	location.href="yun_UpdonwReady.jsp";
    });
    
    // ================== SEND 함수 STRATE ==========================
    function send() {
    	
    	//objDiv.scrollTop = objDiv.scrollHeight;
    	var message = inputMessage.value;
    	var message_len = inputMessage.value.length;
    	alert("message_len = " + message_len);
    	alert("num_check = " + num_check);
    
    	//alert("message = " + message);
    						//스크롤이 생겻을경우 스크롤를 맨아래로 이동시켜주는함수.
    	 if(game_END == -1){
    					//게임 진행중.일땐 game_END을 == -1 해줌으로써 게임의 룰에 따라 채팅을 제약시킨다.
    	// 스크롤바 자동으로 아래로내리게해주기.
    	//alert(message_len);
    	if(ten == "내턴이 아닐때는 내가 못합니다 !##!%%^&"){
     		//alert("상대방의 차례입니다.");
     		textarea.value += "상대방의 차례입니다. \n"
     		inputMessage.value = "";
     	}
    	else if(ten == "내턴입니다 $&*@&$*@$&*@$&@*"){
     		if(message == ""){
   	    	 textarea.value += "내용을 입력해주세요. \n";
     	}else if(message != ""){//text창 value값 가져오기
     		//alert("여기들어오겟지")
    		 // text창의 value값의 길이가져오기
    						
            for(i=0; i<message_len; i++){
            	alert(1);
            	var c = inputMessage.value.charAt(i);
            	if(!isNaN(message)){ //숫자인지 아닌지 판별
            		alert(2);
            		num_check++;
            	}else{ /* 숫자가아니면 num_check를 -1 를 해줘서 다시 입력하게만든다. */
            		num_check = -1;
            		 textarea.value += "숫자만 입력해주세요.\n";
            		 inputMessage.value = "";
            		 break;
            	}
  	          }
    		
        	if(num_check == message_len){ 
        			// 입력한값이 모두 숫자가맞으면 조건에 들어옴
        if(Number(message) >= 1 && Number(message) <= 100){
        			// message_len는 내가 입력한 문자의 길이
        			// num_check는 내가 입력한게 모두 숫자이면 해줘서 입력한 길이값이랑 맞을경우 이조건 에들어오게한다.
        textarea.value += "나 : " + message + "\n";
        //ten = message;
        	//	ten 메세지를 입력받는다.
         if(message == random){
        	webSocket.send(message);
			win();
        }else if(Number(message) > Number(random)){
        	textarea.value+="message 보다 작습니다. \n"
        	webSocket.send(message);
        }else if(Number(message) < Number(random)){
        	textarea.value+="message 보다 큽니다. \n"
            	webSocket.send(message);
        }
 //      webSocket.send(inputMessage.value);
 		if(game_END == -1){
       webSocket.send("내턴입니다 $&*@&$*@$&*@$&@*");
       limit=30;
       inputMessage.value = "";
       ten = "내턴이 아닐때는 내가 못합니다 !##!%%^&";
       num_check = 0;
 		}else if(game_END == 2){
 		}
     }else { // 숫자범위가 초과했을경우
    	num_check = 0;
    	textarea.value += "숫자범위가 초과했습니다 1보다크고 100보다작은 수를 입력햐주세요 \n";
    	inputMessage.value =""
    }
    }else{ // 입력한게 숫자가아닐때
    	num_check = 0;
    	}
     }
     }
    }else{
    	if(message == ""){
    		alert("durldi?")
    		textarea.value += "내용을 입력해주세요. \n"
    		inputMessage.value =""
    	}else {
    		alert("여기/")
    		webSocket.send(my_nmae+" : "+message);
       	 textarea.value += "나 : " + message + "\n";
       	 inputMessage.value =""
    	}
   	 }
    }
    // ================== SEND 함수 END ==========================
    function timer() {
    	 //제한시간 쓰레드를 돌려준다.
    	document.getElementById("time").innerHTML = limit;
    	limit--;
    	}
    
   function defeated(){
	   clearInterval(_timer);
	   //$("#time").remove();
	   alert("패배하였습니다");
	    // 패배할시 오는 함수
		   	$.ajax({
				url:"yun_Updown.DB.jsp",
				type:"get",
				data:"result=defeated",
				success:function(data, status, xhr){
			//		alert("접근성공")
				},error:function(){
			//		alert("통신실패")
				}
			});
			
			textarea.value+="상대가 정답을 맞췄습니다. 패배 하셨습니다. \n게임이 끝났습니다 지금부터 채팅이 가능하십니다. \n"
			   game_END = 2;
   }
   
   function win(){
	   clearInterval(_timer);
	//   $("#time").remove();
	   alert("승리하였습니다");
	   // 승리했을경우 오는함수.
   	$.ajax({
		url:"yun_Updown.DB.jsp",
		type:"get",
		data:"result=win",
		success:function(data, status, xhr){
			//alert("접근성공")	
		},error:function(){
			//alert("통신실패")
		}
	});
	   if(onMesage == "나가기!$%&@%@$^"){
		   textarea.value+="상대방이 나갔습니다. \n 게임에서 승리하셨습니다. \n"
	   }else{
	   textarea.value+="승리 하셨습니다. \n게임이 끝났습니다 지금부터 채팅이 가능하십니다. \n"
	   }
   	game_END = 2;
   }
   

   
   function shbu(){
	   // 쓰레드를 1초씪 돌려줘서 제한시간 오버시 패배또는 승리함수에접근
	   if(ten=="내턴이 아닐때는 내가 못합니다 !##!%%^&" && limit <= 0){
		   clearInterval(_shbu);
		   win();
	   }else if(ten=="내턴입니다 $&*@&$*@$&*@$&@*" && limit <= 0){
		   clearInterval(_shbu);
		   defeated();
	   }
	   //clearInterval == 쓰레드를멈추는함수
 }
   
	function enterkey(){
		if (window.event.keyCode == 13) {
			send();
       }
	}	
  </script>
</body>



</html>