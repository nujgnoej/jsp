package pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class PdsDeleteCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String[] fSNames = request.getParameter("fSName").split("/");
		
		PdsDAO dao = new PdsDAO();
		
		// 비밀번호를 검색후 일치한다면 삭제처리한다.
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(pwd);
		
		PdsVO vo = dao.getPdsContent(idx);
		
		if(vo.getPwd().equals(pwd)) {
			// 파일이 저장되어 있는 서버의 절대경로를 지정해준다.
			String realPath = request.getServletContext().getRealPath("/data/pds/");
			
			// 서버 파일시스템에 존재하는 실제파일들을 삭제처리한다.
			for(String fSName : fSNames) {
				/*
				File file = new File(realPath + fSName);
				file.delete();
				*/
				new File(realPath + fSName).delete();
			}
			
			// 파일삭제가 완료되면 자료파일을 DB에서 삭제시켜준다.
			dao.setPdsDelete(idx);
			response.getWriter().write("pdsDeleteOk");
		}
		else {
			response.getWriter().write("pdsDeleteNo");
		}
	}

}
