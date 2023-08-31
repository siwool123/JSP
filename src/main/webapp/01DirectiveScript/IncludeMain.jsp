<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- include 지시어로 파일 포함시키면 컴파일되지않은 원본상태의 코드가 그대로 포함되어 컴파일된다.
따라서 아래에서 사용한 변수들은 해당문서에 포함되어있어 문제없이 실행됨 --%>
<%@ include file = "IncludeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 지시어</title>
</head>
<body>
<%
out.println("오늘날짜 : "+today);
out.println("<br>내일날짜 : "+tmrw);
Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<p><%= tmrw %></p>
<p>지금시간 : <%= sdf.format(now) %></p>
<%@ include file = "../06Session/LoginForm.jsp" %>
</body>
</html>