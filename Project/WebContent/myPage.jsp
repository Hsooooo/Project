<%@page import="dto.AuthorizeDto"%>
<%@page import="dao.AuthorizeDao"%>
<%@page import="dao.iAuthorizeDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
Object ologin = session.getAttribute("login");
MemberDto mem = (MemberDto)ologin;

String id = mem.getId();
String nickname = mem.getNickname();
int point = mem.getPoint();
int money = mem.getMoney();

// STATUS 가져오기. 이미 들어가있으면 상관 없는데, 최초로 충전/환전하는 경우에는 AUTHORIZE에 들어가있는 데이터가 없어서 NULLPOINT뜸.
// -> mypage 진입할 때 그냥 AUTHORIZE에 무조건 행추가 해줘야함. id, up_date, fill_money, to_money, status를 id, sysdate, 0, 0, 9로 초기화함.
// mypage에서 충전이나 환전 버튼을 눌러야지만 status가 9 -> 0(승인대기중)으로 바뀜.

iAuthorizeDao auth = AuthorizeDao.getInstance();

boolean addrowS = auth.addRow(id);
if(addrowS){
	System.out.println("[AUTHORIZE] mypage용 신규행 추가/업데이트 성공");
} else {
	System.out.println("[AUTHORIZE] mypage용 신규행 추가/업데이트 실패");
}


AuthorizeDto dto = auth.getRow(id);

int status = dto.getStatus();
System.out.println(status);

%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myPage.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<h1>충전하기</h1>

<h3><b><%=nickname %>(<%=id %>)</b>님이 현재 보유하신 금액은 <%=money %>원 입니다</h3>
<br><br>
<input type="radio" name="fill_money" value="5000" checked>5,000원<br>
<input type="radio" name="fill_money" value="10000">10,000원<br>
<input type="radio" name="fill_money" value="30000">30,000원<br>
<input type="radio" name="fill_money" value="50000">50,000원<br>
<input type="radio" name="fill_money" value="100000">100,000원<br>
<br><br>
<input type="button" id="fill_btn" value="충전하기">


<br><br><br>
<h1>포인트로 전환</h1>
<h3><b><%=nickname %>(<%=id %>)</b>님이 현재 보유하신  금액은  <%=money %>원,  포인트는  <%=point %>점 입니다</h3><!--[MEMBER]에 저장된 MONEY, POINT  -->
<br><br>
보유금액 <%=money %>원 중 &nbsp;<input type="text" id="to_point">원을 포인트로 바꿉니다.<br><!-- 텍필 클릭해서 액수 입력하고, 다른데 클릭해서 벗어나면 예상금액 뜨게? -->
전환 후 예상 포인트 :<p id ="expected_point"></p> 
잔여 금액 :<p id="rest_money"></p><br><br>

계속하시려면 아래 버튼을 누르세요.
<br><br>
<input type="button" id="to_point_btn" value="포인트로 전환하기">


<br><br><br>
<h1>환전하기</h1>
<h3><b><%=nickname %>(<%=id %>)</b>님이 현재 보유하신 포인트는  <%=point %>점, 환전 가능 포인트는  <%=point %>점 입니다</h3> <!--롤링 : 롤링 100%면 충전한 금액의 100% 따야 환전가능.  -->
<br><br>
보유 포인트  <%=point %>점 중 <input type="text" id="to_money">점을 환전합니다.<br>
전환 후 예상 보유 금액 : <p id="expected_money"></p>
잔여 포인트 : <p id ="rest_point"></p>

<br><br>
계속하시려면 아래 버튼을 누르세요.
<br><br>
<input type="button" id="to_money_btn" value="환전하기">


<script type="text/javascript">
var status = "<%=status%>";
/////////////////////////////// money 충전하기///////////////////////////

$("#fill_btn").click(function () {// 충전하기 버튼 클릭시 진입

	/// 승인 확인부터
	
	if(status==0){ // = 승인 대기중이면
		alert("이미 승인 대기중입니다. 관리자에게 문의하세요.");
		$("input[name='fill_money']").prop("disabled", true); // 라디오버튼 비활성화
		$("#fill_btn").prop("disabled", true); // 버튼 비활성화
	
	} else { 
	
	var fill_money = $('input[name="fill_money"]:checked').val();
	alert(fill_money);
	
	var id = "<%=id %>";
	var data1 = { "id" : id, "fill_money" : fill_money };
	
$.ajax({
		
		url : "fillMoney.jsp",
		type : "GET",
		data : data1,
		success : function (data){
				alert(fill_money+ "원 충전 신청이 완료됐습니다. 승인 대기중입니다.");
				location.reload();
				
		},
		error : function () {
			alert("FILL_MONEY db 추가 에러!");
		}		
	});		
	
	}
}); 

///////////////////// 현금 --> 포인트 전환하기 ( 승인 필요 xxx) ////////////////////////
$("#to_point").on("change", function () { // 텍필에 입력하면 값을 가져온다. 

	if(<%=money%> == 0){
		$("#to_point").prop("disabled", true); // 충전 버튼 비활성화
		$("#to_point_btn").prop("disabled", true); // 텍필도 비활성화
	
	}
	var toPoint_val = $("#to_point").val()*1; // 텍필에 입력한 값 저장. -- 숫자로 형변환
	var expected_point = <%=point %> + toPoint_val; // 예상 포인트 : 현재포인트 + 전환포인트
	//alert(expected_point);
	var rest_money = <%=money %> - toPoint_val; // 예상 잔여금액 : 현재금액 - 전환금액(포인트)
	//alert(rest_money);
	
	// p태그값 바꿔주기.
	$("#expected_point").html("&nbsp;<strong>"+expected_point+"</strong>점");
	$("#rest_money").html("&nbsp;<strong>"+rest_money+"</strong>원");
	
//});

	$("#to_point_btn").click(function(){ // 포인트로 전환하기 버튼 클릭시 진입
	
		var toPoint_val = $("#to_point").val();
	
		var id = "<%=id %>";
		var data2 = { "id" : id, "to_point" : toPoint_val };
	
	$.ajax({
		
			url : "toPoint.jsp",
			type : "GET",
			data : data2,
			success : function (data) {
				alert("MEMBER db에 업데이트 완료!");
				location.reload();
				
			},
			error : function () {
				alert("MEMBER db 업데이트 에러!");
			}
		});
	
	});
});


//////////////////////포인트를 현금으로 환전하기////////////////////////////100% 롤링 : 충전금액의 100% 배팅해야 환전 가능.
$("#to_money").on("change", function () {
	
	/// 승인 확인부터
	if(status == 0){ // = 승인 대기중
		alert("이미 승인 대기중입니다. 관리자에게 문의하세요.");
		$("#to_money").prop("disabled", true);
		$("#to_money_btn").prop("disabled", true); // 텍필도 비활성화
	}
	
	else if(<%=point%> == 0){ ////
		$("#to_money").prop("disabled", true); // 충전 버튼 비활성화
		$("#to_money_btn").prop("disabled", true); // 텍필도 비활성화
	
	}
	
	else {
	
	var to_money_val = $("#to_money").val()*1;// 숫자로 형변환
	//alert(to_money_val);
	
	var expected_money = <%=money %> + to_money_val; // 예상 보유금액 : 현재금액 + 환전금액(포인트)
	//alert(expected_money);
	
	var rest_point = <%=point %> - to_money_val; // 예상 잔여 포인트 : 현재포인트 - 현금으로 환전한 포인트
	//alert(rest_point);
	
	// p태그값 바꿔주기.
	$("#expected_money").html("&nbsp;<strong>"+expected_money+"</strong>원");
	$("#rest_point").html("&nbsp;<strong>"+rest_point+"</strong>점");
	
	
	$("#to_money_btn").click(function(){ // 포인트 환전하기 버튼 클릭시 진입
	
	
		var id = "<%=id %>";
		var data3 = { "id" : id, "to_money" : to_money_val  };
		alert("id : " + id + "to_money : " + to_money_val);
		
		$.ajax({
		
			url : "toMoney.jsp",
			type : "GET",
			data : data3,
			success : function (data) {
				alert(to_money+"포인트 환전 신청 완료. 승인 대기중입니다");
				location.reload();
				
			},
			error : function () {
				alert("!포인트 환전 신청 에러!");
			}
		});
	
	});
	}
});
</script>
</body>
</html>