<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body oncontextmenu="return false">
<button onclick="fun(this)" value="start">게임시작!</button>
<button>게임방법</button>
<button>나가기</button>
	<div class="col-md-offset-1" style="width: 50px">
		<fieldset>
			<textarea id="messageWindow" rows="10" cols="50" readonly="true" style="overflow-y: "></textarea>
			<br /> <input id="inputMessage" type="text" /> <input type="submit"
				value="send" onclick="send()" />
		</fieldset>
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