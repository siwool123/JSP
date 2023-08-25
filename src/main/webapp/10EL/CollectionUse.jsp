<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 컬렉션</title>
</head>
<body>
<h2>List 컬렉션</h2>
<% //list컬렉션을 object 기반으로 생성한다
List<Object> aList = new ArrayList<>();
List aList2 = new ArrayList(); //타입매개변수생략해도 object기반의 컬렉션된다.

aList.add("청해진"); //String 객체추가
aList.add(new Person("장보고", 28)); //Person 객체추가
pageContext.setAttribute("Ocean", aList); 
//EL은 영역에저장된값을대상으로하므로 page영역에속성저장
%>
<ul> <!-- ArrayList는 배열특성가지므로 인덱스로 접근가능 -->
	<li>0번째 요소 : ${ Ocean[0] }</li> 
	<li>1번째 요소 : ${ Ocean[1].name }, ${ Ocean[1].age }</li>
	<li>2번째 요소 : ${ Ocean[2] }</li>
<!-- 2번인덱스엔 아무값도없어 출력안됨. 자바라면 예외발생하겠지만 el에선 예외발생하지않음 -->
</ul>
<h2>Map 컬렉션</h2>
<%
Map<String, String> map = new HashMap<>();
map.put("한글", "훈민정음");
map.put("Eng", "English");
pageContext.setAttribute("King", map);
%>
<ul>
<!-- key값이 영문인경우 아래3가지방법 모두사용가능. 한글의경우. 사용불가
el식 앞에 \ 붙이면 주석이된다. 단 코드가 숨겨지는건 아니고 그대로 출력된다. -->
	<li>영문 key : ${ King["Eng"] }, ${ King['Eng'] }, ${ King.Eng }</li>
	<li>한글 key : ${ King["한글"] }, ${ King['한글'] }, \${ King.'한글' }</li>
</ul>
</body>
</html>