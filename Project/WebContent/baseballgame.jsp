<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%!
public int[] random(){
	int ran[] = new int[4];
	Random random = new Random();
	boolean already[] = new boolean[10];
	for(int i=0; i<10; i++){
		already[i] = false;
	}
	int count = 0;
	while(count <4){
		int trial = random.nextInt(10);
		if(!already[trial]){
			ran[count] = trial;
			already[trial] = true;
			count ++;
		}
	}
	return ran;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= random() %>
</body>
</html>