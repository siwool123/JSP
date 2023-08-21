<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //전송된 폼값 받는다.
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check");
/* 체크박스 경우 둘이상값이라면 getParameterValues()로 폼값받아야하지만
항목이 한개라면 아래처럼받을수잇다*/

if("must".equals(user_id) && "1234".equals(user_pw)){
	if(save_check!=null && save_check.equals("Y")){
		
/*로그인성공하고 아이디저장 체크한경우 하루동안 유효한 쿠키생성. 
쿠키값은 로그인한 아이디로 설정 

> 로그인성공하고 아이디저장 체크안한경우 쿠키삭제*/
		CookieManager.makeCookie(response, "loginId", user_id, 86400);
	}else CookieManager.deleteCookie(response, "loginId");
	
//로그인성공경고창띄운후 로그인페이지로 이동 <> 로그인실패시 메세지만띄움
	JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
}else {
	/* JSFunction.alertBack("로그인에 실패했습니다.", out); */
%>
<!-- 자바스크립트로 작성하려면 이처럼 스크립트렛을 분리하여 html 영역만든후
스크립트를삽입해야한다. 따라서 소스가지저분해지고 가독성떨어진다. -->
	<script>
	alert("로그인에실패했습니다.");
	//history.back();
	history.go(-1);
	</script>
<%
}
%>
