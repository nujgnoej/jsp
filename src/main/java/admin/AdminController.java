package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.ad")
public class AdminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		if(com.equals("adMenu")) {
			viewPage += "/admin/adMenu.jsp";
		}
		else if(com.equals("adLeft")) {
			viewPage += "/admin/adLeft.jsp";
		}
		else if(com.equals("adContent")) {
			viewPage += "/admin/adContent.jsp";
		}
		else if(com.equals("adGuestList")) {
			command = new AdGuestListCommand();
			command.execute(request, response);
			viewPage += "/admin/guest/adGuestList.jsp";
		}
		else if(com.equals("adMemList")) {
			command = new AdMemListCommand();
			command.execute(request, response);
			viewPage += "/admin/member/adMemList.jsp";
		}
		else if(com.equals("adMemLevelChange")) {
			command = new AdMemLevelChangeCommand();
			command.execute(request, response);
			viewPage = "/message/message.jsp";
		}
		else if(com.equals("adBoList")) {
			command = new AdBoListCommand();
			command.execute(request, response);
			viewPage += "/admin/board/adBoList.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
