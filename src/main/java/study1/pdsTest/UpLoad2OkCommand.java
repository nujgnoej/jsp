package study1.pdsTest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study1.StudyInterface;

public class UpLoad2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath = request.getServletContext().getRealPath("/data/pdsTest/");
		int maxSize = 1024 * 1024 * 10;		// 최대용량을 10MByte로 사용하고자 한다.
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());	// 객체 생성시 업로드 완료...
		
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			originalFileName = multipartRequest.getOriginalFileName(file);
			filesystemName = multipartRequest.getFilesystemName(file);
			System.out.println("업로드시의 원본 파일명 : " + originalFileName);
			System.out.println("서버에 저장된 실제 파일명 : " + filesystemName);
		}
		
		if(filesystemName == null) {
			request.setAttribute("msg", "upLoad1No");
		}
		else {
			request.setAttribute("msg", "upLoad1Ok");
		}
		
		int upLoadFlag = multipartRequest.getParameter("upLoadFlag")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("upLoadFlag"));

		if(upLoadFlag == 0) {
			request.setAttribute("url", request.getContextPath() + "/upLoad2.st");
		}
		else if(upLoadFlag == 3) {
			request.setAttribute("url", request.getContextPath() + "/upLoad3.st");
		}
		else if(upLoadFlag == 4) {
			request.setAttribute("url", request.getContextPath() + "/upLoad4.st");
		}
	}

}
