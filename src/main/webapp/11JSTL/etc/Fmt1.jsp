<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %><!-- 국제화 태그 사용위한 지시어 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt1</title>
</head>
<body>
<!-- 국제화 태그(Formatting) 태그 : 국가별로 다양한 언어, 날짜, 시간, 숫자형식 설정시 사용. 접두어로 fmt 사용
groupingUsed : 세자리마다 컴마 출력. 디폴트값이 true이므로 컴마출력을 원하지않으면 false 지정해야한다

type : currency인 경우 현지 통화기호로 출력된다.
var속성 지정시 즉시출력되지않고, 원하는위치에 el통해 출력됨
currencySymbol 속성으로 통화기호변경가능  -->
<h4>숫자 포맷 설정</h4>
<c:set var="number1" value="12345" />
콤마 O : <fmt:formatNumber value="${ number1 }" /><br />
콤마 X : <fmt:formatNumber value="${ number1 }" groupingUsed="false" /><br />
<fmt:formatNumber value="${ number1 }" type="currency"  var="printNum1" />
통화기호 : ${ printNum1 }&nbsp;
<fmt:formatNumber value="${ number1 }" type="currency" currencySymbol="$"/><br />

<!-- value값을 %단위로 변환하여출력. 즉 100곱한결과에 %기호붙여준다 -->
<fmt:formatNumber value="0.03" type="percent"  var="printNum2" />
퍼센트 : ${ printNum2 }<br />

<!-- Integer.parseInt()와 동일한 기능으로 문자열을 숫자로 변경한다
pattern : 반환할 문자열의 패턴을 지정하여 파싱한다.
integerOnly : 소수점이하를 절삭하여 정수부만 출력

pattern으로 주어진 부분을 분석하여 문자열을 숫자로 파싱
해당속성값으로 000,000.00 사용시 정상
0,0.0 사용시 정상
,. 사용시 에러발생
 -->
<h4>문자열을 숫자로 변경</h4>
<c:set var="number2" value="6,789.012" />
<fmt:parseNumber value="${ number2 }" pattern="00,000.00"  var="printNum3" />
소수점까지 : ${ printNum3+1 }<br />
<fmt:parseNumber value="${ number2 }" integerOnly="true"  var="printNum4" />
정수부분만 : ${ printNum4 }
</body>
</html>