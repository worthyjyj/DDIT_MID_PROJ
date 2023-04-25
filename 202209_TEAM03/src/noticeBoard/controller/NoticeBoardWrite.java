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
 * Servlet implementation class NoticeBoardWrite
 */
@WebServlet("/noticeBoardWrite.do")
@MultipartConfig(
fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
maxRequestSize = 1024 * 1024 * 100
)
public class NoticeBoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("WEB-INF/view/notice/noticeBoardWrite.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uploadPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/profile";
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("notice_title"); 
		String content = request.getParameter("notice_content");
		content = content.replace("\r\n", "<br>");
		
		noticeBoardVO nvo = new noticeBoardVO();
		nvo.setNotice_title(title);
		nvo.setNotice_content(content);
		nvo.setAdmin_id("admin");
		
		Part part = request.getPart("notice_pic");
		
		if(part!=null) {
			String fileName = extractFileName(part);
			
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);
					nvo.setNotice_pic(fileName);
				} catch (Exception e) {
					nvo.setNotice_pic(null);
				}
			}
		}
		
		INoticeBoardService service = NoticeBoardServiceImpl.getInstance();
		
		Object obj = service.insertNotice(nvo);
		

		
		response.sendRedirect(request.getContextPath() + "/noticeBoardList.do");
		
		
	}


	private String extractFileName(Part part) {
	      String fileName = "";
	      
	      String contentDisposition = part.getHeader("content-disposition");
	      String[] items = contentDisposition.split(";");
	      for(String item : items) {
	         if(item.trim().startsWith("filename")) { 
	            // filename = "test1.txt"
	            fileName = item.substring(item.indexOf("=")+2, item.length()-1);
	         }
	         
	      }
	      return fileName;
	   }

}
