package study.t0421;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// URL에 '/Tinit'라고 입력시에 초기값이 부여되고, 지정된 사이트로 이동한다.
@WebServlet(urlPatterns = "/Tinit", initParams = {@WebInitParam(name="mid", value="admin"), @WebInitParam(name="pwd", value="1234"), @WebInitParam(name="className", value="INSA")})
public class T0421_init extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service 입니다.");
		
		PrintWriter out = response.getWriter();
		
		// 지정된 서블릿의 초기값을 불러온다.
		String mid = getInitParameter("mid");
		String pwd = getInitParameter("pwd");
		String className = getInitParameter("className");
		
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		System.out.println("className : " + className);
		
		request.setAttribute("mid", mid);
		request.setAttribute("pwd", pwd);
		request.setAttribute("className", className);
		
		// RequestDispatcher dispatcher = request.getRequestDispatcher("/0421/init/test1.jsp");
		// dispatcher.forward(request, response);
		request.getRequestDispatcher("/0421/init/test1.jsp").forward(request, response);
	}
}
