<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
	
	<div>
		<div>
			스크린
		</div>
	</div>
	
	<form>
		<table>
			<tr>
				<% int num=0; %>
				<% for(int i=1; i<=15; i++) {%>
					<% if(num%5==0) { %>
						<td></td>
						<%num=0; %>
					<%} %>
					<td><%=i %></td>
					<% ++num;  %>	
				<%} %>
			</tr>
		</table>
		<table>
			<%char alp = 'A'; %>
			<%int num2 = 1; %>
			<%int sitnum = 1; %>
			<%for(int j=0; j<10; j++) {%>
			<tr>
				<td><%=alp %></td>
				<%for(int i=1; i<18; i++) {%>
					<%if(num2%6==0)  {%>
						<td style="background: #e4e4e4"></td>
					<%num2 = 1; %>
					<%continue; } %>
					<td><input type="checkbox" name="sit"></td>
					<% ++num2; %>
					<% ++sitnum; %>
				<%} %>
				<%num2 = 1; %>
				<%sitnum = 1; %>
			</tr>
			<%alp++; %>
		<%} %>
		</table>
		<table>
			<tr>
				<td>
					<button type="button" class="btn">좌석예약</button>
				</td>
			</tr>
		</table>
	
	</form>

</body>
</html>