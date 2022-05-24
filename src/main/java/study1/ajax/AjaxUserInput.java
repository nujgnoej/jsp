package study1.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxUserInput")
public class AjaxUserInput extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
		UserDAO dao = new UserDAO();
		
		// 입력받은 아이디가 같을경우에는 등록처리하지 않는다.
		UserVO vo = dao.getIdSearch(mid);
		if(vo.getMid() != null) {
			response.getWriter().write("0");
			return;
		}
		
		// 신규 자료는 vo에 담아서 DB에 저장한다.
		vo = new UserVO();
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setAddress(address);
		
		String res = dao.setUserInput(vo);
		
		response.getWriter().write(res);
	}
}
