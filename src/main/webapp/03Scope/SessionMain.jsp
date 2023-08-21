<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* session 영역 : 클라이언트가 웹브라우저를 최초로 연후 닫을때까지 요청된 모든 페이지는 session영역 공유가능
즉, session이란 클라이언트가 서버에 접속해있는 상태 혹은 단위를 말함 
리스트 컬렉션 생성후 2개의 문자열 저장 */
ArrayList<String> lists = new ArrayList<>();
lists.add("리스트");
lists.add("컬렉션");
session.setAttribute("lists", lists); //세션영역에 리스트저장
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 영역</title>
</head>
<body>
<h2>페이지 이동후 session 영역의 속성 읽기</h2>

<a href="SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>