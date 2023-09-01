<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판 - 작성하기</title>
<script>
function validateForm(form) {
	if (!form.name.value) {
        alert("작성자를 입력하세요.");
        form.name.focus();
        return false;
    }
	
    if (!form.title.value) {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (!form.content.value) {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
    if (form.pw.value == "") {
        alert("비밀번호를 입력하세요.");
        form.pw.focus();
        return false;
    }
}
</script>
</head>
<body>
<h2>파일첨부형 게시판 - 글쓰기 (Write)</h2>
<!-- 글쓰기 페이지는 파일첨부위해 method는 post, enctype은 multipart로 설정한다
전송시 경로(요청) 가 쓰기페이지로 진입할떄와 동일하지만 컨트롤러에선 get방식과 psot방식에 따라 각각 처리할수있다 -->
<form action="../mvcboard/write.do" name="writeFrm" method="post" onsubmit="return validateForm(this)" enctype="multipart/form-data">
<table border="1" width="90%">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name" style="width:150px" /></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" style="width:90%" /></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="10" style="width:90%"></textarea></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><input type="file" name="ofile" multiple />
		<p>개별 파일 용량은 1MB까지 업로드 가능합니다.</p>
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" style="width:100px" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="submit">작성완료</button>
			<button type="reset">다시입력</button>
			<button type="button" onclick="location.href='../mvcboard/list.do';">목록보기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>