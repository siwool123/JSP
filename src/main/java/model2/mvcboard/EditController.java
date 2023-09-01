package model2.mvcboard;

import java.io.File;
import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;
//요청명에 대한 매핑 > 수정페이지에서도 파일등록가능하므로 파일용량제한설정
@WebServlet("/mvcboard/edit.do")
@MultipartConfig( 
		maxFileSize = 1024*1024,
		maxRequestSize = 1024 * 1024 * 10
)
public class EditController extends HttpServlet {
/* 수정페이지로 진입시 기존내용 가져와 쓰기폼에 세팅한다. 
 * 단순한페이지이동이므로 get방식요청이다
 * 
 * 일련번호받는다 > dao객체생성후 기존게시물내용가져온다 > dto객체를 request영역에 저장후 포워드
 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		MVCBoardDAO dao = new  MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14MVCBoard/Edit.jsp").forward(req, resp);
	}

/* 수정내용입력후 전송폼값을 update쿼리문으로 갱신
 * 게시판은 post방식으로 전송되므로 dopost오버라이딩
 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)	throws ServletException, IOException { 
		//1. 파일업로드처리 > 업로드될 디렉토리의 물리적 경로 확인
		String sDirectory = req.getServletContext().getRealPath("/Uploads");
		String oFileName = ""; //파일업로드 
		try { 
			oFileName = FileUtil.uploadFile(req, sDirectory); 
		}catch(Exception e) { 
			e.printStackTrace();
			JSFunction.alertBack(resp, "개별 파일 용량은 1MB까지 업로드 가능합니다.");
			return; 
		}

		/*2. 파일업로드 외 처리 > 수정내용을 매개변수에서 얻어옴 
		 * 수정위해 hidden박스에저장된내용도 함께받아온다. 
		 * 게시물의 일련번호와 기존등록파일명이 함께 전송된다 */
		String idx = req.getParameter("idx");
		String prevOfile = req.getParameter("prevOfile");
		String prevSfile = req.getParameter("prevSfile");
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
	/* 비번검증 성공시 세션영역에저장된비번가져온다
	 * 영역에저장시 object 타입으로 자동형변환되므로 기존타입으로 다운캐스팅해야한다
	 */
		HttpSession session = req.getSession();
		String pw = (String)session.getAttribute("pw");
		
		//dto에 저장
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPw(pw);

/* 수정페이지에서 새로등록한파일있다면 기존내용수정해야함
 * 파일명 이름을 변경후 원본파일명과 저장파일명을 dto에 저장 */
		if(oFileName!="") {
			String sFileName = FileUtil.renameFile(sDirectory, oFileName);
			dto.setOfile(oFileName); //원본파일명 세팅
			dto.setSfile(sFileName); //서버에 저장된 파일명
			//기존파일삭제
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}else {
			dto.setOfile(prevOfile); //첨부파일없으면 기존이름 유지
			dto.setSfile(prevSfile);
		}
		
		//DAO통해 DB에 수정내용반영
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		//성공 or 실패?
		if(result==1)	{
			session.removeAttribute("pw"); //세션에 저장된 비번삭제
			resp.sendRedirect("../mvcboard/view.do?idx="+idx);
		}
		else JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.", "../mvcboard/view.do?idx="+idx);
	}
}
