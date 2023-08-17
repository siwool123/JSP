<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
<h2>3. 요청 헤더 정보 출력하기</h2>
<%-- getHeaderNames() : 사용자의 요청헤더 얻어올때 사용하는 메소드로 반환타입은 Enumeration 객체이다
-------hasMoreElements() : 출력할 헤더정보가 남았는지 확인하여 boolean 값으로 반환
-------nextElement() : 헤더명 반환
getHeader() : 헤더명으로 헤더값 반환
 --%>
<%
Enumeration headers = request.getHeaderNames();
while(headers.hasMoreElements()){ //헤더명 반복해서 얻어온다.]
	String headerName = (String)headers.nextElement();
	String headerValue = request.getHeader(headerName); //헤더값얻어온다]
	out.println("헤더명 : "+headerName+" | 헤더값 : "+headerValue+"<br>");
}
/* 요청헤더로 확인할수있는 값
 user-agent : 사용자가 접속한 웹브라우저 종류 알수있다. 크롬, 파이어폭스 등 여러 웹브라우저로 테스트해보면 각각 다른결과값을출력함
 referer : 웹서핑으로 특정 링크 클릭하여 다른사이트로 방문할경우 남는흔적. 어떤사이트 통해 해당페이지에유입됐는지 알수있다.
 cookie : 웹서버가 브라우저로 클라이언트의 컴퓨터에 남기는 흔적으로 파일형태로 저장됨
 */
%>
<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다. </p>
</body>
</html>