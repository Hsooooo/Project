<%@page import="dto.MemberDto"%>
<%@page import="dto.AuthorizeDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.AuthorizeDao"%>
<%@page import="dao.iAuthorizeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_authorize.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
<h1>충전/환전 관리</h1>
<%
////////////// [AUTHORIZE] 테이블 뿌리기
iAuthorizeDao dao = AuthorizeDao.getInstance();
List<AuthorizeDto> bbslist = dao.getBbsList();
Object ologin = session.getAttribute("login");
MemberDto mem = (MemberDto)ologin; 
%>


<table id="list">
<col width="70"><col width="70"><col width="250"><col width="150"><col width="150"><col width="150"><col width="70"><col width="70">
<tr>
	<th>no.</th><th>아이디</th><th>수정날짜</th><th>충전요청 금액</th><th>환전요청 포인트</th><th>승인확인</th><th></th><th></th>
</tr>
<!-- 승인 확인 : 대기중 0, 거절 -1, 충전요청 승인시 1, 환전요청 승인시 2 -->

<%
int count=0;
if(bbslist == null || bbslist.size() == 0){
	%>
	<tr>
		<td colspan="8" align = "center">No Item</td>
	</tr>
	<%
} else {
	
		for(int i=0;i<bbslist.size();i++){
			AuthorizeDto bbs = bbslist.get(i);
			int status = bbs.getStatus();
		%>
		
		<tr>
			<td align = "center"><%=i+1 %></td> 
			<td id="id"><%=bbs.getId() %></td>
			<td align = "center"><%=bbs.getUp_date() %></td>
			<td align = "center"><%=bbs.getFill_money() %></td>
			<td align = "center"><%=bbs.getTo_money() %></td>
			<td align = "center"><%=bbs.getStatus() %></td>
			<%
				if(status != 0){ // status가 -1, 1, 2 (거절이나 승인)됐으면 버튼 비활성화
					%>
				<td><input type="button" id="ok" value="승인" disabled="disabled"></td>
				<td><input type="button" id="no" value="거절" disabled="disabled"></td>					
				<%
				} else { // status가 0(대기중)이면 버튼 활성화
			%>
			<td><input type="button" id="ok" value="승인"></td>
			<td><input type="button" id="no" value="거절"></td>	
		</tr>
	
	<%
			}
		}
}
%>
</table>


<script type="text/javascript">
/////////////////// 승인 버튼 클릭했을 때
$(document).on("click", "#ok", function () { // OK 버튼 클릭하면
	
	var okBtn= $(this); // 클릭된 버튼값을 담음
	var noBtn = $("#no");
	
	var tr = okBtn.parent().parent(); // <tr> 현재 버튼이 클릭된 행 찾기 위함
	var td = tr.children(); 
	
	var id = td.eq(1).text();
	var fill_money = td.eq(3).text();
	var to_money = td.eq(4).text();
	
	var data = { "id" : id, "fill_money" : fill_money, "to_money" : to_money };
	alert("id : " + id +  ", " + "fill_money :" + fill_money + ", to_money : " + to_money);
	
	
	$.ajax({
		url : "admin_authorize_ok.jsp",
		data : data,
		success : function (data) {
			alert("승인 성공");
			noBtn.prop("disabled", true); // 버튼 비활성화
			okBtn.prop("disabled", true);
		},
		error : function () {
			alert("승인 실패");
		}
		});
	
}); 
////////////////// 거절 버튼 클릭했을 때	
$(document).on("click", "#no", function () {
		
		var noBtn = $(this); 
		var okBtn = $("#ok");
		var tr = noBtn.parent().parent(); 
		var td = tr.children();
		
		var id = td.eq(1).text();
		alert(id);
		$.ajax({
			url : "admin_authorize_no.jsp",
			data : { id : id },
			success : function (data) {
				alert("거절 성공");
				noBtn.prop("disabled", true); 
				okBtn.prop("disabled", true);
			},
			error : function () {
				alert("거절 실패");
			}
			});
	});
</script>



</body>
</html>i