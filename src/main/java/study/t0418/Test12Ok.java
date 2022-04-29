package study.t0418;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T12Ok")
public class Test12Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		// request.getParameter("product");
		String[] products = request.getParameterValues("product");
		
		// System.out.println("products : " + products);
		// System.out.println("products의 길이 : " + products.length);
		
		String strProduct = "";
		
//		int cnt=0;
//		for(String product : products) {
//			if(product.trim() != "") {
//				strProduct += product.trim() + "/";
//				cnt++;
//			}
//		}
		
		int sw=0;
		for(int i=0; i<products.length; i++) {
			if(products[i].trim() != "") {
				strProduct += products[i].trim() + "/";
				sw = 1;
			}
		}
		
		if(sw != 0) {
			strProduct = strProduct.substring(0,strProduct.length()-1);
		}
		else {
			out.println("<script>");
			out.println("alert('1개 이상의 삼품을 등록하셔야 합니다.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		
		out.println("<p>등록하신 상품은?</p>");
		out.println("<p>"+strProduct+"</p>");
		out.println("<script>");
		out.println("alert('상품을 등록완료!');");
		out.println("</script>");
		out.println("<p><a href='"+request.getContextPath()+"/0418/test12.jsp'>돌아가기</a></p>");
	}
}
