<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//응답헤더에 추가할값준비
/* get 방식으로 전송된 폼값을 날짜형식을통해 타임스탬프로 변경한다.
getTime() : 날짜를 1970년부터 지금까지의 시간을 초단위로 변경하여 반환해준다.
응답헤더 날짜 지정한느 경우 대한민국은 세꼐표준시(긔리티치천문대)에 9시간 빠르므로 그만큼 더해줘야 
정상적 날짜가 출력됨. 만약 9시 이전 시간으로 세팅되면 이전날짜가 출력됨

문자열 형식을 날짜형식으로 변형하기위해 포맷설정
초단위로 변경된 시간을 long타입 변수로 받는다. 
숫자형식으로 전송된 값은 정수로 변환한다.
문자형은 그대로 사용 
form 태그를 통해 서버로 전송된 값은 모두 String 타입이므로 숫자나 날짜형식의 연산필요한경우 변환후 사용해야함*/
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = s.parse(request.getParameter("add_date")).getTime();
System.out.println(add_date);
int add_int = Integer.parseInt(request.getParameter("add_int"));
String add_str = request.getParameter("add_str");

//응답헤더에 값추가
/* addDateHeader(헤더명, long타입의 타임스탬프) : 응답헤더에 날짜형식을 추가한느 경우 long
	타입의 타임스탬프로 변환후 추가하면된다.
addIntHeader(), addHeader() : 숫자/문자 형식의 응답헤더 추가 */
response.addDateHeader("myBirthday", add_date);
response.addIntHeader("myNumber", add_int);
response.addIntHeader("myNumber", 1004); //정수타입 추가. 동일헤더명으로 2개값 추가
response.addHeader("myName", add_str);
response.setHeader("myName", "안중근"); //기존의 응답헤더를 안중근 으로 수정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response</title>
</head>
<body>
<h2>응답헤더정보 출력하기</h2>
<%
//getHeaderNames() 통해 응답헤더명 전체를 얻어온다.
Collection<String> hNames = response.getHeaderNames();
for(String hname:hNames) {String hValue = response.getHeader(hname);
%>
<li><%= hname %> : <%= hValue %></li>
<%
}
%>
<%-- 첫번째 출력결과에서 myNumber 라는 헤더명이 2번출력되는데 이때 동일값 8282가 출력된다.
이것은 getHeader() 메소드 특성으로 처음 입력한 헤더값만 출력되는것이다. --%>
<h2>myNumber만 출력하기</h2>
<%
/* myNumber라는 헤더명으로 2개값 추가했으므로 아래에선 각각 값이 정상출력됨
즉 add계열의 메소드는 헤더명을 동일하게 사용하더라도 헤더값은 정상추가된다. 즉, 덮어쓰기되지않는다. 
8282, 1004가 순서대로 출력된다. */
Collection<String> myNumbers = response.getHeaders("myNumber");
for(String myNum:myNumbers) {
%>
<li><%= myNumbers %> : <%= myNum %></li>
<%
}
%>
</body>
</html>