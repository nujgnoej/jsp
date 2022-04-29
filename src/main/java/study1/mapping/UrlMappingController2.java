package study1.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.url2")
public class UrlMappingController2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		/*  forward와 함께 사용해도 출력되지 않는다. 즉, 함께 사용하지 않는다.
		out.println("<script>");
		out.println("alert('콘솔창을 확인해 보세요...');");
//		out.println("location.href='"+request.getContextPath()+"/study1/urlMapping';");
		out.println("</script>");
		*/
		
		String viewPage = "";
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		System.out.println("com : " + com);
		
		if(com.equals("urlMapping")) {
			viewPage = "/WEB-INF/study1/mapping/urlMapping.jsp";
		}
		else if(com.equals("seoul")) {
			viewPage = "/WEB-INF/study1/mapping/seoul.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
