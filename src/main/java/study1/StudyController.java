package study1;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study1.ajax1.Ajax1Command;
import study1.calendar.Calendar1Command;
import study1.calendar.Calendar2Command;
import study1.pdsTest.DownLoad1Command;
import study1.pdsTest.FileDeleteCommand_bak;
import study1.pdsTest.UpLoad1OkCommand;
import study1.pdsTest.UpLoad2OkCommand;
import study1.sha256.ShaPassOkCommand;

@WebServlet("*.st")
public class StudyController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		if(com.equals("el")) {
			viewPage += "/study1/el_JSTL/el1.jsp";
		}
		else if(com.equals("el2")) {
			viewPage += "/study1/el_JSTL/el2.jsp";
		}
		else if(com.equals("jstl1")) {
			viewPage += "/study1/el_JSTL/jstl1.jsp";
		}
		else if(com.equals("jstl2")) {
			viewPage += "/study1/el_JSTL/jstl2.jsp";
		}
		else if(com.equals("shaPass")) {
			viewPage += "/study1/sha/shaPass.jsp";
		}
		else if(com.equals("shaPassOk")) {
			command = new ShaPassOkCommand();
			command.execute(request, response);
			viewPage += "/study1/sha/shaPass.jsp";
		}
		else if(com.equals("ajax1")) {
			command = new Ajax1Command();
			command.execute(request, response);
			viewPage += "/study1/ajax/ajax1.jsp";
		}
		else if(com.equals("upLoad1")) {
			viewPage += "/study1/pdsTest/upLoad1.jsp";
		}
		else if(com.equals("upLoad1Ok")) {
			command = new UpLoad1OkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("downLoad1")) {
			command = new DownLoad1Command();
			command.execute(request, response);
			viewPage += "/study1/pdsTest/downLoad1.jsp";
		}
		else if(com.equals("fileDelete")) {
			command = new FileDeleteCommand_bak();
			command.execute(request, response);
			return;
		}
		else if(com.equals("upLoad2")) {
			viewPage += "/study1/pdsTest/upLoad2.jsp";
		}
		else if(com.equals("upLoad2Ok")) {
			command = new UpLoad2OkCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("upLoad3")) {
			viewPage += "/study1/pdsTest/upLoad3.jsp";
		}
		else if(com.equals("upLoad4")) {
			viewPage += "/study1/pdsTest/upLoad4.jsp";
		}
		else if(com.equals("dynamicForm")) {
			viewPage += "/study1/dynamicForm/dynamicForm.jsp";
		}
		else if(com.equals("calendar1")) {
			command = new Calendar1Command();
			command.execute(request, response);
			viewPage += "/study1/calendar/calendar1.jsp";
		}
		else if(com.equals("calendar2")) {
			command = new Calendar2Command();
			command.execute(request, response);
			viewPage += "/study1/calendar/calendar2.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
