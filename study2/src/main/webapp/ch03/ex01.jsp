<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
	// 주석 - 자바주석
	// scriptlet(자바 코드 영역)
	int s = 0;
	for(int i = 1; i<=100; i++) {
		s += i;
	}
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>JSP 주석</h3>
	
	<!-- HTML 주석 : 클라이언트에게 전송 -->
	<%-- JSP 주석 : 클라이언트에게 전송되지 않음 --%>
	<P>
		1 ~ 100까지 합은 <%=s %> 입니다.
	</P>

</body>
</html>