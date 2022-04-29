package study.t0420;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test5_url2/t5")
public class Test5_url2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String hakbun = request.getParameter("hakbun");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		
		int tot = kor + eng + mat;
		double avg = tot / 3.0;
		int intAvg = (int)(avg / 10.0);
		char grade;
		
		switch(intAvg) {
			case 10:
			case 9:
				grade = 'A';
				break;
			case 8:
				grade = 'B';
				break;
			case 7:
				grade = 'C';
				break;
			case 6:
				grade = 'D';
				break;
			default:
				grade = 'F';
		}
		
		// 처리된 결과를 vo 객체생성하면서 모두 담아준다. 처리는 getters/setters로 처리하도록 한다.
		Test5_url2ResVO vo = new Test5_url2ResVO(name, hakbun, kor, eng, mat, tot, avg, grade);

		
		// name = URLEncoder.encode(name);
		// vo.setName(name);
		
		vo.setName(URLEncoder.encode(name));
		
		response.sendRedirect(request.getContextPath()+"/test5_url2/test5_url2Res.jsp?vo="+vo);  // 받는쪽(jsp)에서 'String vo = request.getParameter("vo")'로 받으면 모두 문자로 받게된다.
		// 앞의 방식으로 넘기게되면 모두 문자로 전송되기에 각각을 뽑아서 쓰기가 쉽지않다. 따라서 vo객체 자체를 넘기고자한다면 forward방식으로 처리해야 한다.

		
//--------		request.setAttribute("vo", vo);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/test5_url2/test5_url2Res.jsp");
//    dispatcher.forward(request, response);
	}
}
