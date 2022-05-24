package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;
		String viewPage = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		// 세션이 끊어지면 작업의 진행을 로그인창으로 보낸다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 4) {	// 세션이 끊어지면 작업의 진행을 홈창으로 보낸다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("boList")) {
			command = new BoListCommand();
			command.execute(request, response);
			viewPage += "/board/boList.jsp";
		}
		else if(com.equals("boInput")) {
			command = new BoInputCommand();
			command.execute(request, response);
			viewPage += "/board/boInput.jsp";
		}
		else if(com.equals("boInputOk")) {
			command = new BoInputOkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("boContent")) {
			command = new BoContentCommand();
			command.execute(request, response);
			viewPage += "/board/boContent.jsp";
		}
		else if(com.equals("boSearch")) {
			command = new BoSearchCommand();
			command.execute(request, response);
			viewPage += "/board/boSearch.jsp";
		}
		else if(com.equals("boUpdate")) {
			command = new BoUpdateCommand();
			command.execute(request, response);
			viewPage += "/board/boUpdate.jsp";
		}
		else if(com.equals("boUpdateOk")) {
			command = new BoUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("boDeleteOk")) {
			command = new BoDeleteOkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("boReplyUpdateOk")) {
			command = new BoReplyUpdateOkCommand();
			command.execute(request, response);
			return;
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
