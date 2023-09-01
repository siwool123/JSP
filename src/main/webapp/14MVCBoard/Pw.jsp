<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title>
<script>
function validateForm(form) {
    if (form.pw.value == "") {
        alert("비밀번호를 입력하세요.");
        form.pw.focus();
        return false;
    }
}
</script>
</head>
<body>
<h2>파일첨부형 게시판 - 비밀번호 검증(PW)</h2>
<!-- 패스워드 검증 페이지는 글쓰기 페이지를 복사해서 제작하면된다
단, 패스워드만 전송하면 되므로 enctype은 삭제해야한다

비번 검증위해 게시물의 일련번호와 모드를 전송해야하므로 hidden박스로 값을 저장한다 -->

<form action="../mvcboard/pw.do" name="writeFrm" method="post" onsubmit="return validateForm(this)">
<input type="hidde-n" name="idx" value="${ param.idx }" />
<input type="hidde-n" name="mode" value="${ mode }" />
<table border="1" width="90%">
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" style="width:100px" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">검증하기</button>
			<button type="reset">다시입력</button>
			<button type="button" onclick="location.href='../mvcboard/list.do';">목록보기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>