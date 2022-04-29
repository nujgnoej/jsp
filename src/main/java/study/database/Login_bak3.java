package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// @WebServlet("/login")
public class Login_bak3 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리(filter에서 처리했음)
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave")==null ? "off" : request.getParameter("idSave");	
		
		// System.out.println("midCheck : " + idSave); 체크박스 체크시 on, 해제시 null이 넘어옴
		
		LoginDAO dao = new LoginDAO();
		
		// String name = dao.loginCheck(mid, pwd);
		LoginVO vo = dao.loginCheck(mid, pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() == null) {	// 자료를 못 찾았음.
			out.println("<script>");
			out.println("alert('로그인 실패!');");
			out.println("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.println("</script>");
		}
		else {	// 자료를 찾았음...
			// 정상 로그인 처리수행과정에서 할일들
			// 1.세션에 아이디/성명을 저장시킨다.
			// 2.로그인폼에서 '아이디저장'을 선택한 경우는 '아이디'를 쿠키에 저장, 선택해제시는 쿠키에서 삭제처리한다.
			// 3.한번 접속할때마다 접속포인트 1씩을 증가시켜준다.
			// 4.접속 포인트 수 1 증가.
			// 5.최종방문일자 업데이트
			// 6. 정상로그인 되면 회원메인페이지로 보낸다.
			
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			
			// 쿠키에 아이디(mid)를 저장(?) - Yes/No
			Cookie cookieMid = new Cookie("cMid", mid);
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);	// cookieMid 쿠키 만료시간은 7일
			}
			else {
				cookieMid.setMaxAge(0);				// cookieMid 쿠키 삭제
			}
			response.addCookie(cookieMid);
			
			dao.setUpdate(mid);	// 접속포인트와 방문횟수를 각각 1씩 증가시킨다.
			
			out.println("<script>");
			out.println("alert('"+vo.getName()+"님 로그인 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/database/loginMain.jsp?point="+vo.getPoint()+"&vCount="+vo.getvCount()+"';");
			out.println("</script>");
		}
	}
}
