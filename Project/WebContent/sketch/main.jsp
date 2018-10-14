<%@page import="dao.BbsDao"%>
<%@page import="dao.CommentDao"%>
<%@page import="dao.iCommentDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dto.PagingBean"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"  href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"  href="css/bootstrap.css?ver=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- 상단 네비게이션 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link"  id="accountBtn" href="#" data-target="myModal">Account</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<!-- -----모달 페이지--------- -->
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="display: none;">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i></button>
            <h4 class="modal-title" id="myModalLabel">Login</h4>
          </div>
          <div class="modal-body">
          	<div class="form-group">
       			 <label for="exampleInputId">ID</label>
       			 <input type="text" class="form-control" id="id" name="id">
      		</div>
      		<div class="form-group">
       			 <label for="exampleInputPass">Password</label>
       			 <input type="password" class="form-control" id="pw" name="pw">
      		</div> 
		  </div>
          <div class="modal-footer ">
            <button type="button" id="loginBtn" class="btn btn-outline-secondary" data-dismiss="modal">Login</button>
            <button type="button" id="joinBtn" class="btn btn-outline-secondary" data-dismiss="modal">Join</button>
          </div>
        </div>
      </div>
</div>

<div id="page-body">
  <div class="container">
  <div class="row"> 
      <!--blog posts container-->
      <div class="col-md-offset-1 col-md-9 page-block">
        


<table class="table">
<thead>
<tr class="table-primary">
	<th scope="col">Num</th><th scope="col">Title</th><th scope="col">Writer</th><th scope="col">Read</th>
</tr>
</thead>
<tbody>
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
</tbody>
</table>
<jsp:include page="paging.jsp">
	<jsp:param value="userbbs.jsp" name="actionPath"/>
	<jsp:param value="<%=String.valueOf(paging.getNowPage()) %>" name="nowPage"/>
	<jsp:param value="<%=String.valueOf(paging.getTotalCount()) %>" name="totalCount"/>
	<jsp:param value="<%=String.valueOf(paging.getCountPerPage()) %>" name="countPerPage"/>
	<jsp:param value="<%=String.valueOf(paging.getBlockCount()) %>" name="blockCount"/>
	
</jsp:include>
<nav>
	<ul class="pagination pagination-sm">
    <li class="page-item disabled">
      <a class="page-link" href="#">&laquo;</a>
    </li>
    <li class="page-item active">
      <a class="page-link" href="#">1</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">3</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">4</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">5</a>
    </li>
    <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
  </ul>
</nav>
<div>
<div class="fl">

    <div class="input-group">
      <select class="custom-select">
      	<option value="제목">제목</option>
      	<option value="작성자">작성자</option>
      	<option value="내용">내용</option>
      </select>
      <input type="text" class=" input-sm col-xs-3" aria-label="...">
    </div><!-- /input-group -->
		
</div>
	<div class="fr">
		<button id="writeBtn" name="writeBtn"  class="btn btn-default btn-sm">
				<span class="glyphicon glyphicon-pencil"></span>글쓰기
		</button>
	</div>
</div>
<div>

</div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
$(function(){
	$("#accountBtn").click(function(){
		alert("Dd");
		$("#myModal").modal();
	});
	$("#loginBtn").click(function(){
		location.href="login.jsp?id="+$("#id").val() + "&pw="+$("#pw").val();
	});
	$("#joinBtn").click(function(){
		location.href="regi.jsp";
	})
});
</script>
</body>
</html>