package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/boGoodCount")
public class BoGoodCount extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		// 좋아요수 증가처리
		HttpSession session = request.getSession();
		@SuppressWarnings({ "unchecked", "rawtypes" })
		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
		if(goodIdx == null) {
			goodIdx = new ArrayList<String>();
		}
		String imsiGoodIdx = "good" + idx;
		if(!goodIdx.contains(imsiGoodIdx)) {
			dao.setGoodCount(idx);
			goodIdx.add(imsiGoodIdx);
		}
		session.setAttribute("sGoodIdx", goodIdx);
		
		
	}
}
