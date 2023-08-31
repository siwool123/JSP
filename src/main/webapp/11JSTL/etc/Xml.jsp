<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - xml</title>
</head>
<body>
<!-- import 태그 통해 xml문서가져온다. var에 저장
xml파일위해 parse 태그에 1차로 설정. 뒤에서 blist라는 변수명으로 각 노드를 파싱할것이다
booklist 하위노드에 2개의 book이 있으므로 인덱스 통해 접근후 데이터를 파싱한다
이처럼 xml 문서를 마치 경로처럼 접근하는걸 xPath라고한다.
XPath는 el과 달리 {} 를 사용하지 않는다 -->
	<c:set var="booklist">
    	<c:import url="/11JSTL/inc/BookList.xml" charEncoding="UTF-8" />
    </c:set>

    <x:parse xml="${booklist}" var="blist" />
   
    <h4>파싱 1</h4>
    제목 : <x:out select="$blist/booklist/book[1]/name" /> <br />
    저자 : <x:out select="$blist/booklist/book[1]/author" /> <br />
    가격 : <x:out select="$blist/booklist/book[1]/price" /> <br />
    
    <h4>파싱 2</h4>
    <table border="1">
        <tr>
            <th>제목</th><th>저자</th><th>가격</th>
        </tr>
        <x:forEach select="$blist/booklist/book" var="item">
        <tr>
            <td><x:out select="$item/name" /></td>
            <td><x:out select="$item/author" /></td>
            <td>
                <x:choose>
                    <x:when select="$item/price >= 20000">  2만 원 이상 <br /></x:when>
                    <x:otherwise>2만 원 미만 <br /></x:otherwise>
                </x:choose>
            </td>        
        </tr>
        </x:forEach>
    </table> 
        
    <h4>파싱 3</h4>
    <table border="1">
    	<tr>
            <th>제목</th><th>저자</th><th>가격</th><th>비고</th>
        </tr>
        <x:forEach select="$blist/booklist/book" var="item">
        <tr>
            <td><x:out select="$item/name" /></td>
            <td><x:out select="$item/author" /></td>
            <td><x:out select="$item/price" /></td>
            <td><x:if select="$item/name = '총,균,쇠'">구매함</x:if></td>
   <!-- if태그로 조건이 true일떄만 실행되는 구문 작성함. 비교연산자로 == 대신 = 사용하니 주의해야한다 --> 
        </tr>
        </x:forEach>    
    </table>
</body>
</html>