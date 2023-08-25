<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%@ include file="../Common/Link.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
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
<%-- <jsp:include page="../Common/Link.jsp" /> --%>
<h2>회원제 게시판 - 글쓰기 (Write)</h2>
<!-- 글쓰기 폼은 반드시 post방식으로 해야한다. get방식은 파일을 첨부할수없고 전송량도 4kb로 제한된다.
하지만 post는 전송량의 제한이 없고 이미지, 음원등의 파일도 전송할수있기때문 -->
<form action="WriteProcess.jsp" name="writeFrm" method="post" onsubmit="return validateForm(this)">
<table border="1" width="90%">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" style="width:90%" /></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="10"  cols="100"  style="width:90%"></textarea></td>
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