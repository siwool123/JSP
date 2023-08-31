package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/* 어노테이션 통한 요청명 매핑으로 * 통해 여러요청명을 한번에 매핑한다
 * 즉 .one으로 끝나는 모든 요청에 매핑처리한다 
 * 
 * get방식으로들어오는 요청처리위해 doGet메소드를 오버라이딩한다.
 * 해당메서드가 없다면 405에러 발생한다
 * 
 * request 내장객체 통해 현재 요청된 url을 얻어온다. 전체경로명에서 host제외한 나머지경로 얻어올수있다
 * 
 *  마지막 요청명 통해 요청을 판단후 해당 요청을 처리. 즉 사용자의 모든 요청을 처리한다* */
@WebServlet("*.one")
public class FrontController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if(commandStr.equals("/regist.one")) req.setAttribute("resultValue", "<h4>회원가입</h4>");
		else if(commandStr.equals("/login.one")) req.setAttribute("resultValue", "<h4>로그인</h4>");
		else if(commandStr.equals("/freeboard.one")) req.setAttribute("resultValue", "<h4>자유게시판</h4>");
		
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		req.getRequestDispatcher("/12Servlet/FrontController.jsp").forward(req, resp); //view로 포워드하여 변수를 공유
	}
}
