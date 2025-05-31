<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Calendar now = Calendar.getInstance();
	String s = String.format("%tF %tT", now, now);
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>스프링 홈페이지</h3>
	<p> 안녕하세요 </p>
	<p> 지금 시간은 <%= s %> 입니다. </p>