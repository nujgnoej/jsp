package schedule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ScheduleCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 오늘날짜처리(저장)
		Calendar calToday = Calendar.getInstance();
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);
		
		// 화면에 보여줄 해당 '년/월'을 셋팅
		Calendar calView = Calendar.getInstance();
		int yy = request.getParameter("yy")==null ? calView.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm")==null ? calView.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
		
		// 앞에서 넘어온 변수(yy, mm)값이 '1월'이나, 또는 '12월'이었다면 편집해줘야 한다.
		// 1월은 '0'으로 넘어온다. 12월은 '11'로 넘어온다.
		if(mm < 0) {
			yy--;
			mm = 11;
		}
		if(mm > 11) {
			yy++;
			mm = 0;
		}
		calView.set(yy, mm, 1);		// 해당 '년도/월'의 1일을 기준으로 셋팅...
		
		int startWeek = calView.get(Calendar.DAY_OF_WEEK);	// 해당 '년/월'의 1일에 해당하는 요일값을 숫자로 반환(일:1, 월:2~~~)
		int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH); // 해당월의 마지막일자를 가져온다.
		
		// 달력의 앞쪽 빈공간과 뒷쪽 빈공간에 이전/다음 월의 날짜를 채워서 출력하기위한 준비...
		int prevYear = yy;
		int prevMonth = (mm) - 1;
		int nextYear = yy;
		int nextMonth = (mm) + 1;
		
		if(prevMonth == -1) {
			prevYear--;
			prevMonth = 11;
		}
		if(nextMonth == 12) {
			nextYear++;
			nextMonth = 0;
		}
		
		Calendar calPre = Calendar.getInstance();
		calPre.set(prevYear, prevMonth, 1);
		int preLastDay = calPre.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		Calendar calNext = Calendar.getInstance();
		calNext.set(nextYear, nextMonth, 1);
		int nextStartWeek = calNext.get(Calendar.DAY_OF_WEEK);
		
		
		/* 앞에서 처리된 변수값들을 모두 저장소에 담아서 view로 넘겨준다. */
		
		// 오늘기준 달력....
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
		
		// 화면에 보여줄 달력의 해당내역들 저장..
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
		// 현재달의 '전월/다음월'의 날짜 표시를 위한 변수를 저장한다.
		request.setAttribute("prevYear", prevYear);
		request.setAttribute("prevMonth", prevMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		
		request.setAttribute("preLastDay", preLastDay);
		request.setAttribute("nextStartWeek", nextStartWeek);
		
		
		/*  스케줄에 등록되어 있는 그달에 해당하는 일정을 가져온다. */
		// 아이디 가져오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		// 날짜 처리작업(date_format의 비교형식과 맞춰주기위한 작업)
		// 예) 2022-5 -->> 2022-05
		String ym = "";
		int tempMM = mm + 1;
		if(tempMM >=1 && tempMM <= 9) {
			ym = yy + "-0" + (mm + 1);
		}
		else {
			ym = yy + "-" + (mm + 1);
		}
		
		ScheduleDAO dao = new ScheduleDAO();
		
		ArrayList<ScheduleVO> vos = dao.getScheduleList(mid, ym);
		//System.out.println("vos(List) : " + vos);
		
		request.setAttribute("vos", vos);
	}

}
