package noticeBoard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import noticeBoard.service.INoticeBoardService;
import noticeBoard.service.NoticeBoardServiceImpl;
import vo.noticeBoardVO;

/**
 * Servlet implementation class NoticeBoardUpdate
 */
@WebServlet("/noticeBoardUpdate.do")
@MultipartConfig
public class NoticeBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("notice_no"));
		
		INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
		noticeBoardVO nvo = service.detailNotice(no);
		String conctent = nvo.getNotice_content().replace("<br>", "\r\n");
		nvo.setNotice_content(conctent);
		
		request.setAttribute("nvo", nvo);
		request.getRequestDispatcher("/WEB-INF/view/notice/noticeBoardUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String uploadPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/profile";
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		
		
//		String nno = request.getParameter("notice_no");
//		int no = Integer.parseInt(nno);
		
		String title = request.getParameter("notice_title");
		String content = request.getParameter("notice_content");
		content = content.replace("\r\n", "<br>");
		int no = Integer.parseInt(request.getParameter("notice_no"));
		String old_pic = request.getParameter("old_pic");
		
		System.out.println(title);
		System.out.println(content);
		System.out.println(no);
		System.out.println(old_pic);
		
		noticeBoardVO nvo = new noticeBoardVO();
		nvo.setNotice_no(no);
		nvo.setNotice_title(title);
		nvo.setNotice_content(content);
		nvo.setNotice_pic(old_pic);
		
		Part part = request.getPart("notice_pic");
		if(part !=null) {
			String fileName = extractFilename(part);
			
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);
					nvo.setNotice_pic(fileName);
				} catch (Exception e) {
					
				}
			}
		}
		INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
		service.updateNotice(nvo);
		
		response.sendRedirect(request.getContextPath() + "/noticeBoardList.do");		
	}



private String extractFilename(Part part) {
	String fileName = "";
	
	String contentDisposition = part.getHeader("content-disposition");
	String[] items = contentDisposition.split(";");
	for(String item : items) {
		if(item.trim().startsWith("filename")) {  
			// filename="test1.txt"
			fileName = item.substring(item.indexOf("=")+2, item.length()-1);
		}
	}
	
	return fileName;
}

}