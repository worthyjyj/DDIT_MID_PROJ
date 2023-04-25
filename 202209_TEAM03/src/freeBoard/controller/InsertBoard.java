package freeBoard.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import freeBoard.service.FreeBoardServiceImpl;
import freeBoard.service.IFreeBoardService;
import vo.FreeBoardVO;

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 10,
	    maxFileSize = 1024 * 1024 * 30,
	    maxRequestSize = 1024 * 1024 * 100
)
@WebServlet("/freeboard/insertBoard.do")
public class InsertBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/view/free/freeBoardWrite.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
		String uploadPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/freeboard";
		
		// 저장될 폴더가 없으면 폴더를 만들어 준다.
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		// 게시글 정보를 받는다.
		String title = request.getParameter("f_title");
		System.out.println("제목" + title);
		String content = request.getParameter("f_content");
		System.out.println("내용 : " + content);
		content = content.replace("\r\n", "<br>");
	    String region = request.getParameter("cityNameee");
	    System.out.println("지역 : "  + region);
	    String pname = request.getParameter("pname");
	    System.out.println("프로필닉네임 : " + pname);
	    
	    // 받아온 정보를 VO에 저장한다.
		FreeBoardVO fvo = new FreeBoardVO();
		fvo.setFb_title(title);
		fvo.setFb_content(content);
		fvo.setFb_reg(region);
		fvo.setP_name(pname);
		
		// form의 file입력요소의 name값은 Part객체의 이름역할을 한다.
		// 이 이름을 이용하여 Part객체를 구한다.
		Part part = request.getPart("free_pic");

		if(part!=null) {
			String fileName = extractFileName(part);
			
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName); // => 파일경로/파일이름
					
					fvo.setFb_pic(fileName); // DB에 저장할 파일명을 VO객체에 저장
				} catch (Exception e) {
					fvo.setFb_pic(null);
				}
			}
		}
		
		
		// 게시글 정보를 DB에 insert한다
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		service.insertBoard(fvo);
	
		// 작업이 완료되면 List페이지로 이동
		response.sendRedirect(request.getContextPath() + "/freeboard/freeBoardList.do");
		
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
