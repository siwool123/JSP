<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("num1", 9);
pageContext.setAttribute("num2", "10");

//empty연산자 사용하기위한 변수. 빈문자열, 원소가 없는 배열 등
pageContext.setAttribute("nullStr", null);
pageContext.setAttribute("emptyStr", "");
pageContext.setAttribute("lengthZero", new Integer[0]);
pageContext.setAttribute("sizeZero", new ArrayList());
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- null이거나, 빈문자열이거나, 길이가0인 컬렉션 혹은 배열일떄
empty연산자는 true 를 반환한다. 즉 객체가비었는지 확인한다. -->
<h3>empty 연산자</h3>   
    empty nullStr : ${ empty nullStr } <br />
    empty emptyStr : ${ empty emptyStr } <br />
    empty lengthZero : ${ empty lengthZero } <br />
    empty sizeZero : ${ empty sizeZero }
    
    <h3>삼항 연산자</h3>
    num1 gt num2 ? "참" : "거짓" => ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }

<!-- el에선 null을 0으로 판단한다. 따라서 아래 결과는 10이 나오게된다.
단, null과 정수를 연산한느 부분을 이클립스는 에러로 표시한다.
하지만 실행시엔 전혀문제없다. 아래코드때문에 프로젝트전체에 에러표시되므로
jsp주석으로 막아둔다. -->    
    <h3>null 연산</h3>
    <%-- null + 10 : ${ null + 10 } <br />
    nullStr + 10 : ${ nullStr + 10 } <br />
    param.noVar > 10 : ${ param.noVar < 10 } --%>
</body>
</html>