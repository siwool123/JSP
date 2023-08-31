<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.lang.invoke.CallSite"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
LinkedList<Person> list = new LinkedList<>();
list.add(new Person("맹사성", 34));
list.add(new Person("장영실", 44));
list.add(new Person("신숙주", 54));

Map<String, Person> map = new HashMap<>();
map.put("1st", new Person("맹사성", 34));
map.put("2nd", new Person("장영실", 44));
map.put("3rd", new Person("신숙주", 54));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - foreach 3</title>
</head>
<body>
<!-- set태그로 페이지영역에 변수/속성 저장
> 해당변수통해 확장for문 실행. items에 지정한 컬렉션에 저장된 객체 갯수만큼 반복하여 list로 하나씩 전달
> 저장 순서대로 Person 객체를 변수list2에 저장후 getter 통해 멤버변수에 저장된 값출력 -->
<h4>List 컬렉션 사용하기</h4>
<c:set var="list" value="<%= list %>" />
<c:forEach items="${ list }" var="list2">
	<li>이름 : ${ list2.name }, 나이 : ${ list2.age }</li>
</c:forEach>

<h4>java 코드 통한 출력</h4>
<%
for(Person i:list) out.println("<br>이름 : "+i.getName() + ", 나이 : "+i.getAge());
Set<String> keys = map.keySet();%>
<br /><br />
<% /* JSTL의 확장for문을 사용하는것이 더 편리하다 */
for(String i:keys) {
	Person p = map.get(i);
	out.println("Key => "+i+"&nbsp;||&nbsp;");
	out.println("Value => "+p.getName() + ", "+p.getAge()+"<br>");
} 
%>

<!-- map컬렉션 사용시 key를 별도로 얻어올필요없이 객체.key 혹은 객체.value 통해 값을 출력할수있다. -->
<h4>Map 컬렉션 사용하기</h4>
<c:set var="map" value="<%= map %>" />
<c:forEach items="${ map }" var="map2">
	<li>Key => ${map2.key} &nbsp;||&nbsp;
	Value => 이름 : ${ map2.value.name }, 나이 : ${ map2.value.age }</li>
</c:forEach>
</body>
</html>