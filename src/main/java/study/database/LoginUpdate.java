package study.database;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginUpdate")
public class LoginUpdate extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		// 보안처리(비로그인시에 처리한다.)
		if(mid == null) {
			response.sendRedirect(request.getContextPath()+"/log");
			return;
		}
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getSearch(mid);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/database/loginUpdate.jsp");
		dispatcher.forward(request, response);
	}
}
