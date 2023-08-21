<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
</head>
<body>
<h2>페이지 이동후 session 영역의 속성 읽기</h2>
<!-- 모든 실행창(웹브라우저) 닫은후 해당페이지를 단독으로실행하면 nullPointerException발생
세션영역은 웹브라우저 닫으면 소멸됨 -->
<%
ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists");
for(String i:lists) out.print(i+"<br>");
%>
</body>
</html>