<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
    <h2>로그인 페이지</h2>
<!-- 로그인 위해 폼값 전송후 조건에맞는회원정보가없는경우 request영역에 에러메세지를 저장후
현재페이지로 forward한다. 
request 영역은 forward된 페이지까지는 영역이 공유되므로 아래 메세지 출력가능 

session영역에 해당속성값이 있는지 확인. 
즉, 세션영역에 데이터없다면 로그아웃상태이므로 로그인폼을 웹브라우저에 출력한다. 
--> 
    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    if (session.getAttribute("UserId") == null) { 
    %>
    <script>
    /* 로그인 폼의 입력값을 검증하기 위한 함수로 빈값인지를 확인한다. */
    function validateForm(form) {
    	//입력값이 공백인지 확인후 경고창, 포커스이동, 폼값전송 중단처리를 한다.
        if (!form.user_id.value) {
            alert("아이디를 입력하세요.");
            form.user_id.focus();
            return false;
        }
        if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            form.user_pw.focus();
            return false;
        }
    }
    </script>
<!-- 회원정보는 보안이필요하여 반드시 post방식으로 전송해야한다. -->
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">
        아 이 디 : <input type="text" name="user_id" /><br /><br />
        패스워드 : <input type="password" name="user_pw" /><br /><br />
        <input type="submit" value="로그인하기" />
    </form>
    <%
    } else {  
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
        <a href="Logout.jsp">[로그아웃]</a>
    <%
    }
    %>

</body>
</html>