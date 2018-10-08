<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="http://code.jquery.com/jquery-3.3.1.js"></script>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.text{
	position: static;
 /*float: */
/* margin-right: 100px; */	
  margin: 100px;
  top: 50px;
  
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<div style="width: 400px; height: 300px; border: 1px solid black; float: left;" align="center" >
<p id="main">up down 게임</p>

<br><br><br><br><br><br>
<button id="select">랜덤상대찾기</button>

</div>
<div style="width:200px; height: 300; border: 1px solid; float: left;" id="div2">
	<p>결과</p>
</div>

<!-- <div style="width: 10px">
<textarea rows="13" cols="85"></textarea>
<input type="text">
</div> -->
</div>
<script type="text/javascript">



$(function(){
	
	var i = Math.floor(Math.random() * 10) + 1;
	$("button").click(function(){
		$("button#select").hide();
		$("#main").append("<input type='text' class='text'><button class='text'>입력</button>")
		alert("dㅋzㅋd");
	});
	$(document).on("click","button.text",function(){
		var random = i;
		var _text = $("input.text").val();
		
		if(random == _text){
			alert("??? 승리하였습니다");
			/* location.href="yun_updown.jsp"; */
		}else{
			if(_text>random){
			$("#div2").append(_text+"보다 작습니다. <br>");
			}else if(_text<random){
			$("#div2").append(_text+"보다 큽니다. <br>");	
			}
		}
		
	});
})


</script>
</body>
</html
>