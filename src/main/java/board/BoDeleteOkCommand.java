package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoDeleteOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
						
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoDeleteOk(idx);
		
		if(res == 1) {
			request.setAttribute("msg", "boDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/boList.bo?idx="+idx);
		}
		else {
			request.setAttribute("msg", "boDeleteNo");
			request.setAttribute("url", request.getContextPath()+"/boContent.bo?idx="+idx);
		}
	}

}
