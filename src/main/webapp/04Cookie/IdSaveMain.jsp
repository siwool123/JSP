<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //페이지실행되면 loginId라는 쿠키를 읽어온다.
/* 읽어온쿠키에 아이디 값이 있으면 아이디 저장하기가 자동체크된다. */
String loginId = CookieManager.readCookie(request, "loginId");
String cookieCheck = "";
if(!loginId.equals("")) cookieCheck = "checked";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie - 아이디 저장하기</title>
</head>
<body>
<h2>로그인 페이지</h2>
<form action="IdSaveProcess.jsp" method="post">
<!-- 쿠키로 읽어온값이 있는경우 text 상자에는 value속성으로저장된 아이디 추가하고
checkbox에는 checked  속성부여 -->
아   이   디 : <input type="text" name="user_id" value="<%= loginId %>"/>
<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %>/>
아이디 저장하기 <br /><br />
패스워드 : <input type="text" name="user_pw"/><br /><br />
<input type="submit" value="로그인하기"	/>
</form>
</body>
</html>