package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjukOk")
public class SungjukOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
				
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String no = request.getParameter("no");
		String hakyun = request.getParameter("hakyun");
		String hakyunOption = request.getParameter("hakyunOption");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		String[] sports = request.getParameterValues("sports");
		String otherSports = request.getParameter("otherSports")==null ? "" : request.getParameter("otherSports");
		String[] language = request.getParameterValues("language");
		
		String strSports = "";
		String strLanguage = "";
		
		if(sports != null) {
			for(String sport : sports) {
				if(sport.equals("기타")) {
					if(otherSports.trim().length() <= 0) {
						out.println("<script>");
						out.println("alert('기타항목을 선택하셨으면 기타란에 입력하세요.');");
						out.println("history.back();");
						out.println("</script>");
						return;
					}
					strSports += otherSports;
				}
				if(!sport.equals("기타")) strSports += sport + " / ";
			}
		}
		else {
			out.println("<script>");
			out.println("alert('좋아하는 스포츠를 1개 이상 입력하세요.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		if(language == null) {
			out.println("<script>");
			out.println("alert('사용가능언어를 선택하세요.');");
			out.println("history.back();");
			out.println("</script>");
			return; 
		}
		else {
			strLanguage = "";
			for(String lang : language) {
				strLanguage += lang + " / ";
			}
		}
			
		int tot;
		double avg;
		String grade;
		
		if(hakyun.equals("")) hakyun = hakyunOption;
		
		tot = kor + eng + mat;
		avg = tot / 3.0;
		
		switch ((tot / 3) / 10) {
			case 10:
			case 9:
				grade = "A";
				break;
			case 8:
				grade = "B";
				break;
			case 7:
				grade = "C";
				break;
			case 6:
				grade = "D";
				break;
			default:
				grade = "F";
		}
		
		SungjukVO vo = new SungjukVO(name, gender, no, hakyun, kor, eng, mat, tot, avg, grade, sports, otherSports, language, strSports, strLanguage);
		
		request.setAttribute("vo", vo);
		
		// 값을 vo에 담아서 Fornt로 전송한다.
		// 1번방식 : response.sendRedirect() - request객체에 담은 값의 전송은 불가함.
		// response.sendRedirect(request.getContextPath()+"/0420/sungjukView.jsp?vo="+vo);
		
		// 2번 방식 : forword방식
		RequestDispatcher dispatcher = request.getRequestDispatcher("/0420/sungjukView.jsp");
		dispatcher.forward(request, response);
		
		
	}
}
