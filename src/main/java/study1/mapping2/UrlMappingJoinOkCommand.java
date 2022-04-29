package study1.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

public class UrlMappingJoinOkCommand implements UrlInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginVO vo = new LoginVO();
		
		vo.setMid(request.getParameter("mid")==null ? "" : request.getParameter("mid"));
		vo.setPwd(request.getParameter("pwd")==null ? "" : request.getParameter("pwd"));
		vo.setName(request.getParameter("name")==null ? "" : request.getParameter("name"));
		
		LoginDAO dao = new LoginDAO();
		
		// 회원 중복체크하기
		int res = dao.getIdCheck(vo.getMid());
		if(res != 1) {	// 아이디가 중복되었으면...
			request.setAttribute("msg", "loginIdCheckNo");
			request.setAttribute("url", request.getContextPath()+"/urlMappingJoin.um");
		}
		else {
			// 회원 가입하기
			res = dao.setLoginJoin(vo);
			
			if(res == 1) {
				request.setAttribute("msg", "loginJoinOk");
			}
			else {
				request.setAttribute("msg", "loginJoinNo");
			}
			request.setAttribute("url", request.getContextPath()+"/urlMappingList.um");
		}
	}
}
