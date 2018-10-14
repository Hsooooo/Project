<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	//MemberDto mem = (MemberDto)request.getAttribute("mem");
	MemberDto mem = (MemberDto) session.getAttribute("login");
	System.out.println("yun_Udonw.jsp dto = " + mem.toString());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body oncontextmenu="return false">
	<img alt="사진없음" src="./image/neco.gif" id="loding">
	<div class="col-md-offset-1" ">
		<fieldset>
			<textarea id="messageWindow" rows="10" cols="50" readonly="true" style="overflow-y: "></textarea>
			<br /> <input id="inputMessage" type="text" /> <input type="submit"
				value="send" onclick="send()" />
		</fieldset>
	</div>
	<br>
	<button>나가기</button>
	<span> 제한시간:
		<h5 id="time"></h5>
	</span>
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
	

	<script type="text/javascript">
	var objDiv = document.getElementById("messageWindow"); 
	
	var my_nmae = <%=mem.getId()%>
    var random = ""; //ten의 값이 정해지면 ten의 값을 바꿀수없에 해주는변수
    var ten = "my"; // 상대턴인지 내턴인지 확인하는작업.
    var limit = 30; // 제한시간 30초
    var num_check=0; // 숫자인지 비교해주는 함수.
    var game_END = -1;
    var _shbu = setInterval("shbu()",1000);
     			// 제한시간 다됫는지 체크하는함수
    var _timer = setInterval("timer()",1000);
     			// 제한시간 지나가게하는 함수
    	$(".col-md-offset-1").hide();
    	$("span").hide();
    
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
    	
    	
    	// 제한시간 초기화
    	if(game_END==-1){
    	limit=30;
    	if(event.data == "my" ||event.data == "you"){
    	ten = event.data;
    	//alert("ten = "+ten);
    	}else if(random ==""){
    		//setInterval("timer()",1000); 한번작동하면 그함수는 계속작동한다.
    		random = event.data;
    		textarea.value += "상대를찾았습니다 \n";
    		$("#loding").remove();
    		$(".col-md-offset-1").show();
    		$("span").show();
    		
    	}else if((event.data == "넌 졌어 이색기야!@#&$*!")||(ten=="my" && limit==0)){
    		defeated();
    	}else if(event.data == "나가기"){
    		alert("상대방께서 방에서 나갔습니다. 대기실로이동합니다.");
    		win();
    		//location.href="yun_UpdonwReady.jsp"
    		
    	}
    	}else{
        textarea.value +=event.data + "\n";
    	}
    }
    
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
    
    function onError(event) {
      alert(event.data);
    }
   
    // 나가기버튼 클릭시
    $("button").click(function(){
    	
    	defeated();
    	alert("기권패 당하셨습니다. 대기실로이동합니다.");
    	webSocket.send("나가기");
    	location.href="yun_UpdonwReady.jsp";
    	});
    
    // ================== SEND 함수 STRATE ==========================
    function send() {
    	
    	 if(game_END == -1){
    	objDiv.scrollTop = objDiv.scrollHeight;
    	// 스크롤바 자동으로 아래로내리게해주기.
    				
    	//alert(message_len);
    	if(ten == "my"){
    		var message = inputMessage.value;
    						//text창 value값 가져오기
    		var message_len = inputMessage.value.length;
    						// text창의 value값의 길이가져오기
            for(i=0; i<message_len; i++){
            	var c = inputMessage.value.charAt(i);
            	
            	if(!isNaN(message)){ 
            					/* 숫자인지 아닌지판별 */
            		num_check++;
            	}else{
            						/* 숫자가아니면 num_check를 -1 를 해줘서 다시 입력하게만든다. */
            		num_check = -1;
            		 textarea.value += "숫자만 입력해주세요.\n";
            		 inputMessage.value = "";
            		 break;
            	}
  	          }
    		
            //alert("number_check = "+num_check + "inpuMessage.value.length = " + inputMessage.value.length);
        	if(num_check == message_len){ 
        			// 입력한값이 모두 숫자가맞으면 조건에 들어옴
        	if(Number(message) >= 1 && Number(message) <= 100){
        			// message_len는 내가 입력한 문자의 길이
        			// num_check는 내가 입력한게 모두 숫자이면 해줘서 입력한 길이값이랑 맞을경우 이조건 에들어오게한다.
        textarea.value += "나 : " + message + "\n";
        ten = message;
        	//	ten 메세지를 입력받는다.
         if(message == random){
        	webSocket.send("넌 졌어 이색기야!@#&$*!");
        	
        	//alert("정답입니다.!");
        	//alert("게임이 끝낫습니다.")
			win();
        }else{
        	alert("틀렷습니다");
        }
 //      webSocket.send(inputMessage.value);
       webSocket.send("my");
       limit=30;
       inputMessage.value = "";
        ten = "you";
    }else { // 숫자범위가 초과했을경우
    	num_check = 0;
    	textarea.value += "숫자범위가 초과했습니다 1보다크고 100보다작은 수를 입력햐주세요 \n";
    }
    }else{ // 입력한게 숫자가아닐때
    	num_check = 0;
    }
    }else if(ten == "you"){
    		//alert("상대방의 차례입니다.");
    		textarea.value += "상대방의 차례입니다. \n"
    	inputMessage.value = "";
    	}
        	
    }else{
    	webSocket.send(my_nmae+" : "+inputMessage.value);
    	 textarea.value += "나 : " + inputMessage.value + "\n";
    	 inputMessage.value =""
    	}
    }
    // ================== SEND 함수 END ==========================
    function timer() {
    	 //제한시간 쓰레드를 돌려준다.
    	document.getElementById("time").innerHTML = limit;
    	limit--;
    	}
    
   function defeated(){
	   $("#time").remove();
	   alert("패배하였습니다");
	    // 패배할시 오는 함수
		   	$.ajax({
				url:"yun_Updown.DB.jsp",
				type:"get",
				data:"result=defeated",
				success:function(data, status, xhr){
					alert("접근성공")
				},error:function(){
					alert("통신실패")
				}
			});
	    end();
   }
   
   function win(){
	   $("#time").remove();
	   alert("승리하였습니다");
	   // 승리했을경우 오는함수.
   	$.ajax({
		url:"yun_Updown.DB.jsp",
		type:"get",
		data:"result=win",
		success:function(data, status, xhr){
			alert("접근성공")	
		},error:function(){
			alert("통신실패")
		}
	});
	   end();
   }
   
   function end(){	
	   alert("게임이끝낫습니다");
	   var v = confirm("게임이 끝낫습니다 상대와 대화하시시겠습니까?");
	   alert(v);
	//   if(confirm("게임이 끝났습니다 상대와 대화를 하시겠습니까?")){
		   game_END = 2;
	 //  }else{
		   /* alert("대기실로이동합니다.");
		   webSocket.send("나가기");
		   location.href="yun_UpdonwReady.jsp"; */
	  // }
   }
   
   function shbu(){
	   // 쓰레드를 1초씪 돌려줘서 제한시간 오버시 패배또는 승리함수에접근
	   if(ten=="you" && limit <= 0){
		   alert("잠시만");
		 //  $("#time").remove();
		   //win();
		   clearInterval(_timer);
		// 타이머중지
		   clearInterval(_shbu);
		// 현재 메소드 중지
		   win();
		    
	   }else if(ten=="my" && limit <= 0){
		   alert("잠시만");
		 //  $("#time").remove();
		   //defeated();
		   clearInterval(_timer);
		   clearInterval(_shbu);
		   defeated();
	   }
	   //clearInterval == 쓰레드를멈추는함수
 }
  </script>
</body>



</html>