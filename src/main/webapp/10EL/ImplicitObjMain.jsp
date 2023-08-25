<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("scopeValue", "페이지 영역");
request.setAttribute("scopeValue", "리퀘스트 영역");
session.setAttribute("scopeValue", "세션 영역");
application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 내장객체</title>
</head>
<body>
<h2>ImplicitObjMain 페이지</h2>
<!-- 4가지영역에 접근시 el의 내장객체 통해 내용 출력
모두 동일 패턴으로 "영역명Scope" 같은 형태로 되어잇다.
el의 내장객체에 .추가하여 속성명 기술한다. -->
<h3>각 영역에 저장된 속성 읽기</h3>
<ul>
	<li>페이지 영역 : ${pageScope.scopeValue}</li>
	<li>리퀘스트 영역 : ${requestScope.scopeValue} </li>
	<li>세션 영역 : ${sessionScope.scopeValue}</li>
	<li>애플리케이션 영역 : ${applicationScope.scopeValue}</li>
</ul>

<!-- 만약 영역 지정없이 속성읽을때는 가장좁은 영역을 우선 출력
즉, 여기선 page영역의 속성 출력한다. 
실무에서는 동일 속성명으로 저장하는 경우가 거의없어 대부분 이처럼 사용가능 -->
<h3>영역 지정 없이 속성 읽기</h3>
<ul>
	<li>${ scopeValue }</li>
</ul>
<jsp:forward page="ImplicitForwardResult.jsp" />
</body>
</html>