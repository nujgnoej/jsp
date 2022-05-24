package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
			String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
			
			// 비밀번호 암호화
			SecurityUtil security = new SecurityUtil();
			pwd = security.encryptSHA256(pwd);
			
			MemberDAO dao = new MemberDAO();
			MemberVO vo = dao.getMemLoginOk(mid, pwd);
			
			// 로그인 실패
			if(vo.getNickName() == null) {
				request.setAttribute("msg", "loginNo");
				request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
				return;
			}
			
			// 로그인 성공(1.주요자료 세션저장하기, 3.방문수와 포인트증가, 4.쿠키에 아이디저장유무, 2.오늘방문횟수에 대한 처리
			HttpSession session = request.getSession();
			
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getLevel());
			
			// System.out.println("vo : " + vo);
			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strNow = sdf.format(now);
			
			// 최종방문일과 오늘날짜를 비교해서 다른경우는 오늘방문횟수(todayCnt)값을 0으로 셋팅
			if(!vo.getLastDate().substring(0, 10).equals(strNow)) dao.setTodayCntUpdate(mid);
			
//			int point = vo.getPoint();
//			if(vo.getTodayCnt() <= 10) point++;		// 아래 setMemPointUpdate메소드에 포인트도 넘겨서 업데이트
			
			dao.setMemPointUpdate(mid);		// 최종 설정된 값들을 member테이블에 업데이트 시킨다.
			
			String idCheck = request.getParameter("idCheck")==null ? "off" : "on";
			Cookie cookieMid = new Cookie("cMid", mid);  // 쿠키변수 'cMid'에 사용자 아이디인 'mid'를 넣어서 생성한다.
			if(idCheck.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);	// cookieMid 쿠키 만료시간은 7일
			}
			else {
				cookieMid.setMaxAge(0);	// cookieMid 쿠키 삭제
			}
			response.addCookie(cookieMid);
			
			request.setAttribute("msg", "loginOk");
			request.setAttribute("url", request.getContextPath()+"/memMain.mem");
	}

}
