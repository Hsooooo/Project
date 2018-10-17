<%@page import="dao.DiceDao"%>
<%@page import="dao.iDiceDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");
<<<<<<< HEAD

String id = request.getParameter("id");

String point_ = request.getParameter("point");
int point = Integer.parseInt(point_);

iDiceDao dao = DiceDao.getInstance();
boolean addS = dao.diceAdd(id, point);

if(addS){
	System.out.print("[DICE] diceInit : 추가/업데이트 성공 ("+ "id : " + id +  " point :" + point + "원 )" );

} else {
	System.out.print("!![DICE] diceInit : 추가/업데이트 실패!!");

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diceInit.jsp</title>
</head>
<body>

</body>
</html>
=======
String id = request.getParameter("id");
String point_ = request.getParameter("point");
int point = Integer.parseInt(point_);
iDiceDao dao = DiceDao.getInstance();
boolean addS = dao.diceAdd(id, point);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>diceInit.jsp</title>
</head>
<body>
<%

if(addS){
	System.out.print("[DICE] diceInit : 추가/업데이트 성공 ("+ "id : " + id +  " point :" + point + "원 )" );
	%>
	<script type="text/javascript">
	alert("성공");
	location.href = "diceGame.jsp";
	</script>
	<% 
	} else {
		System.out.print("!![DICE] diceInit : 추가/업데이트 실패!!");
	}
%>

</body>
</html>
>>>>>>> refs/remotes/origin/hs2
