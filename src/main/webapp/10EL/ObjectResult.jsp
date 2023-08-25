<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현 언어(EL) - 객체매개변수</title>
</head>
<body>
<h2>영역을 통해 전달된 객체 읽기</h2>
<ul>
<!-- 영역에 저장된 속성에 el로 접근시에는 속성명이 중복되지 않는다면 
el내장객체없이 속성명만으로 출력할수있다.
즉 requestScope.personObj.name형태로 기술하지 않아도 된다.

"속성명.멤버변수" 형태로 기술하면 객체에 선언된 getter()를 자동호출하여 값출력한다.
즉 아래문장은 getter()를 호출하므로 person클래스에서 getName() 을 주석처리하면 
에러발생한다. 또한 출력시 자동 형변환되므로 더욱편리하다 -->
	<li>Person 객체 => 이름 : ${ personObj.name }, 나이 : ${ personObj.age }</li>
	<li>String 객체 => ${ requestScope.stringObj }</li>
	<li>Integer 객체 => ${ integerObj }</li>
</ul>

<!-- 영역은 모든객체 저장할수있는공간이므로 object 타입으로 저장된다.
따라서 영역에서 객체꺼낸후 사용시엔 원래타입으로 형변환해야한다.
출력시엔 멤버변수에 직접접근할수없어 getter 사용한다. 
이런 모든절차를 el은 자동처리해준다. -->
<h2>JSP 내장객체 통해 영역 내 값 읽어오기</h2>
<%
Person obj = (Person)request.getAttribute("personObj");
out.println("이름 : "+obj.getName());
%>

<!-- 파라미터 전달된값 읽을때 아래 3가지 방법 사용가능 
   param.파라미터명
   param.['파라미터명']
   param.["파라미터명"] -->
<h2>매개변수로 전달된 값 읽기</h2>
<ul>
	<li>${ param.firstNum + param['secondNum'] }</li>
	<li>${ param.firstNum } + ${ param["secondNum"] }</li>
</ul>
</body>
</html>