package study1.mapping;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study.database.LoginDAO;
import study.database.LoginVO;

@WebServlet("/study1/urlMappingList")
public class UrlMappingList extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 보안처리(비로그인시에 처리한다.)
		//HttpSession session = request.getSession();
		//String mid = (String) session.getAttribute("sMid");
		//if(mid == null) {
		//	response.sendRedirect(request.getContextPath()+"/");
		//	return;
		//}
		// 보안처리 끝
		
		LoginDAO dao = new LoginDAO();
		
		ArrayList<LoginVO> vos = dao.getLoginList();
		
		request.setAttribute("vos", vos);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study1/mapping/urlMappingList.jsp");
		dispatcher.forward(request, response);
	}
}
