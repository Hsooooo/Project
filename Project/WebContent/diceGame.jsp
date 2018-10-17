<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="dao.DiceDao"%>
<%@page import="dao.iDiceDao"%>
<%@page import="dto.DiceDto"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
request.setCharacterEncoding("utf-8");
Object ologin = session.getAttribute("login");
MemberDto mem = null;
mem = (MemberDto)ologin;
<<<<<<< HEAD

String id = mem.getId();
int point = mem.getPoint();

iMemberDao dao = MemberDao.getInstance();
boolean up = dao.diceUpdate(id, point);
if(up){
	System.out.println("[MEMBER] diceUpdate : 포인트 동기화 완료");
} else {
	System.out.println("![MEMBER] diceUpdate : 포인트 동기화 실패!");
}


///DICE 테이블 데이터 가져오기.
iDiceDao dice = DiceDao.getInstance();
DiceDto ddto=dice.reDice(mem.getId());
System.out.println(ddto.getId() + ", " +ddto.getCurpoint());



 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diceGame.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<div align = "right">

<button onclick="location.href='myPage.jsp'">마이페이지</button>
</div>

<div align = "center">
<h1>주사위 게임을 시작합니다.</h1><br>
상대 플레이어 수를 고르세요 
<select id="player">
<option value="0" selected>선택</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select>
<br><br>

<br><br>
배팅할 금액을 입력하세요<br>
<p id = "info"><%=mem.getNickname() %>(<%=mem.getId() %>)님의 현재 가용 포인트 : <b><%=ddto.getCurpoint() %></b></p>
<input type="text" id = "betpoint" size="20">
<button id = "bet">배팅</button>&nbsp;<button id="fillpoint" onclick="location.href='fillpoint.jsp'">충전하기</button>
<br><br>

<br><br>
주사위를 굴리려면 버튼을 누르세요
<br><br>
<button id = "roll">ROLL IT!</button>&nbsp;&nbsp; <!-- 주사위 굴리기  -->
<button id = "reset" onclick="location.reload()">Reset</button> <!-- 처음으로 -->
<br><br>
<br><br>
<img id = "userImg" alt="" src="./Dice1.gif" width="100" height="100"> <!--유저 주사위 이미지  -->
<br><br>
<p id = "img"></p> <!-- 플레이어 수 선택값에 따른 이미지 추가될 자리 -->
<button id = "exit">그만하기</button>
</div>




<script type="text/javascript">
$("select").on("change", function() { // 플레이어 수 선택하면 진입

	$("select").prop("disabled",true); // 드롭다운 비활성화
	
	 var player = this.value; // 플레이어 선택값 저장
	/* alert(player); */
	 var img = '<img alt="" src="./Dice1.gif" width="80" height="80"'; // 주사위 이미지 추가용 

	 for(var i = 1 ; i <= player; i ++){ // 선택한 플레이어 수에 따라 주사위 이미지 추가
		 $("#img").append(img + "name="+i+">&nbsp;");		 
	 }


	});
	
	
	
 $("#betpoint").on("click keyup input", function () { // 배팅할 포인트 입력하는 텍필 이벤트 감지
	
	var curpoint =<%=ddto.getCurpoint()%>; // 가용포인트 저장
	
	if(curpoint==0){
		$("#bet").prop("disabled", true); // 포인트 0이면 배팅 버튼 비활성화
		$("#betpoint").prop("disabled", true); // 텍필도 비활성화
	}
}); 

 
 
$("#bet").click(function () { // 배팅 버튼 클릭시 진입
	
	// 1. 배팅할 포인트 텍필값 넘기기
	var betpoint = $("#betpoint").val(); // 배팅할 포인트 가겨오기
	var id = "<%=mem.getId() %>"; /*  세션id 가져오기 */
	var curpoint = "<%=ddto.getCurpoint()%>"; /*   가용포인트 가져오기 */
	
	var alldata1 = { "id" : id, "curpoint" : curpoint};
	$.ajax({
		
		url : "diceAdd.jsp",
		type : "GET",
		data : alldata1,
		success : function (data) {
			alert("dice db에 추가 완료!");
				
		},
		error : function () {
			alert("dice db 추가 에러!");
		}
	});
	
	
	var alldata2 = { "id" : id, "betpoint" : betpoint};
	//$("#info b").text(curpoint-betpoint); // 가용포인트 태그값을 가용포인트-배팅할 포인트 값으로 바꿈	
	
	$.ajax({
		
		url : "diceBet.jsp",
		type : "GET",
		data : alldata2,
		success : function (data) {
			alert(betpoint+"원 배팅 완료!");
				
		},
		error : function () {
			alert("배팅 에러!");
		}
	});
	

});


$("#roll").click(function() { // roll it 버튼 클릭시 진입
 
	 // 1. 드롭다운서 선택한 플레이어 수 가져오기
	 var player = $("#player option:selected").val();
	 
	 var usernum = parseInt((Math.random()*6)+1);
	 
	 // 2. 플레이어 수 만큼 랜덤숫자 만들기
	 for(var i = 1; i <= player; i ++){
		
		var comnum = parseInt((Math.random()*6)+1);
 			if(usernum == comnum){ // 3. 유저 숫자와 컴 숫자 중복 방지
				i--;
				break;
			}
		// 4. 주사위 눈 이미지 랜덤숫자에 맞게 바꾸기	
		$("#userImg").attr("src", "./Dice" + usernum + ".gif"); 
 		$("img[name=" +i+ "]").attr("src", "./Dice" + comnum + ".gif" );
	 }
	 
		
	 //플레이어 주사위 숫자 가져와서 배당금 주기
	var comArr = new Array(); // 선택한 플레이어 수만큼 생성된 주사위 이미지 경로들을 저장하기 위한 배열
	//var comImg = new Array(); // 이미지 경로에서 바뀌는 숫자 하나만 저장하기 위한 
	var betpoint = $("#betpoint").val(); // 배팅할 포인트 가겨오기
	var comNum;
	 	var earned = 0;
	 	var win =0;
	 	var lose =0;
	 	 
	 for( i = 1; i<= player; i++){
		 comArr[i] = $("img[name=" + i + "]").attr("src"); // 주사위 이미지 파일경로 가져옴.
	 	comNum = comArr[i].replace(/[^1-6]/g,""); // 파일경로에서 숫자만 뽑음
	 
	 	 if(usernum > comNum){
	 			earned += Math.floor(betpoint*1.1); // 소숫점 버림 
	 			win++;
	 
	 		} else{
	 			earned = 0;
	 			lose++;
	 		} 
	 }
	 alert("result : " + win+ "승" +lose+ "패,  earned : " + earned +"원" );
	
	 
	 var id = "<%=mem.getId() %>"; /*  세션id 가져오기 */
	 var alldata = { "id" : id, "win" : win, "lose" : lose, "earned" : earned};
	 
		$.ajax({
			
			url : "diceBetAf.jsp",
			type : "GET",
			data : alldata,
			success : function (data) {
				alert("배당금  : "+ earned + "원이 적립됐습니다.");
			
				
			},
			error : function () {
				alert("배당금 적립 에러!");
			}
		});	
	 
});

// dice 추가시 이미 존재한 레코드인 경우에
// DiceAdd failed : java.sql.SQLIntegrityConstraintViolationException: ORA-00001: unique constraint (HR.SYS_C007309) violated 뜸--> insert를 merge로 바꾸기(해결)

// 새로고침하거나, reset 누르면 갱신된 포인트로 표시돼야 함.(해결)


$("#exit").click(function () { //게임 종료 버튼 클릭시 Dice 테이블의 포인트 ----> Member로 동기화하기 위함.

	var id = "<%=mem.getId()%>";
	var totalpoint = "<%=ddto.getCurpoint()%>";
	var pointdata = { "id" : id, "totalpoint" : totalpoint };
	
	$.ajax({
		
		url : "diceClose.jsp",
		type : "GET",
		data : pointdata,
		success : function (data) {
			alert("포인트" + totalpoint+" 동기화 완료");

=======
String id = mem.getId();
int point = mem.getPoint();
iMemberDao dao = MemberDao.getInstance();
boolean up = dao.diceUpdate(id, point);
if(up){
	System.out.println("[MEMBER] diceUpdate : 포인트 동기화 완료");
} else {
	System.out.println("![MEMBER] diceUpdate : 포인트 동기화 실패!");
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diceGame.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<%
///DICE 테이블 데이터 가져오기.
iDiceDao dice = DiceDao.getInstance();
DiceDto ddto=dice.reDice(mem.getId());
System.out.println(ddto);
if(ddto == null){
	%>
	
	<script type="text/javascript">
	
	jQuery(document).ready(function( $ ) {
		var id = "<%=mem.getId() %>" ;
		var point = "<%=mem.getPoint() %>";
		var alldata0 = { "id" : id, "point" : point};
		location.href = "diceInit.jsp?id="+id+"&point="+point;
		/* $.ajax({
			url : "diceInit.jsp",
			type : "GET",
			data : alldata0,
			success : function (data) {
				alert("dice db에 추가/업데이트 완료!");
				location.href="diceGame.jsp";
					
			},
			error : function () {
				alert("dice db 추가/업데이트 에러!");
				location.href="index.jsp";
			}
		}); */
    });
	
	</script>
	<%
}
System.out.println(ddto.getId() + ", " +ddto.getCurpoint());
 %>
<div align = "center">
<h1>주사위 게임을 시작합니다.</h1><br>
상대 플레이어 수를 고르세요 
<select id="player">
<option value="0" selected>선택</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
</select>
<br><br>

<br><br>
배팅할 금액을 입력하세요<br>
<p id = "info"><%=mem.getNickname() %>(<%=mem.getId() %>)님의 현재 가용 포인트 : <b><%=ddto.getCurpoint() %></b></p>
<input type="text" id = "betpoint" size="20">
<button id = "bet">배팅</button>&nbsp;<button id="fillpoint" onclick="location.href='fillpoint.jsp'">충전하기</button>
<br><br>

<br><br>
주사위를 굴리려면 버튼을 누르세요
<br><br>
<button id = "roll">ROLL IT!</button>&nbsp;&nbsp; <!-- 주사위 굴리기  -->
<button id = "reset" onclick="location.reload()">Reset</button> <!-- 처음으로 -->
<br><br>
<br><br>
<img id = "userImg" alt="" src="./Dice1.gif" width="100" height="100"> <!--유저 주사위 이미지  -->
<br><br>
<p id = "img"></p> <!-- 플레이어 수 선택값에 따른 이미지 추가될 자리 -->
<button id = "exit">그만하기</button>
</div>




<script type="text/javascript">
$("select").on("change", function() { // 플레이어 수 선택하면 진입
	$("select").prop("disabled",true); // 드롭다운 비활성화
	
	 var player = this.value; // 플레이어 선택값 저장
	/* alert(player); */
	 var img = '<img alt="" src="./Dice1.gif" width="80" height="80"'; // 주사위 이미지 추가용 
	 for(var i = 1 ; i <= player; i ++){ // 선택한 플레이어 수에 따라 주사위 이미지 추가
		 $("#img").append(img + "name="+i+">&nbsp;");		 
	 }
	});
	
	
	
 $("#betpoint").on("click keyup input", function () { // 배팅할 포인트 입력하는 텍필 이벤트 감지
	
	var curpoint =<%=ddto.getCurpoint()%>; // 가용포인트 저장
	
	if(curpoint==0){
		$("#bet").prop("disabled", true); // 포인트 0이면 배팅 버튼 비활성화
		$("#betpoint").prop("disabled", true); // 텍필도 비활성화
	}
}); 
 
 
$("#bet").click(function () { // 배팅 버튼 클릭시 진입
	
	// 1. 배팅할 포인트 텍필값 넘기기
	var betpoint = $("#betpoint").val(); // 배팅할 포인트 가겨오기
	var id = "<%=mem.getId() %>"; /*  세션id 가져오기 */
	var curpoint = "<%=ddto.getCurpoint()%>"; /*   가용포인트 가져오기 */
	
	var alldata1 = { "id" : id, "curpoint" : curpoint};
	$.ajax({
		
		url : "diceAdd.jsp",
		type : "GET",
		data : alldata1,
		success : function (data) {
			alert("dice db에 추가 완료!");
				
		},
		error : function () {
			alert("dice db 추가 에러!");
		}
	});
	
	
	var alldata2 = { "id" : id, "betpoint" : betpoint};
	//$("#info b").text(curpoint-betpoint); // 가용포인트 태그값을 가용포인트-배팅할 포인트 값으로 바꿈	
	
	$.ajax({
		
		url : "diceBet.jsp",
		type : "GET",
		data : alldata2,
		success : function (data) {
			alert(betpoint+"원 배팅 완료!");
				
		},
		error : function () {
			alert("배팅 에러!");
		}
	});
	
});
$("#roll").click(function() { // roll it 버튼 클릭시 진입
 
	 // 1. 드롭다운서 선택한 플레이어 수 가져오기
	 var player = $("#player option:selected").val();
	 
	 var usernum = parseInt((Math.random()*6)+1);
	 
	 // 2. 플레이어 수 만큼 랜덤숫자 만들기
	 for(var i = 1; i <= player; i ++){
		
		var comnum = parseInt((Math.random()*6)+1);
 			if(usernum == comnum){ // 3. 유저 숫자와 컴 숫자 중복 방지
				i--;
				break;
			}
		// 4. 주사위 눈 이미지 랜덤숫자에 맞게 바꾸기	
		$("#userImg").attr("src", "./Dice" + usernum + ".gif"); 
 		$("img[name=" +i+ "]").attr("src", "./Dice" + comnum + ".gif" );
	 }
	 
		
	 //플레이어 주사위 숫자 가져와서 배당금 주기
	var comArr = new Array(); // 선택한 플레이어 수만큼 생성된 주사위 이미지 경로들을 저장하기 위한 배열
	//var comImg = new Array(); // 이미지 경로에서 바뀌는 숫자 하나만 저장하기 위한 
	var betpoint = $("#betpoint").val(); // 배팅할 포인트 가겨오기
	var comNum;
	 	var earned = 0;
	 	var win =0;
	 	var lose =0;
	 	 
	 for( i = 1; i<= player; i++){
		 comArr[i] = $("img[name=" + i + "]").attr("src"); // 주사위 이미지 파일경로 가져옴.
	 	comNum = comArr[i].replace(/[^1-6]/g,""); // 파일경로에서 숫자만 뽑음
	 
	 	 if(usernum > comNum){
	 			earned += Math.floor(betpoint*1.1); // 소숫점 버림 
	 			win++;
	 
	 		} else{
	 			earned = 0;
	 			lose++;
	 		} 
	 }
	 alert("result : " + win+ "승" +lose+ "패,  earned : " + earned +"원" );
	
	 
	 var id = "<%=mem.getId() %>"; /*  세션id 가져오기 */
	 var alldata = { "id" : id, "win" : win, "lose" : lose, "earned" : earned};
	 
		$.ajax({
			
			url : "diceBetAf.jsp",
			type : "GET",
			data : alldata,
			success : function (data) {
				alert("배당금  : "+ earned + "원이 적립됐습니다.");
			
				
			},
			error : function () {
				alert("배당금 적립 에러!");
			}
		});	
	 
});
// dice 추가시 이미 존재한 레코드인 경우에
// DiceAdd failed : java.sql.SQLIntegrityConstraintViolationException: ORA-00001: unique constraint (HR.SYS_C007309) violated 뜸--> insert를 merge로 바꾸기(해결)
// 새로고침하거나, reset 누르면 갱신된 포인트로 표시돼야 함.(해결)
$("#exit").click(function () { //게임 종료 버튼 클릭시 Dice 테이블의 포인트 ----> Member로 동기화하기 위함.
	var id = "<%=mem.getId()%>";
	var totalpoint = "<%=ddto.getCurpoint()%>";
	var pointdata = { "id" : id, "totalpoint" : totalpoint };
	
	$.ajax({
		
		url : "diceClose.jsp",
		type : "GET",
		data : pointdata,
		success : function (data) {
			alert("포인트" + totalpoint+" 동기화 완료");
>>>>>>> refs/remotes/origin/hs2
		
			
		},
		error : function () {
			alert("!포인트 동기화 에러!");
		}
	});	
});
	 
	
</script>

</body>
</html>