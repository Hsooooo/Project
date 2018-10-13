<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <%
  //MemberDto mem = (MemberDto)request.getAttribute("mem");
  MemberDto mem = (MemberDto)session.getAttribute("login");
  System.out.println("yun_Udonw.jsp dto = " + mem.toString());
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body oncontextmenu="return false">
<img alt="사진없음" src="./image/neco.gif" id="loding">
<div class="col-md-offset-1">
    <fieldset>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" />
    </fieldset>
   </div>
   <br>
 <span>  제한시간:<h5 id="time"></h5> </span>
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

</script>


   <script type="text/javascript">
    var random = ""; //ten의 값이 정해지면 ten의 값을 바꿀수없에 해주는변수
    var ten = "my";
    var limit = 30;
    var _setInterval = setInterval("shbu()",1000);
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
    	limit=30;
    	
    	
    	if(event.data == "my" ||event.data == "you"){
    	ten = event.data;
    	//alert("ten = "+ten);
    	}else if(random ==""){
    		setInterval("timer()",1000);
    		random = event.data;
    		textarea.value += "상대를찾았습니다";
    		$("#loding").remove();
    		$(".col-md-offset-1").show();
    		$("span").show();
    		
    	}else if((event.data == "넌 졌어 이색기야!@#&$*!")||(ten=="my" && limit==0)){
    		defeated();
		
    	}
        textarea.value += "상대 : " + event.data + "\n";
    }
    
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
    
    function onError(event) {
      alert(event.data);
    }
    
    function send() {
    	if(ten == "my"){
        textarea.value += "나 : " + inputMessage.value + "\n";
        ten = inputMessage.value;
         if((inputMessage.value == random)||(ten=="you"&&limit==0)){
        	webSocket.send("넌 졌어 이색기야!@#&$*!");
        	alert("정답입니다.!");
        	alert("게임이 끝낫습니다.")
			win();
        }else{
        	alert("틀렷습니다");
        }
        
       webSocket.send(inputMessage.value);
       webSocket.send("my");
       limit=30;
        inputMessage.value = "";
        ten = "you";
		}
    	else if(ten == "you"){
    		alert("상대반의 차례입니다.");
    	inputMessage.value = "";
    	}
    }
    function timer() {
    	document.getElementById("time").innerHTML = limit;
    	limit--;
    	}
    	
    
   function defeated(){
		$(function(){
			$.ajax({
				url:"yun_Updown.DB.jsp",
				type:"get",
				data:"result=defeated",
				success:function(data, status, xhr){
				},
				error:function(){
				}
			});
		});
   }
   
   function win(){
   	$.ajax({
		url:"yun_Updown.DB.jsp",
		type:"get",
		data:"result=win",
		success:function(data, status, xhr){
			alert("접근성공")
		},error:function(){
			alert("통신실패")
		}
	})
   }
   
   function shbu(){
	   if(ten=="you" && limit == 0){
		   $("#time").remove();
		   win();
		   clearInterval(_setInterval);
	   }else if(ten=="my" && limit == 0){
		   $("#time").remove();
		   defeated();
		   clearInterval(_setInterval);
	   }
   }
 


  </script>
</body>


    
</html>