package study1.pdsTest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study1.StudyInterface;

public class DownLoad1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/data/pdsTest");
		
		String[] files = new File(realPath).list();
		
		for(String file : files) {
			System.out.println("files : " + file);
		}
		
		request.setAttribute("files", files);
	}

}
