<%@page import="common.Person"%>
<%@page import="java.time.Period"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl의 core 태그 사용하기위한 지시어 선언. prefix는 접두어, uri는 태그 지원하는 예약어가 들어간다. -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 1</title>
</head>
<body>
<!-- set태그 : 변수선언시 사용. jsp의 setAttribute()와 동일기능
4가지 영역에 새속성을 추가한다.
var : 속성명/변수명. 즉 영역에 저장될 이름
value : 속성값
scope : 4가지 영역명 지정. 미지정시 가장좁은 page영역에 저장됨
target : set 태그로 생성된 자바빈즈 이름 지정
property : target으로 지정한 자바빈스의 멤버변수값 지정

value에는 일반값, el, 표현식 모두 사용가능. 또한 태그사이에 value삽입도가능 -->
<c:set var="directVar" value="100" />
<c:set var="elVar" value="${ directVar % 5 }" />
<c:set var="expVar" value="<%= new Date() %>" />
<c:set var="betweenVar">변수값 요렇게 설정</c:set>

<!-- 속성명 중복되지않으면 영역 표시하는 내장객체를 생략가능 -->
<h4>EL이용해 변수출력</h4>
<ul>
	<li>directVar : ${ pageScope.directVar }</li>
	<li>elVar : ${ elVar }</li>
	<li>expVar : ${ expVar }</li>
	<li>betweenVar : ${ betweenVar }</li>
</ul>

<!-- 클래스 생서자 통해 객체생성후 request 영역에 저장
jstl은 jsp코드이므로 value 속성에 기술시 싱글쿼테이션으로 감싸서 겹쳐지지않게해야한다 
자바빈의 getter()통해 멤버변수값출력된다 -->
<h4>자바빈즈 생성1 - 생성자 사용</h4>
<c:set var="personVar1" value='<%= new Person("박문수", 50) %>' scope="request" />
<ul>
	<li>이름 : ${ requestScope.personVar1.name }</li>
	<li>나이 : ${ personVar1.age }</li>
</ul>

<!-- 빈객체먼저생성후 target, property 통해 멤버변수값설정. 이때 자바빈의 setter()가사용된다 -->
<h4>자바빈즈 생성2 - target, property 사용</h4>
<c:set var="personVar2" value="<%= new Person() %>" scope="request" />
<c:set target="${ personVar2 }" property="name" value="정약용" />
<c:set target="${ personVar2 }" property="age" value="60" />
<ul>
	<li>이름 : ${ personVar2.name }</li>
	<li>나이 : ${ requestScope.personVar2.age }</li>
</ul>
</body>
</html>