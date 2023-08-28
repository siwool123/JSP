<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼값처리</title>
</head>
<body>
<c:set var="id" value="tjoeun" />
<c:set var="pw" value="1234" />
<c:if test="${ param.user == id && param.pass == pw }" var="result">${ id } 님, 하이룽~</c:if>
<c:if test="${ ! result }">아이디/비번을 확인하세요<br /><a href="If.jsp">로그인화면 돌아가기</a></c:if>
</body>
</html>