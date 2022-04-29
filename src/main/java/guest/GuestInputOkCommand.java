package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homepage = request.getParameter("homepage")==null ? "" : request.getParameter("homepage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp");
		
		GuestVO vo = new GuestVO();
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomepage(homepage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.setGuestInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "guestInputOk");
			request.setAttribute("url", request.getContextPath()+"/guestList.gu");
		}
		else {
			request.setAttribute("msg", "guestInputNo");
			request.setAttribute("url", request.getContextPath()+"/guestInput.gu");
		}
	}

}
