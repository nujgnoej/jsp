package study.t0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjukOk2")
public class SungjukOk2 extends HttpServlet {
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
		
		
		int intNo = Integer.parseInt(no);
		int intHakyun = Integer.parseInt(hakyun);

		if(intNo<=0) {
			out.print("<script>");
			out.print("alert('학번을 확인해주세요(양의정수 입력가능)')");
			out.print("history.back()");
			out.print("</script>");
			return;
		}
		else if(intHakyun>=1 && intHakyun<=6) {
			out.print("<script>");
			out.print("alert('학년을 확인해주세요(1~6까지 입력가능)')");
			out.print("history.back()");
			out.print("</script>");
			return;
		}
		else if(kor>=0 && kor<=100 && eng>=0 && eng<=100 && mat>=0 && mat<=100) {
			out.print("<script>");
			out.print("alert('국어/영어/수학 점수를 확인해주세요(0~100까지 입력가능)')");
			out.print("history.back()");
			out.print("</script>");
			return;
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
		
		//SungjukVO vo = new SungjukVO(name, gender, no, hakyun, kor, eng, mat, tot, avg, grade, sports, otherSports, language, strSports, strLanguage);
		
		// (문제)
		// setter를 통하여 값을 주입해 본다.
		// 단, setter에 저장되는, 수치는 모두 양의 정수이고, 학년은 1~6, 국어/영어/수학 점수는 0~100 까지만 입력처리되어야 한다.
		SungjukVO vo = new SungjukVO();
		
		
		vo.setName(name);
		vo.setGender(gender);
		vo.setNo(no);
		vo.setHakyun(hakyun);
		vo.setKor(kor);
		vo.setEng(eng);
		vo.setMat(mat);
		vo.setTot(tot);
		vo.setAvg(avg);
		vo.setGrade(grade);
		vo.setSports(sports);
		vo.setOtherSports(otherSports);
		vo.setLanguage(language);
		vo.setStrSports(strSports);
		vo.setStrLanguage(strLanguage);
		
		request.setAttribute("vo", vo);
		System.out.println("서버에서의 vo " + vo);
		
		// 값을 vo에 담아서 Fornt로 전송한다.
		// 1번방식 : response.sendRedirect() - request객체에 담은 값의 전송은 불가함.
		// response.sendRedirect(request.getContextPath()+"/0420/sungjukView.jsp?vo="+vo);
		
		// 2번 방식 : forword방식
		RequestDispatcher dispatcher = request.getRequestDispatcher("/0420/sungjukView.jsp");
		dispatcher.forward(request, response);
		
		
	}
}
