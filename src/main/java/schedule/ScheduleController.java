package schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.sc")
public class ScheduleController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ScheduleInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		// 세션이 끈겼으면 작업의 진행을 홈창으로 보낸다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 4 || level == 1) {   // 세션이 끈겼으면 작업의 진행을 홈창으로 보낸다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		else if(com.equals("schedule")) {
			command = new ScheduleCommand();
			command.execute(request, response);
			viewPaged += "/schedule/schedule.jsp";
		}
		else if(com.equals("scMenu")) {
			command = new ScMenuCommand();
			command.execute(request, response);
			viewPaged += "/schedule/scMenu.jsp";
		}
		else if(com.equals("scContent")) {
			command = new ScContentCommand();
			command.execute(request, response);
			viewPaged += "/schedule/scContent.jsp";
		}
		else if(com.equals("scUpdate")) {
			command = new ScContentCommand();
			command.execute(request, response);
			viewPaged += "/schedule/scUpdate.jsp";
		}
		else if(com.equals("scUpdateOk")) {
			command = new ScUpdateOkCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
