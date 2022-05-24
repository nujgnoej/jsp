package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		PdsDAO dao = new PdsDAO();
		PdsVO vo = dao.getPdsContent(idx);
		
		String[] fNames = vo.getfName().split("/");
		String[] fSNames = vo.getfSName().split("/");
		
		// 파일 압축에 필요한 객체들을 선언한다.
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		ServletOutputStream sos = null;
		
		String realPath = request.getServletContext().getRealPath("/data/pds/");
		String zipPath = request.getServletContext().getRealPath("/data/pds/temp/");
		String zipName = vo.getTitle() + ".zip";
		
		fos = new FileOutputStream(zipPath + zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] b = new byte[2048];
		int data = 0;
		
		for(int i=0; i<fNames.length; i++) {
			File file = new File(realPath + fSNames[i]);
			File moveAndRename = new File(realPath + fNames[i]);
			// File moveAndRename = new File(zipPath + fNames[i]);
			
			file.renameTo(moveAndRename);
			
			fis = new FileInputStream(moveAndRename);
			zos.putNextEntry(new ZipEntry(fNames[i]));
			
			while((data = fis.read(b, 0, b.length)) != -1) {
				zos.write(b, 0, data);
			}
			zos.flush();
			zos.closeEntry();
			fis.close();
		}
		zos.close();
		
		// 압축작업이 끝나면 압축된 파일을 클라이언트로 전송처리한다.
		String mimeType = request.getServletContext().getMimeType(zipName.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");	// 2진 바이너리형식
		}
		
		// 사용하는 브라우저가 인터넷 익스플로서인경우는 'euc-kr', 나머지는 'utf-8'로 전송한다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 다운로드할 파일명과 형식을 헤더파일에 담아서 클라이언트에 전송할 준비를 한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		// Java에 의해서 실제로 파을을 다운(업)로드 처리한다.(FileInputStream/FileOutputStream)
		fis = new FileInputStream(zipPath + zipName);
		sos = response.getOutputStream();
		
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		// 여기까지 파일 다운로드 처리이다.
		
		sos.close();
		fis.close();
		
		// 클라이언트로 파일의 다운로드가 완료되었으면 서버의 temp에 존재하는 압축파일을 삭제처리한다.
		new File(zipPath + zipName).delete();
		
		// 자료의 다운로드수 증가 시키기..
		dao.setPdsDownNum(idx);
		
		request.setAttribute("msg", "totalDownOk");
		request.setAttribute("url", request.getContextPath()+"/pdsList.pds");
	}

}
