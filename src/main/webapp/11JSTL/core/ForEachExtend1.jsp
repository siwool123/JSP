<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
String[] rgba = {"Red", "Green", "Blue", "Black"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - foreach 2</title>
</head>
<body>
<!-- 확장 for문
 items : 사용할 배열이나 컬렉션 지정
 var : 해당 루프에서 반환해준 객체 저장할 변수명 지정
 
개선 for문에서 varStatus 속성
count :  실제 반복 순서 반환. 1부터 시작
index : 현재루프에서 인덱스 표현. 0부터시작
current : 현재 루프의 변수값을 반환
first : 루프의 처음인경우 true 반환
last : 루프 마지막인경우 true 반환
 -->
<h4>향상된 for문 형태의 foreach 태그</h4>
<c:forEach items="<%= rgba %>" var="c">
	<span style="color:${ c };">${ c }</span>
</c:forEach>

<h4>varStatus 속성 살펴보기</h4>
<table border="1">
<c:forEach items="<%= rgba %>" var="i" varStatus="loop">
	<tr>
		<td>count : ${ loop.count }</td>
		<td>index : ${ loop.index }</td>
		<td>current : ${ loop.current }</td>
		<td>first : ${ loop.first }</td>
		<td>last : ${ loop.last }</td>
	</tr>
</c:forEach>
</table>
</body>
</html>