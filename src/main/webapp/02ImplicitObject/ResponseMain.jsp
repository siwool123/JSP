<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response</title>
</head>
<body>
<h2>1. 로그인 폼</h2>
<%-- get방식으로 전달된 loginErr 파라미터가 있ㄴ느 경우에만 로그인실패 를 출력. 
첫 실행시엔 파라미터가 없는 상태이므로 메세지는 출력안됨

로그인 위해 post방식으로 폼값전송. get방식으로 전송하면 로그인정보가 쿼리스트링으로 주소줄에남기때문에
개인정보유출의 위험이있어 로그인처럼 보안이 필요한 경우엔 post방식사용해야한다 --%>
    <%
    String loginErr = request.getParameter("loginErr");
    if (loginErr != null) out.print("로그인 실패");
    Date now = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    %>
    <form action="./ResponseLogin.jsp" method="post">
        아이디 : <input type="text" name="user_id" /><br />
        패스워드 : <input type="text" name="user_pw" /><br />
        <input type="submit" value="로그인" />
    </form>

    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <form action="./ResponseHeader.jsp" method="get">
        날짜 형식 : <input type="text" name="add_date" value="<%= df.format(now) %>"/><br />  
        숫자 형식 : <input type="text" name="add_int" value="8282" /><br />
        문자 형식 : <input type="text" name="add_str" value="홍길동" /><br />
        <input type="submit" value="응답 헤더 설정 & 출력" />
    </form>
</body>
</html>