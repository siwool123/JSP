<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
<ul>
<li>데이터 전송방식 : <%= request.getMethod() %></li> <%--get혹은 post 로 출력 --%>
<li>URL : <%= request.getRequestURL() %></li> <%-- 현재접속한 전체경로반환 --%>
<li>URI : <%= request.getRequestURI() %></li> <%-- url에서 호스트 제외한 나머지 경로반환 --%>
<li>프로토콜 : <%= request.getProtocol() %></li>
<li>서버명 : <%= request.getServerName() %></li>
<li>서버포트 : <%= request.getServerPort() %></li>
<li>클라이언트 IP주소 : <%= request.getRemoteAddr() %></li> <%-- localhost는 루프백주소이므로 0:0처럼표현됨 --%>
<%-- get방식으로 전송시 경로명뒤에 클라이언트가 전송한값을출력. 즉 get방식일때만 출력됨 --%>
<li>쿼리스트링 : <%= request.getQueryString() %></li> 
<%-- 클라이언트가 get혹은 post방식으로 전송한값을 받을때 사용
단, Tomcat 9.x 버전에선 post방식으로 전송시 한글깨짐현상이 발생하므로 별도의 인코딩처리가 필요하다 --%>
<li>전송된 값 1 : <%= request.getParameter("eng") %></li>
<li>전송된 값 2 : <%= request.getParameter("han") %></li>
</ul>
</body>
</html>