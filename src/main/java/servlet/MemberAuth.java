package servlet;

import java.io.IOException;
import java.sql.DriverManager;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet {
	MemberDAO dao; //서블릿에서 멤버변수 선언. 생서자는 따로 필요없다. 생성주기에서 알아서소멸시킨다

/* 클라이언트가 최초 요청시 서블릿 객체가 생성되는데 이때 최초1번만 호출되는 init() 메소드에서 DB연결처리한다 */
	public void init() throws ServletException {
		
/* 서블릿 내에서 application 내장객체를 얻어온다. 모델2방식에서는 서블릿이 먼저 요청받기때문에 
 * 모델1방식처럼 jsp에서 매개변수로 내장객체를 전달할수없다. 
 * 따라서 각 내장객체 얻어올수있는 메소드가존재한다 */
		ServletContext application = this.getServletContext();
		
//web.xml에 저장된 컨텍스트 초기화 파라미터를 얻어온다
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String oid = application.getInitParameter("OracleId");
		String opw = application.getInitParameter("OraclePw");
		
		dao = new MemberDAO(driver, url, oid, opw);
	}

/* service() 메소드는 get/post 방식 둘다 요청받을수있다.
 * 서블릿 매핑시 <init-param>에 등록한 서블릿 초기화 파라미터를 얻어온다. 
 * 해당 (MemberAuth) 서블릿에서만 사용가능
 * 
 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id");
		
		//쿼리스트링으로 전달된 파라미터를 얻어온다
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
/* dao의 회원인증위한 메소드호출. 아이디, 비번을통해 회원인증진행후 일치하는 정보있다면 
 * 회원레코드를 dto에 저장후 반환한다
 * 
 * DTO객체에 회원이름이 저장되어있다면 로그인에 성공한 경우로 판단할수있다
 * 회원인증에 실패한 경우 서블릿초기화파라미터와비교해 최고관리자인지 확인한다. 
 * 만약 최고관리자도 아니면 비회원으로 판단한다  
 *  */
		MemberDTO dto = dao.getMemberDTO(id, pass);
		
		String memberName = dto.getName();
		if(memberName != null) req.setAttribute("authMessage", memberName+" 회원님 반갑습니다^^");
		else {
			if(admin_id.equals(id)) req.setAttribute("authMessage", admin_id+" 는 최고 관리자입니다.");
			else req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
		}
		req.getRequestDispatcher("/12Servlet/MemberAuth.jsp").forward(req, resp);
	}
	
	//서블릿 종료시 dao객체도 같이 자원해제한다
	public void destroy() {
		dao.close();
	}
}
