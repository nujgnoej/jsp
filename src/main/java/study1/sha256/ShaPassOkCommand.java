package study1.sha256;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;
import study1.StudyInterface;

public class ShaPassOkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		SecurityUtil security = new SecurityUtil();
		String shaPwd = security.encryptSHA256(pwd);
		
		request.setAttribute("pwd", pwd);
		request.setAttribute("shaPwd", shaPwd);
		
	}

}
