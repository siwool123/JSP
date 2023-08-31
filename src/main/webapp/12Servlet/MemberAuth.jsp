<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberAuth.jsp</title>
</head>
<body>

<!-- 요청명 설정후 get방식의 요청위해 쿼리스트링으로 아이디와 패스워드를 전달한다
해당링크는  -->
<h2>MVC 패턴으로 회원인증하기</h2>
    <p>
        <a href="./MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a>&nbsp;&nbsp;
        <a href="./MemberAuth.mvc?id=musthave&pass=1234">회원인증(회원)</a>&nbsp;&nbsp;
        <a href="./MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a><br />
    </p>
     <strong>${ authMessage }</strong> 
</body>
</html>