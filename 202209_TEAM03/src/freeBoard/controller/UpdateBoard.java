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

/**
 * 자유게시판 게시글 수정
 * 
 * @author 박지은
 *
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 10,
	    maxFileSize = 1024 * 1024 * 30,
	    maxRequestSize = 1024 * 1024 * 100
)
@WebServlet("/freeboard/updateBoard.do")
public class UpdateBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* 자유게시판 게시글 수정페이지로 이동 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int bonum = Integer.parseInt(request.getParameter("bo_num"));
		
		// 서비스객체
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		
		// 원래게시글 불러오기
		FreeBoardVO board = service.getArticle(bonum);
		
		// 게시글번호를 키값에 담기
		request.setAttribute("board", board);
		
		request.getRequestDispatcher("/WEB-INF/view/free/freeBoardUpdate.jsp").forward(request, response);
	}
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		// 사용자가 업로드한 파일이 저장될 서버쪽의 폴더 경로 설정
		String uploadPath = "//192.168.145.32//공유폴더/405호 보강/3조중프파일/freeboard";
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		int bonum = Integer.parseInt(request.getParameter("free_num"));
		System.out.println("게시글 번호 : " + bonum);
		String title = request.getParameter("f_title");
		System.out.println("제목 : " + title);
		String content = request.getParameter("f_content");
		System.out.println("내용 : " + content);
		content = content.replace("\r\n", "<br>");
	    String region = request.getParameter("cityNameee");
	    System.out.println("지역 : "  + region);
	    String pname = request.getParameter("pname");
	    System.out.println("프로필닉네임 : " + pname);
		String old_photo = request.getParameter("old_photo");
	    
		// 받아온 게시글 정보를 VO에 저장한다.
		FreeBoardVO fvo = new FreeBoardVO();
		fvo.setFb_no(bonum);
		fvo.setFb_title(title);
		fvo.setFb_content(content);
		fvo.setFb_reg(region);
		fvo.setP_name(pname);
		fvo.setFb_pic(old_photo);
	
		
		Part part = request.getPart("free_pic");
		System.out.println(part);

		if(part!=null) {
			String fileName = extractFileName(part);   // Part구조 안에서 파일명을 찾는 메서드
			
			if(!fileName.equals("")) {
				try {
					part.write(uploadPath + File.separator + fileName);
					
					fvo.setFb_pic(fileName);  // DB에 저장할 파일명을 VO객체에 저장
				} catch (Exception e) {
					fvo.setFb_pic(null);  // 사진이 오류가 생기면...
				}
			}
		}
		
		// 게시글 정보를 DB에 update한다.
		IFreeBoardService service = FreeBoardServiceImpl.getInstance();
		int res = service.updateBoard(fvo);
		
		if(res != 0) {
			System.out.println("수정 성공!");	
		}else {
			System.out.println("수정 요청 실행실패");
		}
		
		// 작업이 완료되면 List페이지로 이동
		response.sendRedirect(request.getContextPath() + "/freeboard/freeBoardList.do");
		
	}

	// Part구조 안에서 파일명을 찾는 메서드
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
