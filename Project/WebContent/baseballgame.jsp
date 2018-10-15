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

body, body * { 
	 margin: 0px; padding: 0px; 
	 font-family: 'New Gulim', '새굴림', Gulim, Arial, sans-serif; 
	 font-size: 12px; 
	 line-height: 1.7; 
} 

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
<div>
	<h1>내 보유 포인트</h1>
	point :<p id="pointHtml"> <%=point %></p>

</div>
<div style="float: left;">
	 <p>0 ~ 9 중에서 숫자를 입력한 후, "결과 보기" 버튼을 누르세요. </p>

	 <!-- ──────────────── 입력 부분 ──────────────── --> 
	 <form id="formArea">
		 <input type="text" class="text" /><input type="text" class="text" />
		 <input type="text" class="text" /><input type="text" class="text" />
	 </form>
	<p>베팅 포인트 </p>
	<select id="betSel">
		<option value="1000">1000</option>
		<option value="2000">2000</option>
		<option value="5000">5000</option>
		<option value="10000">10000</option>
		<option value="20000">20000</option>
	</select>
	<button id="betBtn">베팅하기</button>
	<br>
	 <button id="resultBtn" onclick="bullsAndCows()" disabled> 결과 보기 </button>
	 <button onclick="reStarting(); deleteText()"> 새로 시작하기 </button>

	 <p id="check_Correct"></p>
</div>


<table style="float: left;width: 300px" border="1">
	 <thead><tr><th colspan="3"> SCORE </th></tr></thead>

	 <!-- ──────────────── 출력 부분 ──────────────── --> 
	 <tbody id="tbodyArea">
		 <tr><td> 50배 </td><td style="width: 60px;">&nbsp;</td><td style="width: 125px;">&nbsp;</td></tr>
		 <tr><td> 20배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 10배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 5배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 2배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 1.2배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 원금 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 0.5배 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 0.2배</td><td>&nbsp;</td><td>&nbsp;</td></tr>
	 </tbody>

</table>

<p style="clear: both"><p>

<script type="text/javascript">
jQuery(function(){
	$("#betBtn").click(function(){
		$("#resultBtn").attr('disabled',false);
		$("#betBtn").attr('disabled',true);
		$("#betSel").attr('disabled',true);
		var betMinus = <%=mem.getPoint() %> - $("#betSel").val();
		$("#pointHtml").html(betMinus);
		var id = "<%=mem.getId() %>";
		$.ajax({
			url:"betAf.jsp",
			type:"get",
			data:"point=" + $("#pointHtml").html() + "&id=" + id,
			success : function(){ 
 	           alert('성공!');
			}, 
			error : function(){ 
 	        	alert('실패 ㅠㅠ'); 
			}
		});
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
			 alert("정답");
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
		 	           $("#pointHtml").html(<%=mem.getPoint() %>);
					}, 
					error : function(){ 
		 	        	alert('실패 ㅠㅠ'); 
					}
				});
			 text = final2 + "정답은 " + question + " 입니다."; 
		 } 
		 else { text = final2; } 
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