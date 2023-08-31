package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/* web.xml 에 매핑하는대신 @WebServlet 어노테이션 사용하여 요청명에대한 매핑한다
 * 편한방식이지만 차후 유지보수위해서는 요청명과 서블릿클래스의 관계를 명확히 해둔상태에서 사용해야한다
 * 리퀘스트 영역에 속성 저장 후 jsp로 포워드한다 */
@WebServlet("/12Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "@WebServlet으로 매핑");
		req.getRequestDispatcher("/12Servlet/AnnoMapping.jsp").forward(req, resp);
	}
}
