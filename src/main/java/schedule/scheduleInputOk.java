package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/scheduleInputOk")
public class scheduleInputOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		ScheduleVO vo = new ScheduleVO();
		vo.setMid(mid);
		vo.setsDate(ymd);
		vo.setPart(part);
		vo.setContent(content);
		
		ScheduleDAO dao = new ScheduleDAO();
		
		int res = dao.setScheduleInputOk(vo);
		
		if(res == 1) {
			response.getWriter().write("scheduleInputOk");
		}
		else {
			response.getWriter().write("scheduleInputNo");
		}
	}
}
