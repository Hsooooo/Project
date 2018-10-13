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
    	$(".col-md-offset-1").hide();
    
        var textarea = document.getElementById("messageWindow");
        // textarea 변수 안에 area입력값을 넣는다. 
        var webSocket = new WebSocket('ws://127.0.0.1:8090/Project/broadcast');
        // webScoket 안에 서버를넣는다.
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
    	//alert(2);
      onError(event);
    };
    webSocket.onopen = function(event) { // 처음 server에 연결됬을때 생기는 이벤트
    //	alert("서버 연결완료");
   // alert("onopen = " + event);
      onOpen(event);
    };
    
    webSocket.onmessage = function(event) { // 다른 client에서 message를 쏴주면 일로옴
    	//alert("메세지를받았습니다");
    	//alert("onmessage = " + event);
      onMessage(event);
    };
    function onMessage(event) {
    	// 이상하게 var 자료형으로 sendObejct로 쏴주는건 받을수가없다.
    	if(event.data == "my" ||event.data == "you"){
    	ten = event.data;
    	alert("ten = "+ten);
    	//alert("if입니다.");
    	//alert("if 의 random 입니다" + random);
    	}else if(random ==""){
    		alert("random = " + event.data);
    		random = event.data;
    		alert("random = "+random);
    		textarea.value += "상대를찾았습니다";
    		$("#loding").remove();
    		$(".col-md-offset-1").show();
    	}else if(event.data == "넌 졌어 이색기야!@#&$*!"){
    		<%
    		System.out.println("제가 진거같습니다");
    		%>
    	}
        textarea.value += "상대 : " + event.data + "\n";
       // alert("onMessage = " + event.data);
    }
    
    function onOpen(event) {
    	//alert("index.jsp = " + ten);
        textarea.value += "연결 성공\n";
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
    	if(ten == "my"){
        textarea.value += "나 : " + inputMessage.value + "\n";
        ten = inputMessage.value;
         if(inputMessage.value == random){
        	webSocket.send("넌 졌어 이색기야!@#&$*!");
        	alert("정답입니다.!");
        	alert("게임이 끝낫습니다.")
        }else{
        	alert("틀렷습니다");
        }
        
        //alert("broadcast ten = " + ten);
        //alert("webSocket.send = " + inputMessage.value);
       webSocket.send(inputMessage.value);
       webSocket.send("my");
        inputMessage.value = "";
        ten = "you";
		}else if(ten == "you"){
    		alert("상대반의 차례입니다.");
    	inputMessage.value = "";
    	//ten = true;
    	}
    }
  </script>
</body>


    
</html>