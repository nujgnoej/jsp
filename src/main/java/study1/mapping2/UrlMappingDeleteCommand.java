package study1.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;

public class UrlMappingDeleteCommand implements UrlInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setLoginDelete(mid);
		
		if(res == 1) {
			request.setAttribute("msg", "loginDeleteOk");
		}
		else {
			request.setAttribute("msg", "loginDeleteNo");
		}
		
		request.setAttribute("url", request.getContextPath()+"/urlMappingList.um");
	}

}
