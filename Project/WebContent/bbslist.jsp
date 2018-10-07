<%@page import="dto.PagingBean"%>
<%@page import="dao.CommentDao"%>
<%@page import="dao.iCommentDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.table {
   	
    border-top: 1px solid #444444;
    border-collapse: collapse;
    border-color: grey;
}

th{
	border-bottom: 1px solid #444444;

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

<h3>Welcome <%=mem.getNickname() %> ~ Hello</h3>

<a href="calendar.jsp">일정관리</a>
<a href="pdslist.jsp">자료실</a>

<a href="mypage.jsp">Mypage</a> <a href="KHlogout.jsp">Logout</a>

<h2>Board</h2>

<!--  페이징 정보 교환 -->
<%
PagingBean paging = new PagingBean();
if(request.getParameter("nowPage") == null){
	paging.setNowPage(1);
}else{
	paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
}
%>
<%
iBbsDao dao = BbsDao.getInstance();
//List<BbsDto> bbslist = dao.getBbsList();
List<BbsDto> bbslist = dao.getBbsPagingList(paging, "");
iCommentDao c_dao = CommentDao.getInstance();

%>


<div align="center" style= width:70%>

<table class="table">
<col width="70"><col width="500"><col width="150">
<tr>
	<th>Num</th><th>Title</th><th>Writer</th><th>Read</th>
</tr>
<%
int count = 0;
if(bbslist ==null || bbslist.size() == 0){
	%>
	<tr>
		<td colspan="3">No Item</td>
	</tr>
	<%
}else{
	for(int i=0;i<bbslist.size();i++){
		BbsDto bbs = bbslist.get(i);
		%>
		<tr>
			<td><%=i+1 %></td>
			<td style="text-align: left;">
			<%
				count = c_dao.commentCount(bbs.getSeq());
			%>
				<%
				if(bbs.getDel() == 0){
				%>
					<a href="bbsdetail.jsp?seq=<%=bbs.getSeq() %>"><%=bbs.getTitle() %></a>[<%=count %>]
				<%
				}else{
				%>
					Deleted Item
				<%
				}
				%>
				
			</td>
			<td><%=bbs.getId() %></td>
			<td><%=bbs.getReadcount() %></td>
		</tr>
		<%
	}
}
%>

</table>
<jsp:include page="paging.jsp">
	<jsp:param value="bbslist.jsp" name="actionPath"/>
	<jsp:param value="<%=String.valueOf(paging.getNowPage()) %>" name="nowPage"/>
	<jsp:param value="<%=String.valueOf(paging.getTotalCount()) %>" name="totalCount"/>
	<jsp:param value="<%=String.valueOf(paging.getCountPerPage()) %>" name="countPerPage"/>
	<jsp:param value="<%=String.valueOf(paging.getBlockCount()) %>" name="blockCount"/>
	
</jsp:include>
</div>

<a href="bbswrite.jsp">WriteBoard</a>
</body>
</html>