<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - out</title>
</head>
<body>
<!-- out 태그 : 영역에 저장된 변수 출력시 사용. escapeXml 속성이 true면 html 태그가 그대로 출력됨
innerText 와 동일 / escapeXml="false" 경우 innerHTML 과 동일 -->
<c:set var="iTag">
	i 태그는 <i>기울임</i> 을 표현합니다.
</c:set>

<h4>기본사용</h4>
<c:out value="${ iTag }" />

<h4>escapeXml 속성</h4>
<c:out value="${ iTag }" escapeXml="false" />

<!-- 최초실행시엔 파라미터가 없는상태이므로 default 값 출력됨
value 속성이 null일때만 default 값출력 -->
<h4>default 속성</h4>
<c:out value="${ param.name }" default="이름없음" /> 
<c:out value="" default="빈 문자열도 값입니다." />
</body>
</html>