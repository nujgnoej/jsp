package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.database.LoginDAO;

public class AdminLoginOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		HttpSession session = request.getSession();
		
		LoginDAO dao = new LoginDAO();
		int res = 0;
		if(mid.equals("admin")) {
			res = dao.getAdminCheck(mid, pwd);
			if(res == 1) {
				session.setAttribute("sAdmin", "adminOk");
				request.setAttribute("msg", "adminOk");
			}
			else {
				request.setAttribute("msg", "adminNo");
			}
		}
		else {
			request.setAttribute("msg", "adminNo");
		}
		request.setAttribute("url", "guestList.gu");
	}
}
