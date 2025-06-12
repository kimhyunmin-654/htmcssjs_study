<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// post 방식으로 넘어온 파라미터의 인코딩 방식 설정
	request.setCharacterEncoding("utf-8");

	// getParameterValues() 
	// : get, post 방식으로 넘어온 파라미터를 배열로 받는다.
	// : 리턴 타입은 String[]
	
	// String name = request.getParameter("name");
	String name = request.getParameterValues("name")[0];
	String pwd = request.getParameter("pwd");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String []ss = request.getParameterValues("subject");
		// 선택된 체크박스가 없으면 null
		// 동일한 이름의 파라미터는 getParameterValues()로 받는다.
	String subject = "";
	if(ss != null) {
		for(String s : ss) {
			subject += s + " "; 
		}
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>넘어온 파라미터</h3>
	<p>이름 : <%= name  %></p>
	<p>패스워드 : <%= pwd  %></p>
	<p>나이 : <%= age  %></p>
	<p>성별 : <%= gender  %></p>
	<p>과목 : <%= subject  %></p>

</body>
</html>