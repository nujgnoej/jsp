package study.t0418;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T10_2")
public class Test10_2 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String hostIp = request.getParameter("hostIp");
		
		if(mid.equals("")) {
			out.println("<script>");
			out.println("alert('아이디를 입력하세요');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		else if(pwd.equals("")) {
			out.println("<script>");
			out.println("alert('비밀번호를 입력하세요');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		
		String name = request.getParameter("name");
		
		
		out.println("<br/>아이디 : " + mid);
		out.println("<br/>비밀번호 : " + pwd);
		out.println("<br/>성명 : " + name);
		out.println("<br/>접속사용자 IP : " + hostIp);
		out.println("<br/>전송방식 : " + request.getMethod());
		out.println("<br/>URL : " + request.getRequestURL());
		out.println("<br/>접속 서버이름(주소) : " + request.getServerName());
		out.println("<br/>접속 서버의 포트번호 : " + request.getServerPort());
		out.println("<br/>요청 파라메터의 길이 : " + request.getContentLength());
		out.println("<br/>ContextPath : " + request.getContextPath());
		out.println("<br/>현재 사용중인 프로토콜 : " + request.getProtocol());
		out.println("<br/><a href='"+request.getContextPath()+"/0418/test10.jsp'>돌아가기</a>");
	}

}
