package study1.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxIdSearch3")
public class AjaxIdSearch3 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		UserDAO dao = new UserDAO();
		
		UserVO vo = dao.getIdSearch(mid);
		
		String name = "";
		int age = 0;
		String address = "";
		if(vo.getName()==null) {
			name = "찾는 자료가 없습니다.";
			return;
		}
		else {
			name = vo.getName();
			age = vo.getAge();
			address = vo.getAddress();
		}
		String str = mid + "/" + name + "/" + age + "/" + address;
		response.getWriter().write(str);
	}
}
