package study.t0418;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T08")
public class Test08 extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		
		PrintWriter out = response.getWriter();
		
		out.println("아이디 : "+mid+"<br/>");
		out.println("비밀번호 : "+pwd+"<br/>");
		out.println("성명 : "+name+"<br/>");
		/* out.println("<a href='/javagreenJ/0418/test08.jsp'>돌아가기<br/>"); */
		out.println("<a href='"+request.getContextPath()+"/0418/test08.jsp'>돌아가기<br/>");
	}

}
