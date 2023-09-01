package model2.mvcboard;

import java.io.IOException;
import java.util.ArrayList;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import utils.JSFunction;

/* 비회원제 게시판에서는 게시물 수정/삭제 위해서 패스워드 검증이 먼저선행되어야한다
 * 따라서 해당페이지로 진입한후 패스워드가 일치하는지 확인한후 처리하게된다
 * 
 * 검증페이지로 진입시 get 방식으로 처리한다
 * 페이지로 전달되는 파라미터가 컨트롤러에서 필요한 경우엔 request 내장객체 통해 받아 사용한다
 * 만약 jsp에서 필요하면 el의 내장객체 param을 이용하면된다
 */

@WebServlet("/mvcboard/pw.do")
public class PassController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/14MVCBoard/Pw.jsp").forward(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)	throws ServletException, IOException { 

		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pw = req.getParameter("pw");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		boolean confirmed = dao.checkPw(pw, idx); //비번과 일련번호가 일치한 게시물이있는지 확인
		dao.close();

		if(confirmed) {
			if(mode.equals("edit")) {
/* 서블릿에서 session 내장객체를 얻어온다 > 입력한 비번을 세션영역에 저장
 * > 수정페이지로 이동. 앞서 저장된 비번은 페이지 이동하더라고 공유된다 */
				HttpSession seesion = req.getSession();
				seesion.setAttribute("pw", pw);
				resp.sendRedirect("../mvcboard/edit.do?idx="+idx);
			}else if(mode.equals("delete")) {
				
/*기존게시물 내용을 가져온다. > 게시물삭제 > 게시물삭제성공시 첨부파일도 삭제	
 * 서버에 실제 저장된 파일명으로 삭제 > 삭제완료시 목록으로 이동 / 비번불칠치 시 뒤로이동 */
				dao = new MVCBoardDAO();
				MVCBoardDTO dto = dao.selectView(idx);
				int result = dao.deletePost(idx);
				dao.close();
				if(result==1) {
					String sFileName = dto.getSfile();
					FileUtil.deleteFile(req, "/Uploads", sFileName);
				}
				JSFunction.alertLocation(resp, "삭제되었습니다.", "../mvcboard/list.do");
			}
		}else JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
	}
}
