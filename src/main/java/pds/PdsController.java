package pds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.pds")
public class PdsController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PdsInterface command = null;
		String viewPage = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		// 세션이 끊어지면 작업의 진행을 로그인창으로 보낸다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 4 || level == 1) {	// 세션이 끊어지면 작업의 진행을 홈창으로 보낸다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("pdsList")) {
			command = new PdsListCommand();
			command.execute(request, response);
			viewPage += "/pds/pdsList.jsp";
		}
		else if(com.equals("pdsInput")) {
			viewPage += "/pds/pdsInput.jsp";
		}
		else if(com.equals("pdsInputOk")) {
			command = new PdsInputOkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("pdsContent")) {
			command = new PdsContentCommand();
			command.execute(request, response);
			viewPage += "/pds/pdsContent.jsp";
		}
		else if(com.equals("pdsDownNum")) {
			command = new PdsDownNumCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("pdsDelete")) {
			command = new PdsDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("pdsTotalDown")) {
			command = new PdsTotalDownCommand();
			command.execute(request, response);
			viewPage += "/pds/pdsList.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
