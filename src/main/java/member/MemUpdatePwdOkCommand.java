package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemUpdatePwdOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		String originalPwd = request.getParameter("originalPwd")==null ? "" : request.getParameter("originalPwd");
		String newPwd = request.getParameter("newPwd")==null ? "" : request.getParameter("newPwd");
		
		SecurityUtil securityUtil = new SecurityUtil();
		originalPwd = securityUtil.encryptSHA256(originalPwd);
		newPwd = securityUtil.encryptSHA256(newPwd);
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemLoginOk(mid, originalPwd);
		
		if(vo.getNickName() == null) {
			request.setAttribute("msg", "passwordNo");
			request.setAttribute("url", request.getContextPath()+"/memUpdatePwd.mem");
			return;
		}
		
		int res = dao.setMemUpdatePwdOk(mid, newPwd);
		if(res == 1) {
			request.setAttribute("msg", "memUpdatePwdOk");
			request.setAttribute("url", request.getContextPath()+"/memMain.mem");
		}
		else {
			request.setAttribute("msg", "memUpdatePwdNo");
			request.setAttribute("url", request.getContextPath()+"/memUpdatePwd.mem");
		}
	}

}
