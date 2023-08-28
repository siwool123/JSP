<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - set 2</title>
</head>
<body>
<h4>List 컬렉션 이용하기</h4>
<%
ArrayList<Person> plist = new ArrayList<>();
plist.add(new Person("성삼문", 55));
plist.add(new Person("박팽년", 60));
%>
<c:set var="personList" value="<%= plist %>" scope="request" />
<ul><!-- 나중에 foreach구문으로 모두 출력 가능 -->
	<li>이름 : ${ requestScope.personList[0].name }</li>
	<li>나이 : ${ personList[0].age }</li>
</ul>

<h4>Map 컬렉션 이용하기</h4>
<%
Map<String, Person> pmap = new HashMap<>();
pmap.put("personArgs1", new Person("하위지", 65));
pmap.put("personArgs2", new Person("이개", 67));
%>
<c:set var="personMap" value="<%= pmap %>" scope="request" />
<ul>
	<li>아이디 : ${ requestScope.personMap.personArgs2.name }</li>
	<li>비번 : ${ personMap.personArgs2.age }</li>
</ul>
</body>
</html>