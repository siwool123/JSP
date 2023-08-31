package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/* 사용자가 post 방식으로 전송한 요청을 처리하기위해 dopost() 메소드를 오버라이딩한다
 * 만약 해당 메소드가 오버라이딩되지 않으면 요청을 처리할 메소드가 없으므로 405에러 발생
 * 
 *  서블릿에서 직접 html 태그를 출력하기위해 문서의 컨텐츠타입을 설정해야한다
 *  직접 출력 위해 PrintWriter 객체를 생성한다.
 *  
 *   이 방식은 jsp 페이지 없이 서블릿에서 직접 내용을 출력해야할때 사용한다. api 통신시 주로 사용한다 */
public class DirectServletPrint extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html><head><title>DirectServletPrint</title></head><body>"
				+ "<h2>서블릿에서 직접 출력합니다.</h2><p>jsp로 포워드하지 않습니다.</p></body><html>");
		writer.close();
	}
}
