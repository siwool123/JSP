<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- html 주석 : 소스보기시 화면에 출력됨
보통의 경우 include 되는 jsp 파일은 html 태그없이 순수한 jsp 코드만 작성하는게좋다.
포함되었을때 html태그가 중복될수있기때문이다. -->
<%--jsp 주석 : 소스보기하더라도 출력안됨
포함되는 페이지 만들때도 page지시어는 반드시 있어야한다. 
page지시어가 없는 jsp파일은 500에러발생함 --%>
<%
LocalDate today = LocalDate.now(); //오늘날짜
LocalDateTime tmrw = LocalDateTime.now().plusDays(1); //내일날짜
%>
