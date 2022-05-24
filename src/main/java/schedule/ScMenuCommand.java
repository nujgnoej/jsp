package schedule;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ScMenuCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
		String[] ymds = ymd.split("-");
		if(ymds[1].length() == 1) ymds[1] = "0" + ymds[1];
		if(ymds[2].length() == 1) ymds[2] = "0" + ymds[2];
		
		ymd = ymds[0] + "-" +  ymds[1] + "-" +  ymds[2];  // '2022-06-09'
		
		ScheduleDAO dao = new ScheduleDAO();
		
		ArrayList<ScheduleVO> vos = dao.getScMenu(mid, ymd);
		
		request.setAttribute("vos", vos);
		request.setAttribute("scheduleCnt", vos.size());
		request.setAttribute("ymd", ymd);
	}

}
