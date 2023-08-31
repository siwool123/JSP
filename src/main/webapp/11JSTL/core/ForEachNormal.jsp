<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - foreach 1</title>
</head>
<body>
<h4>일반 for문 형태의 foreach 태그</h4>

<c:forEach begin="1" end="5" step="1" var="i">
	<p>반복 ${ i } 입니다.</p>
	<c:set var="sum2" value="${ sum2+i }" />
</c:forEach>
<p>1~5 까지 합 : ${ sum2 } 입니다.</p>

<h4>varStatus 속성 살펴보기</h4>
<table border="1">
<c:forEach begin="3" end="5" var="i" varStatus="loop">
	<tr>
<!-- 일반 for문에서 varStatus 속성 : 반복 관련 정보를 추상화한 클래스 통해 정보 반환
count :  실제 반복 순서 반환. 1부터 시작
index : 변수 i의 변화하는 값 반환
first : 루프의 처음인경우 true 반환
last : 루프 마지막인경우 true 반환
current : 현재 루프의 변수값을 반환한다. (var속성에 지정된 변수)
> 즉 일반 for문에서는 index와 current 는 동일값출력된다. -->
		<td>count : ${ loop.count }</td>
		<td>index : ${ loop.index }</td>
		<td>current : ${ loop.current }</td>
		<td>first : ${ loop.first }</td>
		<td>last : ${ loop.last }</td>
	</tr>
</c:forEach>
</table>

<h4>1~100 까지의 정수중 홀수의 합</h4>
<c:forEach begin="1" end="99" step="2" var="j">
	<c:set var="sum" value="${ sum+j }" />
</c:forEach>
<p>1~100 까지의 정수중 홀수의 합 : ${ sum }</p>

<!-- 연습문제] 아래 모양을 출력하시오. 단 JSTL의 forEach문과 if문을 활용하시오.
	1 0 0 0 0
	0 1 0 0 0
	0 0 1 0 0
	0 0 0 1 0
	0 0 0 0 1 -->
<h4>이진 피라미드</h4>
<c:forEach begin="1" end="5" var="a">
	<c:forEach begin="1" end="5" var="b">
		<c:if test="${ a==b }" var="result">&nbsp; 1</c:if>
		<c:if test="${ ! result }">&nbsp; 0 </c:if>
	</c:forEach>
	<br />
</c:forEach>

<h4>숫자 피라미드</h4>
<c:set var="num" value="0" />
	<c:forEach begin="0" end="3" var="f">
		<c:forEach begin="0" end="${ f }" var="g">
			&nbsp; ${ num }
			<c:set var="num" value="${ num+1 }" />
		</c:forEach>
		<br />
	</c:forEach>

</body>
</html>
