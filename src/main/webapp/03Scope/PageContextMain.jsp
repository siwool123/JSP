<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
/* 페이지 영역 : 하나의 페이지에서만 영역이 공유되고 페이지 이동, 포워드된 페이지에서는 영역이 소멸되어 공유되지 않는다.
즉 해당 페이지에서만 사용할수있는 영역. jsp 에서의 영역은 데이터를 저장하는 공간으로 메모리라고 생각하면된다. */
 //속성 저장
pageContext.setAttribute("pageInteger", 1000); //정수형 데이터 > Integer
pageContext.setAttribute("pageString", "페이지 영역의 문자열"); //문자열 데이터 > String
pageContext.setAttribute("pagePerson", new Person("한석봉", 99)); //일반적인 클래스로 생성한 인스턴스
/* 위에선 3가지 형태의 데이터를 page영역에 저장한다.
저장시엔 setAttribute(속성명, 속성값) 메소드를 사용한다.
영역은 Object 기반으로 하므로 모든 데이터를 저장할수있다. */
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
<h2>page 영역의 속성값 읽기</h2>
<%
//정수데이터읽을때는 Integer 타입으로형변환하여 자동언박싱한다.
int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));
String pString = pageContext.getAttribute("pageString").toString(); //toString() 통해 문자열 형태로 반환
//Person처럼 개발자가직접정의한 클래스는 원래타입으로 형변환
Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
/* 영역에 저장된 데이터는 getAttribute(속성명) 으로 읽어올수있다.
Object형으로 자동형변환되어 저장되므로 값읽을땐 원래형으로 다운캐스팅후 사용해야한다. 
java 기본클래스는 별도 처리없이 즉시 내용을 출력할수있다. */
%>
<ul>
<li>Integer 객체 : <%= pInteger %></li> 
<li>String 객체 : <%= pString %></li>
<li>Person 객체 : <%= pPerson.getName() %>, <%= pPerson.getAge() %></li>
</ul>
<!-- 지시어로 include는 포함시킬 페이지의 원본소스를 그대로 현재문서에 포함시킨후 컴파일을 진행한다. 
따라서 동일한 페이지로 취급되므로 page영역이 그대로 공유된다. 즉, 인클루드된 페이지 내용은 정상출력된다.
페이지 이동은 새 페이지를 웹서버에 요청하는것이므로 page영역은 공유되지 않는다. 
즉, 아래링크로 이동한 페이지에선 아무런 내용도 출력되지 않는다. -->
<h2>include 된 파일에서 page 영역 읽어오기</h2>
<%@ include file="PageInclude.jsp" %>

<h2>페이지 이동 후 page 영역 읽어오기</h2>
<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>