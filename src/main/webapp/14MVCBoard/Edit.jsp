<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title>
<!-- 수정페이지는 작성페이지를 복사후 조금만수정하면된다
단, 비번검증거쳐서 진입하므로 비번입력란 제거
또한 검증 비번은 세션영역에 저장되어있다 -->
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
}
</script>
</head>
<body>
<h2>파일첨부형 게시판 - 수정하기 (Edit)</h2>
<form action="../mvcboard/edit.do" name="writeFrm" method="post" onsubmit="return validateForm(this)" enctype="multipart/form-data">
<!-- 수정할게시물의 일련번호, 기존파일명, 기존저장파일명
만약 수정페이지에서 첨부파일변경하지않으면 여기등록된 파일명 사용해 update 예정 -->
<input type="hidde-n" name="idx" value="${ dto.idx }" />
<input type="hidde-n" name="pw" value="${ dto.pw }" />
<input type="hidde-n" name="pw" value="${ pw }" />
<input type="hidde-n" name="prevOfile" value="${ dto.ofile }" />
<input type="hidde-n" name="prevSfile" value="${ dto.sfile }" />

<table border="1" width="90%">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="name" style="width:150px" value="${ dto.name }" /></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" style="width:90%" value="${ dto.title }" /></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="10" style="width:90%">${ dto.content }</textarea></td>
	</tr>
	<tr>
<!--파일엔 value 속성 사용하지않는다. 만약사용하더라도 단순한 string 정보이므로 의미없다 -->
		<td>첨부파일</td>
		<td><input type="file" name="ofile" multiple />
		<p>개별 파일 용량은 1MB까지 업로드 가능합니다.</p>
		</td>
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