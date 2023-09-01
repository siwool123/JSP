<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<style>
a {text-decoration: none;}
</style>
<script src="https://kit.fontawesome.com/f101226514.js" crossorigin="anonymous"></script><!-- 아이콘 -->
</head>
<body>
<h2>파일첨부형 게시판 - 목록보기 (List) </h2>

<form action="get"> <!-- 검색 폼 -->
<table border="1" width="90%" >
	<tr>
		<td align="center">
			<select name="searchField" id="">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchWord" />
			<input type="submit" value="검색하기" />
		</td>
	</tr>
</table>
</form>

<table border="1" width="90%"> <!-- 게시물 목록 테이블 -->
<tr> <!-- 각 컬럼의이름 -->
	<th width="10%">번호</th>
	<th width="*">제목</th>
	<th width="15%">작성자</th>
	<th width="10%">조회수</th>
	<th width="15%">작성일</th>
	<th width="8%">첨부</th>
</tr>
<c:choose> 
	<c:when test="${ empty boardLists }">
		<tr> <!-- 게시물이 없을 때 -->
			<td colspan="6" align="center">등록된 게시물이 없습니다^^</td>
		</tr>
	</c:when>
	<c:otherwise> <!-- 출력할 게시물이 있을때 -->
		<c:forEach items="${ boardLists }" var="row" varStatus="loop">
			<tr align="center">
				<td> ${ map.totalcnt - ((map.pageNum-1)*map.pageSize + loop.index) } </td>
				<td align="left"><a href="../mvcboard/view.do?idx=${ row.idx }"> ${ row.title } </a> </td>
				<td>${ row.name }</td>
				<td>${ row.visitcnt }</td>
				<td>${ row.postdate }</td>
				<td>
<!-- 첨부한파일 있는 경우에만 다운로드 링크 출력
해당링크의 매개변수는 원본파일명, 저장파일명, 일련번호 3개로 구성된다. 
특히 일련번호는 다운로드횟수증가에 사용됨 -->
				<c:if test="${ not empty row.ofile }">
					<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[DOWN]</a>
				</c:if>
				</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>

<!-- 하단 메뉴 (바로가기, 글쓰기) -->
<table border="1" width="90%">
	<tr align="center">
		<td>${ map.pagingImg }</td>
		
		<td width="100">
		<button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
		</td>
	</tr>
</table>
</body>
</html>