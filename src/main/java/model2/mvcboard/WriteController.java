package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

/* 글쓰기 위한 서블릿은 doGet과 doPost 둘다오버라이딩한다
 * 글쓰기 페이지로 진입시 get방식의 요청이고, 전송눌러 폼값 서버전송시 post방식으로 요청하게된다 */
public class WriteController extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
		//아무 로직없이 글쓰기페이지로 포워드만 진행한다
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)	throws ServletException, IOException { 
	//1. 파일업로드처리 > 업로드디렉토리의 물리적 경로 확인
	String sDirectory = req.getServletContext().getRealPath("/Uploads");

	String oFileName = ""; //파일업로드 
	try { 
		oFileName = FileUtil.uploadFile(req, sDirectory); 
	}catch(Exception e) { 
		JSFunction.alertLocation(resp, "파일 업로드 오류입니다", "../mvcboard/write.do"); return; 
	}

	//2. 파일업로드 외 처리 > 폼값을 dto에 저장 
	MVCBoardDTO dto = new MVCBoardDTO();
	dto.setName(req.getParameter("name"));
	dto.setTitle(req.getParameter("title"));
	dto.setContent(req.getParameter("content"));
	dto.setPw(req.getParameter("pw"));

	//원본 파일명과 저장된 파일명 설정
	if(oFileName!="") {
		String sFileName = FileUtil.renameFile(sDirectory, oFileName);
		dto.setOfile(oFileName); //원본파일명 세팅
		dto.setSfile(sFileName); //서버에 저장된 파일명
	}
	
	//DAO통해 DB에 게시내용 저장
	MVCBoardDAO dao = new MVCBoardDAO();
	int result = dao.insertWrite(dto);
	dao.close();
	
	//성공 or 실패?
	if(result==1)	resp.sendRedirect("../mvcboard/list.do");
	else JSFunction.alertLocation(resp, "글쓰기에 실패했습니다", "../mvcboard/write.do");
	}
}
