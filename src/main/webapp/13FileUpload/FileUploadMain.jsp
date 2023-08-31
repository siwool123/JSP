<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload</title>
</head>
<script>
function validateForm(form) {
    if (!form.title.value) {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.ofile.value == "") {
        alert("첨부파일을 반드시 업로드해주세요.");
        form.ofile.focus();
        return false;
    }
}
</script>

<body>
<!-- 파일 첨부 위한 form 태그 구성시 아래 2가지는 필수사항
1. method 속성은 반드시 post
2. enctype 속성은 multipart/form-data 로 해야한다
만약 get 방식 설정시 파일명만 전송된다 -->

<h3>파일업로드</h3>
<span style="color:red;">${ errorMessage }</span>
<form action="UploadProcess.do" name="fileForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this);">

	제목 : <input type="text" name="title" /> <br />
	카테고리(선택사항) : 
	<input type="checkbox" name="cate" value="사진" checked />사진
	<input type="checkbox" name="cate" value="과제" />과제
	<input type="checkbox" name="cate" value="워드" />워드
	<input type="checkbox" name="cate" value="음원" />음원<br />
	첨부파일 : <input type="file" name="ofile" /> <br />
	<input type="submit" value="전송하기" />
</form>
</body>
</html>