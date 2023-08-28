<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - choose/when/otherwise</title>
</head>
<body>
<!-- choose 태그 : 하위에 when, otherwise 태그 갖고있다. 여러 조건 있는 경우 사용하기 적합 -->
<c:set var="number" value="100" />

<!-- if태그와 동일하게 test속성에 조건을 기술한다 / otherwise : else와 동일한역할 -->
<h4>choose 태그로 홀짝 판단하기</h4>
<c:choose>
	<c:when test="${ number%2==0 }">${ number } 은/는 짝수입니다.</c:when>
	<c:otherwise>${ number } 은/는 홀수입니다.</c:otherwise>
</c:choose>

<h4>국, 영, 수 점수를 입력하면 평균을 내어 학점 출력</h4>
<form action="">
 	국어 : <input type="number" name="kor" min="0" max="100" /><br />
 	영어 : <input type="number" name="eng" min="0" max="100" /><br />
 	수학 : <input type="number" name="math" min="0" max="100" /><br />
 	<input type="submit" value="학점구하기" /><br />
</form>

<!-- 국영수 3과목 모두 점수입력해야지만 조건에 만족하므로 하나라도 입력되지 않으면 평균점수 출력안됨
c:choose 구문 안에 주석삽입시 에러 표시된다 -->
<c:if test="${ !(empty param.kor or empty param.eng or empty param.math) }">
	<c:set var="avg" value="${ (param.kor+param.eng+param.math)/3 }" />
	평균점수는 ${ avg } 점으로 
	<c:choose>
		<c:when test="${ avg>=90 }">A 학점</c:when>
		<c:when test="${ avg>=80 }">B 학점</c:when>
		<c:when test="${ avg>=70 }">C 학점</c:when>
		<c:when test="${ avg>=60 }">D 학점</c:when>
		<c:otherwise>F 학점</c:otherwise>
	</c:choose>
	 입니다.
</c:if>
</body>
</html>