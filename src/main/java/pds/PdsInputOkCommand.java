package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthDesktopIconUI;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;
import member.MemberDAO;
import member.MemberVO;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pds/");
		int maxSize = 1024 * 1024 * 20;
		String encoding = "UTF-8";
		
		// 파일 업로드 처리...
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 DB에 처리하기 위한 작업....
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String originalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			String file = (String) fileNames.nextElement();
			
			if(multipartRequest.getOriginalFileName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file) + "/";		// 파일올릴때 파일이름
				filesystemName += multipartRequest.getFilesystemName(file) + "/";			// DB에 올릴때 파일이름
			}
		}
		originalFileName = originalFileName.substring(0, originalFileName.length()-1);
		filesystemName = filesystemName.substring(0, filesystemName.length()-1);
		
		// 세션에서 아이디와 닉네임 가져오기
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nickName = (String) session.getAttribute("sNickName");
		
		// midIdx(member테이블의 회원 고유번호 : idx) 찾아오기.
		MemberDAO memberDao = new MemberDAO();
		MemberVO memberVo = memberDao.getUserInfor(mid);
		int midIdx = memberVo.getIdx();
		
		// 전송 폼의 값들 모두 받아오기
		int fSize = multipartRequest.getParameter("fileSize")==null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String title = multipartRequest.getParameter("title")==null ? "" : multipartRequest.getParameter("title");
		String part = multipartRequest.getParameter("part")==null ? "" : multipartRequest.getParameter("part");
		String pwd = multipartRequest.getParameter("pwd")==null ? "" : multipartRequest.getParameter("pwd");
		String openSw = multipartRequest.getParameter("openSw")==null ? "" : multipartRequest.getParameter("openSw");
		String content = multipartRequest.getParameter("content")==null ? "" : multipartRequest.getParameter("content");
		
		// 비밀번호 SHA-256 암호화
		SecurityUtil securityUtil = new SecurityUtil();
		pwd = securityUtil.encryptSHA256(pwd);
		
		// 앞에서 전송된 자료들과 가공된 자료들을 모두 vo에 담아서 DB에 저장할 수 있도록한다.
		PdsVO vo = new PdsVO();
		vo.setMid(mid);
		vo.setMidIdx(midIdx);
		vo.setNickName(nickName);
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		vo.setfSize(fSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setPwd(pwd);
		vo.setOpenSw(openSw);
		vo.setContent(content);
		
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "pdsInputOk");
			request.setAttribute("url", request.getContextPath()+"/pdsList.pds");
		}
		else {
			request.setAttribute("msg", "pdsInputNo");
			request.setAttribute("url", request.getContextPath()+"/pdsInput.pds");
		}
	}

}
