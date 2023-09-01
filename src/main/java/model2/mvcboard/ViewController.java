package model2.mvcboard;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/* 내용보기 매핑은 web.xml 아닌 어노테이션 통해 설정 */
@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
	
	/* 서블릿 수명주기 메서드 중 전송방식 상관없이 요청 처리하고 싶을때는
	 * service()메서드를 오버라이딩하면 된다. 
	 * 해당 메서드 역할은 요청분석후 doget, dopost 를 호출하는 것이다
	 * 
	 * 파라미터로 전달된 일련번호 받는다 > 조회수1증가 > 게시물 인출
	 * 내용의 경우 Enter로 줄바꿈하므로 웹브라우저 출력시 <br>로 변경해야한다 > 
	 * dto게시물을 request 영역에저장후 뷰로 포워드
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDAO dao = new MVCBoardDAO();
		String idx = req.getParameter("idx"); 
		dao.updateVisitcnt(idx);
		MVCBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		//첨부파일 확장자 추출 및 이미지 타입 확인
		String ext = "", fileName = dto.getSfile();
		if(fileName!=null) ext = fileName.substring(fileName.lastIndexOf(".")+1);		
		String[] imgStr = {"png", "jpg", "gif", "bmp"};
		List<String> imgList = Arrays.asList(imgStr);
		boolean isImage = false;
		if(imgList.contains(ext)) isImage = true;
		
		req.setAttribute("dto", dto);
		req.setAttribute("isImage", isImage);
		req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);
	}
}
