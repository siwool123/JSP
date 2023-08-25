<%@page import="utils.BoardPage"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalcnt = dao.selectCnt(param); //게시물수 확인

/*** 페이지 처리 start ***/
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int) Math.ceil((double)totalcnt / pageSize); /* 전체페이지수 계산 */

/* 목록 청므진입시 페이지 관련 파라미터가 없는상태이므로 무조건 1page로 지정한다.
만약 파라미터가 pageNum이 있다면 request 내장객체통해 받아온후 페이지번호로 지정한다.
List.jsp > 이처럼 파라미터가 없는상태일때는 null
List.jsp?pageNum= > 이처럼 파라미터는 있는데 값없을떄는 빈값으로 체크된다. 
따라서 아래 if문은 2개의 조건으로 구성해야한다.*/
int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals("")) pageNum = Integer.parseInt(pageTemp);

/* 페이지 시작번호와 종료번호 계산후 map컬렉션에 추가한다. */
int start = (pageNum-1)*pageSize+1;
int end = pageNum*pageSize;
param.put("start", start);
param.put("end", end);
/*** 페이지 처리 end ***/

List<BoardDTO> boardLists = dao.selectListPage(param); //게시물 목록 받기
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script src="https://kit.fontawesome.com/f101226514.js" crossorigin="anonymous"></script><!-- 아이콘 -->
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>목록보기 (List) - 현재페이지 : <%= pageNum %> (전체 : <%= totalPage %>)</h2>
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
	int cntNum = 0;
	for(BoardDTO dto : boardLists){
		
		virtualNum = totalcnt-((pageNum-1)*pageSize+cntNum++);
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
		<td align="center" width="75%">
		<%= BoardPage.pagingImg(totalcnt, pageSize, blockPage, pageNum, request.getRequestURI()) %>
		</td>
		
		<td><button type="button" onclick="location.href='Write.jsp';">글쓰기</button></td>
	</tr>
</table>
</form>
</body>
</html>