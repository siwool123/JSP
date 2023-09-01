package model2.mvcboard;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/* 요청명에대한 매핑은 어노테이션으로 설정 */
@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ofile = req.getParameter("ofile"); //원본파일명
		String sfile = req.getParameter("sfile"); //저장파일명
		String idx = req.getParameter("idx"); //게시물일련번호
		
		FileUtil.download(req, resp, "/Uploads", sfile, ofile);
		
		MVCBoardDAO dao = new MVCBoardDAO();
		dao.downcntPlus(idx);
		dao.close();
	}
}
