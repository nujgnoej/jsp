package study1.calendar;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study1.StudyInterface;

public class Calendar1Command implements StudyInterface {

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
		// 1월을 '0'으로 넘어온다. 12월은 '11'로 넘어온다.
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
		int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH);	// 해당월의 마지막일자를 가져온다.
		
		/* 앞에서 처리된 변수값들을 모두 저장소에 담아서 view로 넘겨준다. */
		
		// 오늘기준 달력....
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
		
		// 화면에 보여줄 해당내역들 저장..
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
	}

}
