<%@page import="common.MyClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 선언부(Declaration) : 스크립트렛이나 표현식에서 사용할 메소드 선언시 사용
선언부에서 선언된 메소드는 해당 JSP가 서블릿(자바파일)로 변환시 멤버메소드형태로 선언된 --%>
<%! //선언부는 !로 시작. 자바에선 메소드내 또다른 메소드를 선언할수없다. jsp는 자바문법따르므로
//선언부에서 !제거시 즉시에러발생함. !제거하는건 _jspService()내에 새 메소드를 선언하는게 되기때문
public int add(int num1, int num2){
	return num1+num2;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%-- 스크립트렛(Scriptlet) : 주로 jsp코드 작성하고 실행시 사용
스크립트렛은 body, head 어디서든 사용가능. 또한 <script><style> 태그 내부에서도 사용가능
여기 기술된 코드는 _jspService() 메소드 내에 포함되므로 해당영역엔 메소드 선언할수없다.

표현식(Expression) : 변수를 웹브라우저상에 출력시 사용
JS의 document.write()와 동일한 역할 한다. 표현식 사용시 주의할점은 문장끝에 ; 붙이지않는다. --%>
<%
int result = add(10,20);
%>
덧셈결과1 : <%= result %><br>
덧셈결과2 : <%= add(30,40) %>

<h2>내가만든 java클래스의 메소드 호출하기</h2>
<%
	out.println("1~10까지의합 : "+MyClass.myFunc(1, 10));
%>
</body>
</html>