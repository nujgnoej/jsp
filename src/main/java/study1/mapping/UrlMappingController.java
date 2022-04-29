package study1.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.url")
public class UrlMappingController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StringBuffer url = request.getRequestURL();
		System.out.println("url : " + url);
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		
//		String com = uri.substring(12,uri.lastIndexOf("."));
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		System.out.println("command Object name : " + com);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('콘솔창을 확인해 보세요...');");
//		out.println("location.href='/WEB-INF/study1/mapping/urlMapping.jsp';");	// get방식을 통해서는 '/WEB-INF'폴더를 접근할 수 없다.
		out.println("location.href='"+request.getContextPath()+"/study1/urlMapping';");
		out.println("</script>");
	}
}
