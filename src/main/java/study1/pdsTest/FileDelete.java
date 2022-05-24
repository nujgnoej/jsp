package study1.pdsTest;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/fileDelete")
public class FileDelete extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pdsTest/");
		String fName = request.getParameter("file");
		String aJaxFname = request.getParameter("fName") == null ? "" : request.getParameter("fName");
        
        if(aJaxFname.equals("")) {
            File file = new File(realPath + fName);
            // 존재 유무를 물어보는 메소드 .exists() true/false로 반환.
            if(file.exists()) {
                file.delete(); //서버 파일시스템에서 생성된 객체파일을 삭제처리한다.
                request.setAttribute("msg", "fileDeleteOk");
            }
            else {
                request.setAttribute("msg", "fileDeleteNo");
            }
            request.setAttribute("url", request.getContextPath()+"/downLoad1.st");
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/message/message.jsp");
            dispatcher.forward(request, response);
        }
        else {
            File file = new File(realPath + aJaxFname);
            if(file.exists()) {
                file.delete(); //서버 파일시스템에서 생성된 객체파일을 삭제처리한다.
                response.getWriter().write("fileDelteOk");
            }
            else {
                response.getWriter().write("fileDelteNo");
            }
        }
	}
}
