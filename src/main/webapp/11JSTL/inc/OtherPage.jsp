<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- request 영역에 저장된 속성값출력
파라미터로 전달된 값출력. 해당파라미터는     \:   a r a m\  태그 통해 전달된다 -->
<h4>OtherPage.jsp</h4>
<ul>
	<li>저장된 값 : ${ requestVar }</li>
	<li>매개변수 1 : ${ param.user_param1 }</li>
	<li>매개변수 2 : ${ param.user_param2 }</li>
</ul>
