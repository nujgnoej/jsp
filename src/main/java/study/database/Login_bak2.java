package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// @WebServlet("/login")
public class Login_bak2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리(filter에서 처리했음
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		// String name = dao.loginCheck(mid, pwd);
		LoginVO vo = dao.loginCheck(mid, pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() == null) {		// 자료를 못 찾은경우
			out.println("<script>");
			out.println("alert('로그인 실패!');");
			out.println("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.println("</script>");
		}
		else {	// 자료를 찾았음...
			// 정상 로그인 처리수행과정에서 할일들
			// 1. 세션에 아이디를 저장시킨다.
			// 2. 로그인폼에서 '아이디저장'을 선택한 경우는 '아이디'를 쿠키에 저장, 선택해제시는 쿠키에서 삭제처리한다.
			// 3. 한번 접속할때마다 접속포인트 1씩을 증가시켜준다.
			// 4. 접속 포인트 수 1 증가.
			// 5. 정상로그인 되면 회원메인페이지로 보낸다.
			
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			
			dao.setUpdate(mid);	// 접속포인트와 방문횟수를 각각 1씩 증가시킨다.
			
			// 메세지 호출 컨트롤러가 필요함....
			
			
			request.setAttribute("vo", vo);
			// request.setAttribute("point", vo.getPoint());
			// request.setAttribute("vCount", vo.getvCount());
			
			// System.out.println("이곳은 Login.java입니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/study/database/loginMain.jsp");
			dispatcher.forward(request, response);
		}
	}
}
