package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScUpdateOkCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		ScheduleVO vo = new ScheduleVO();
		vo.setIdx(idx);
		vo.setPart(part);
		vo.setContent(content);
		
		ScheduleDAO dao = new ScheduleDAO();
		
		int res = dao.setScUpdateOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "scheduleUpdateOk");
		}
		else {
			request.setAttribute("msg", "scheduleUpdateOk");
		}
		request.setAttribute("url", request.getContextPath()+"/scMenu.sc?ymd="+ymd);
	}

}
