<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String condition = request.getParameter("condition");
	String keyword = request.getParameter("keyword");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<p>검색 컬럼 : <%= condition %></p> 
	<p>검색 값 : <%= keyword %></p> 
	
</body>
</html>