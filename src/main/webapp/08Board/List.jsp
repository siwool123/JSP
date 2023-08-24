<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

/* 검색어 있는경우 클라이언트가 선택한 필드명과 검색어를 저장할 map 컬렉션 생성
  검색폼에서 입력한 검색어와 필드명을 파라미터로 받아온다. 해당 폼태그전송방식은
  get, action 속성은 없는상태라 현재페이지로 폼값이 전송된다.
 
  클라이언트가 입력한 검색어가 있는경우에만 map컬렌션에 컬럼명과 검색어를 추가한다.
  해당값은 DB처리위한 모델 객체로 전달된다.
  */
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalcnt = dao.selectCnt(param);
List<BoardDTO> boardLists = dao.selectList(param);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>목록보기 (List)</h2>
<form action="" method="get">
<table border="1" width="90%">
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

<table border="1" width="90%"> <!-- 게시물 목록 테이블 -->
<tr> <!-- 각 컬럼의이름 -->
	<th width="10%">번호</th>
	<th width="50%">제목</th>
	<th width="15%">작성자</th>
	<th width="10%">조회수</th>
	<th width="15%">작성일</th>
</tr>
<%
if(boardLists.isEmpty()){
%>	
	<tr>
		<td colspan="5" align="center">등록된 게시물이 없습니다. ^^*</td>
	</tr>
<%
}else{
	int virtualNum = 0;
	for(BoardDTO dto : boardLists){
		virtualNum = totalcnt--;
%>
	<tr align="center">
		<td><%= virtualNum %></td>
		<td align="left"><a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a></td>
		<td align="center"><%= dto.getId() %></td>
		<td align="center"><%= dto.getVisitcnt() %></td>
		<td align="center"><%= dto.getPostdate() %></td>
	</tr>
<%
	}
}
%>
</table>
<table border="1" width="90%">
	<tr align="right">
		<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
	</tr>
</table>
</form>
</body>
</html>