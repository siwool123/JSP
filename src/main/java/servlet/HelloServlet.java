package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	/**
서블릿 클래스 만들기 위한 절차
1. HttpServlet 클래스를 상속한다
2. 클라이언트의 요청 받아 처리하기위한 doGet() 혹은 doPost() 메소드를 오버라이딩 한다
3. 서블릿에 필수적인 패키지 임포트와 예외처리는 자동완성된다
4. request 내장객체 사용시 매개변수 req 이용한다. response는 resp로 사용하면된다 
	서블릿 작성시 발생하는 경고 위해 추가하는 내용으로 없어도 문제되지않는다 */
	private static final long serialVersionUID = 1L;
	
/* get방식 요청 처리하기위한 doGet()메소드 오버라이딩 
 * request 영역에 속성저장
 * view에 해당하는 jsp 페이지로 포워드한다  
 * 리퀘스트 영역은 포워드된 페이지까지공유되므로 서블릿에서 젖아한 속성은 jsp에서 사용할수있다 */	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "Hello Servlet......!!");
		req.getRequestDispatcher("/12Servlet/HelloServlet.jsp").forward(req, resp);
	}
	
}
