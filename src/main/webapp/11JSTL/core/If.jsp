<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - if</title>
</head>
<body>
<!-- 변수선언
if 태그속성 > test : el 이용해서 조건식삽입 -->
<c:set var="number" value="100" />
<c:set var="string" value="JSP" />

<h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
<!-- 해당 조건의 결과가 result에 저장된다. 나버지는 0이므로 true출력된다. -->
<c:if test="${ number%2==0 }" var="result">${ number } 는 짝수입니다. <br /></c:if>
result : ${ result } <br />

<h4>문자열 비교와 else 구문 흉내내기</h4>
<!-- 자바에서는 비교연산자 ==과 equals()는 다르지만, el에서는 eq 통해 값과 문자열 모두 비교가능하다
여기서 eq는 자바의 compareTo() 처럼 사전순으로 문자열 비교한다.

result2에 not 붙여 반대조건 만든다. 따라서 else 같은구문된다. -->
<c:if test="${ string == 'Java' }" var="result2">문자열은 Java 입니다. <br /></c:if>
<c:if test="${ ! result2 }">'Java'가 아닙니다. <br /></c:if>

<h4>조건식 주의사항</h4>
<c:if test="100" var="result3">EL이 아닌 정수를 지정하면 false</c:if>
result3 : ${ result3 } <br />
<c:if test="tRuE" var="result4">대소문자 구분없이 "tRuE"인 경우 true <br /></c:if>
result4 : ${ result4 } <br />
<c:if test="${ true } " var="result5">EL 양쪽에 빈 공백이 있는 경우 false <br /></c:if>
result5 : ${ result5 } <br />

<h4>연습문제 : if태그</h4>
<!-- 아이디, 패스워드를 입력후 submit버튼을 누르면 EL식을 통해 파라미터를
받은 후 tjoeun/1234 인 경우에는 'tjoeun님, 하이룽~'이라고 출력한다. 
만약 틀렸다면 "아이디/비번을 확인하세요"라고 출력한다. 
EL과 JSTL의 if태그만을 이용해서 구현하시오. -->
    <form method="get">
		아이디 : <input type="text" name="user" />		<br />
		패스워드 : <input type="password" name="pass" />		<br />
		<input type="submit" value="로그인" />
	</form>	<br /><br />

<!-- 최초실행시엔 파라미터가 없는상태이므로 아무내용도 출력되면 안된다.
전송 파라미터가 있을때만 실행되도록 한다. -->
<c:if test="${ not empty param.user}">
	전송아이디 : ${ param.user }<br />
	전송비번 : ${ param.pass }<br />
	<c:if test="${ param.user == 'tjoeun' && param.pass == '1234' }" var="result">${ param.user } 님, 하이룽~</c:if>
	<c:if test="${ ! result }">아이디/비번을 확인하세요</c:if>
</c:if>
</body>
</html>