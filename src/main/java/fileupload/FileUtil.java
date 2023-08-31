package fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	//파일업로드 (매개변수1:request 내장객체, 매개변수2:디렉토리명)
	public static String uploadFile (HttpServletRequest req, String sDirectory) throws ServletException, IOException {
		
/* 파일첨부위한 input태그의 name속성값이용해서 part 객체생성. 해당객체 통해 파일을 서버에 저장할수있다
 * part 객체에서아래 헤더값 읽어오면 전송된파일의 원본명을 알수있다. 콘솔에서 확인
 * 
 * "filename=" 를 구분자로 헤더값을 split()하면 String타입의 배열로 반환된다.
 * 앞에서 스플릿한 결과중 인덱스1은 파일명이된다.
 * 여기서 더블쿼테이션 제거하면 순수한 파일명만 남는다. replace 통해 제거한다
 * 이때 더블쿼테이션을 제거할 문자열로 사용하기위해 escape 시퀀스 \ 을 붙여줘야한다.
 * 
 * 전송파일이 있는경우 디렉토리에 파일 저장한다. 이때 write()메소드사용한다
 * File.separator : os 마다 경로 표시하는기호가 다르므로 "/" 대신 사용한다.
 * 원본파일명 반환
 *  */	
		Part part = req.getPart("ofile");
		
		String partHeader = part.getHeader("content-disposition");
		System.out.println("partHeader="+partHeader);
		
		String[] phArr = partHeader.split("filename=");
		String oFileName = phArr[1].trim().replace("\"", "");
		
		if(!oFileName.isEmpty()) part.write(sDirectory + File.separator + oFileName);
		
		return oFileName;
	}
	//파일명 변경
/* 파일명에서 확장자 잘라내기위해 뒤에서부터 . 위치찾는다. 2개의상의 . 이 파일명에 사용될수있기때문
 * 날자와 시간 이용해서 파일명으로 사용할 문자열을 생성한다
 * "년원일_시분초123" 형태가 된다
 * 
 * 원본파일명과 새파일명 통해 file객체 생성 > 파일명 변경 > 변경된 파일명 반환
 *  */
	public static String renameFile(String sDirectory, String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + now+ext);
		
		oldFile.renameTo(newFile);
		
		return now+ext;
	}
	
	public static ArrayList<String> multiFile (HttpServletRequest req, String sDirectory) throws ServletException, IOException {
		
		ArrayList<String> listFN = new ArrayList<>();
		Collection<Part> parts = req.getParts();
		for(Part i:parts) {
			if(!i.getName().equals("ofile")) continue;
			String partHeader = i.getHeader("content-disposition");
			System.out.println("partHeader="+partHeader);
			String[] phArr = partHeader.split("filename=");
			String oFileName = phArr[1].trim().replace("\"", "");
			if(!oFileName.isEmpty()) i.write(sDirectory + File.separator + oFileName);
			listFN.add(oFileName);
		}
		return listFN;
	}
}
