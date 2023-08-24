<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정페이지로 진입시 로그인 확인
수정할 게시물의 일련번호를 파라미터로 받아온다.
기존게시물내용 읽어온다.
세션영역에 저장된 회원아디가져와 문자열로변환 > 
게시물작성자 id와 비교 > 작성자 아니면 진입못하도록하고 뒤로이동

URL패턴을 파악하면 내가 작성한 게시물 아니어도 수정페이지에 진입할수있다
따라서 수정페이지 자체에서도 작성자 본인 맞는지 확인절차필요 -->
<%@ include file="./IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
String sessionId = session.getAttribute("UserId").toString();

if(!sessionId.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할수있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
function validateForm(form) {
    if (form.title.value=="") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>회원제 게시판 - 수정하기 (Edit)</h2>
<form action="EditProcess.jsp" name="writeFrm" method="post" onsubmit="return validateForm(this)">

<!-- 게시물의 일련번호를 서버로 전송하기위해 hidden 타입의 input 태그가 반드시필요하다
이부분 추가되지않으면 게시물 수정되지 않는다. 

input태그경우 기존의 내용을 value속성에추가하면 된다. -->
<input type="hidden" name="num" value="<%= dto.getNum() %>" />
<table border="1" width="90%">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" style="width:90%" value="<%= dto.getTitle() %>"/></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
		<textarea name="content" rows="10" cols="100" style="width:90%"><%= dto.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">작성완료</button>
			<button type="reset">다시입력</button>
			<button type="button" onclick="location.href='List.jsp'">목록보기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>