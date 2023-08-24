<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String outerPath1 = "./inc/OuterPage1.jsp";
String outerPath2 = "./inc/OuterPage2.jsp";

pageContext.setAttribute("pAttr", "동명왕");
request.setAttribute("rAttr", "온조왕");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어와 액션태그 동작방식 비교</title>
</head>
<body>
<h2>지시어와 액션태그 동작방식 비교</h2>
<h3>지시어로 페이지 포함하기</h3>
<%@ include file = "./inc/OuterPage1.jsp" %>
<%--@ include file = "<%= outerPath1 %>" --%>
<!-- 지시어를 이용한 include의 페이지경로는 문자열형태로만 기술가능
표현식 통한 변수사용불가

지시어를 이용한 include는 포함할 파일의 소스를 그대로 현재문서에 포함시킨후 
컴파일진행. 따라서 하나의 페이지이므로 newVar1은 정상출력된다.
 -->
<p>외부 파일에 선언한 변수 : <%= newVar1 %></p>

<h3>액션태그로 페이지 포함하기</h3>
<!-- 액션태그 통한 include는 :
	- 문자열과 표현식 모두 사용가능
	- 포함할 파일을 먼저 컴파일한후 실행된결과페이지를 해당문서에 포함시킨다.
	  따라서 외부파일에서 선언한 변수를 현재페이지에서 사용할수없다.
	  
include 지시어와 액션태그 차이점 : 
지시어
	- jsp 소스를 그대로 포함시킨 후 페이지를 컴파일하므로 같은 페이지를 의미
	- jsp 코드와 변수등이 포함된 경우 사용
액션태그
	- jsp 소스를 먼저컴파일핞 실행결과를 포함시켜 기존페이지에서선언한변수는
	  현재페이지에서 사용불가이다.
	- html태그만 있거나 단독실행가능한 jsp 코드만 있을때 사용  -->
<jsp:include page="./inc/OuterPage2.jsp" />
<jsp:include page="<%= outerPath2 %>" />
<p>외부 파일에 선언한 변수 : <%--= newVar2 --%></p>
</body>
</html>