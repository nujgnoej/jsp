package study1.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;

public class UrlMappingUpdateOkCommand implements UrlInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginVO vo = new LoginVO();
		
		vo.setMid(request.getParameter("mid")==null ? "" : request.getParameter("mid"));
		vo.setPwd(request.getParameter("pwd")==null ? "" : request.getParameter("pwd"));
		vo.setName(request.getParameter("name")==null ? "" : request.getParameter("name"));
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setUpdate(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "loginUpdateOk");
		}
		else {
			request.setAttribute("msg", "loginUpdateNo");
		}
		
		request.setAttribute("url", request.getContextPath()+"/urlMappingList.um");
	}

}
