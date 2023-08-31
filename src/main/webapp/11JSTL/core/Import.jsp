<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - import</title>
</head>
<body>

<!-- import 태그 : 외부문서를 현재문서에 포함시킨다. 
include 지시어처럼 외부문서 먼저 포함시킨후 컴파일하는 형식아니라 
include액션태그처럼 컴파일 먼저 진행된후 결과 포함시키게된다.
따라서 서로다른페이지이므로 page영역은 공유되지않고, request 영역만 공유된다.
url속성에 절대경로로 지정할경우 컨텍스트루트 경로명은 포함하지 않는다.

var 속성 미사용시 : include 액션태그와동일하게 현재위치에서 즉시 외부문서 포함시킨다
사용시 : var에지정한 변수를 el로 출력하는곳에 포함된다.
선언과 출력을 별도로 할수있어 코드의 가독성 높아진다

import 태그의 하위태그로 param을 사용가능. 쿼리스트링 통해 전달하듯 
지정된 페이지로 파라미터 전달한다. -->

<c:set var="requestVar" value="MustHave" scope="request" />
<c:import url="/11JSTL/inc/OtherPage.jsp" var="contents">
	<c:param name="user_param1" value="JSP" />
	<c:param name="user_param2" value="기본서" />
</c:import>

<h4>다른 문서 삽입하기</h4>
${ contents } <!-- 앞서 선언한 import태그의 var속성변수통해 문서내용출력-->

<h4>외부 자원 삽입하기</h4> <!-- 외부url도 import 가능 -->
<iframe src="../inc/GoldPage.jsp" style="width:80%; height:600px;"></iframe>

<!-- 아래처럼 이미지삽입시 상대경로 사용하는게 주로낫다
만약 절대경로 사용해야한다면 하드코딩보다 request내장객체에서 제공한느 메소드 사용하는게좋다.
웹프로그래밍은 웹서버에 배포하는것이 목적이므로 서버 환경 달라지면 경로까지 수정해야한느경우
이를 최소화할수있도록 개발하는게좋다
특히 jstl에서 url을 지정할때 컨텍스트루트 경로는 명시하지않아도되므로 일반적방식보다 작성에 유리하다 -->

<h4>이미지 삽입하기</h4>
<img src="../../images/disk.png" width="100px" /><br />	<!-- 상대경로 -->
<img src="/JSPStudy/images/disk.png" width="100px" />	<!-- 절대경로 -->
<img src="<%= request.getContextPath() %>/images/disk.png" width="100px" />
<img src="${ pageContext.request.contextPath }/images/disk.png" width="100px" />
</body>
</html>