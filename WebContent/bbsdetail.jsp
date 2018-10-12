<%@page import="java.util.List"%>
<%@page import="dto.CommentDto"%>
<%@page import="dao.iCommentDao"%>
<%@page import="dao.CommentDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int seq = Integer.parseInt(request.getParameter("seq"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board View</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
.center{
	margin: auto;
	width: 60%;
	border: 3px solid #8ac007;
	padding: 10px;
}
</style>
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

%>

<%
iBbsDao dao = BbsDao.getInstance();
BbsDto dto = dao.getBbs(seq);
dao.addRead(seq);
iCommentDao c_dao = CommentDao.getInstance();
List<CommentDto> c_dto = c_dao.getCommentList(seq);
%>
<h1>Board View</h1><br>
<br>

<div class="center">
<form id="insertFrm" action="bbsEdit.jsp" method="post">
<input type="hidden" id="seq" name="seq" value="<%=dto.getSeq() %>">
<table border="1">
<tr>
	<td>ID</td>
	<td>
		<input type="text" id="id" name="id" size="20" value="<%=dto.getId() %>" readOnly>
	</td>
</tr>
<tr>
	<td>Write Date</td>
	<td>
		<input type="text" id="id" name="id" size="20" value="<%=dto.getWdate() %>" readOnly>
	</td>
</tr>
<tr>
	<td>ReadCount</td>
	<td>
		<input type="text" id="id" name="id" size="20" value="<%=dto.getReadcount() %>" readOnly>
	</td>
</tr>
<tr>
	<td>Title</td>
	<td>
		<input type="text" id="title" name="title" size="20" value="<%=dto.getTitle() %>" readOnly>
	</td>
</tr>
<tr>
	<td colspan="2">Content</td>
</tr>
<tr>
	<td colspan="2">
		<textarea rows="25" cols="65" id="content" name="content" readOnly><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<button type="button" onclick="location.href='bbslist.jsp'">Go List</button>
		
		<input type="submit" value="Edit">
		<button type="button" id="delBtn">Delete</button>
	</td>
</tr>
</table>
<button type="button" id="answerBtn">Answer</button>



</form>
</div>
<div class="center">
<table class="table">
<col width="50"><col width="250"><col width="500"><col width="150">

<%
if(c_dto ==null || c_dto.size() == 0){
	%>
	<tr>
		<td colspan="3">No Item</td>
	</tr>
	<%
}else{
	for(int i=0;i<c_dto.size();i++){
		CommentDto c_dt = c_dto.get(i);
		%>
		<tr>
			<td><%=c_dt.getId() %></td>
			<td>
				<%=c_dt.getContent() %>
			</td>
			<td><%=c_dt.getWdate() %></td>
		</tr>
		<%
	}
}
%>
<tr style="border:1px solid black;">
	<td><%=mem.getId() %></td>
	<td><input type="text" id="comment" name="comment"></td>
	<td><button type="button" id="com_send" name="com_send">Send</button>
</tr>

</table>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var a = '<%=dto.getId() %>';
	var b = '<%=mem.getId() %>';
	
	if(a != b){
		$("#editBtn").hide();
		$("#delBtn").hide();
	}else{
		$("#title").removeAttr("readOnly");
		$("#content").removeAttr("readOnly");
		$("#editBtn").show();
		$("#delBtn").show();
		
	}
	
	
});

$("#delBtn").click(function(){
	location.href="delbbs.jsp?seq=<%=dto.getSeq()%>";
		
});

$("#answerBtn").click(function(){
	location.href="answer.jsp?seq=<%=dto.getSeq()%>";
		
});

$("#com_send").click(function(){
	var b_seq = $("#seq").val();
	var c_id = "<%=mem.getId() %>"; 
	var content = $("#comment").val();
	location.href="commentAf.jsp?b_seq="+b_seq+"&id="+c_id+"&content="+content;
});







</script>
</body>
</html>