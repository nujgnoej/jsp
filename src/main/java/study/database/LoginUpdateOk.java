package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginUpdateOk")
public class LoginUpdateOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		LoginVO vo = new LoginVO();
		
		vo.setMid((String) session.getAttribute("sMid"));
		vo.setPwd(request.getParameter("pwd")==null ? "" : request.getParameter("pwd"));
		vo.setName(request.getParameter("name")==null ? "" : request.getParameter("name"));
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setUpdate(vo);
		
		PrintWriter out = response.getWriter();
		if(res == 1) {
			session.setAttribute("sName", vo.getName());
			
			out.println("<script>");
			out.println("alert('회원정보가 수정되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/loginUpdate';");
			out.println("</script>");
		}
	}
}
